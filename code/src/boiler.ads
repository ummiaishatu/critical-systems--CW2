pragma SPARK_Mode;

with SPARK.Text_IO; use SPARK.Text_IO;

package boiler is

   Maximum : constant Integer := 300;

   Maximum_water : constant Integer := 1000;

   Critical_water : constant Integer := 1500;

   Critical_temperature : constant Integer := 212;

   Regular_temp : constant Integer := 40;

   Regular_Litre : constant Integer := 500;

   subtype T_Range is Integer range 0 .. Maximum;

   subtype Litre_range is Integer range 0 .. Maximum_water;

   type Boiler_Heat_Status_Type is (Reduced, Not_reduced);

   type Boiler_Cool_Status_Type is (Increased, Not_Increased);

   type Boiler_Status_Type is record
      Current_Litre_water         : Litre_range;
      Current_Temperature         : T_Range;
      Status_Reduced_temperature  : Boiler_Heat_Status_Type;
      Status_Increase_temperature : Boiler_Cool_Status_Type;
   end record;

   Boiler_Status : Boiler_Status_Type;

   procedure Fill_boiler with
     Global => (In_Out => (Standard_Output, Standard_Input)),
     Depends => (Standard_Output => (Standard_Output,Standard_Input),
     Standard_Input  => Standard_Input);

   procedure Accept_Temperature with
     Global => (In_Out => (Standard_Output, Standard_Input)),
     Depends => (Standard_Output => (Standard_Output,Standard_Input),
     Standard_Input  => Standard_Input);

   function Status_Reduced_temperature_Print
     (Status_Reduced_temperature : Boiler_Heat_Status_Type) return String;

   function Status_Increase_temperature_Print
     (Status_Increase_temperature : Boiler_Cool_Status_Type) return String;

   procedure Reduce_Temperature  with
     Global  => (In_Out => (Boiler_Status)),
     Depends => ((Boiler_Status) => (Boiler_Status)),
     Post    => heat_safe(Boiler_Status);

   procedure Increase_Temperature with
     Global  => (In_Out => (Boiler_Status)),
     Depends => ((Boiler_Status) => (Boiler_Status)),
     Post => Temp_to_boil(Boiler_Status);

   procedure Print_Status with
     Global => (In_Out => Standard_Output,
     Input  => Boiler_Status),
     Depends => (Standard_Output => (Standard_Output,Boiler_Status));

   procedure produce_steam;

   procedure Init with
     Global => (Output => (Standard_Output,Standard_Input,Boiler_Status)),
     Depends => ((Standard_Output,Standard_Input,Boiler_Status) => null),
     Post    => heat_safe(Boiler_Status);

   function heat_safe (Status : Boiler_Status_Type) return Boolean is
     (if (Integer (Status.Current_Temperature) > Critical_temperature) then
        Status.Status_Reduced_temperature = Reduced
      else Status.Status_Reduced_temperature = Not_reduced);

   function Temp_to_boil (Status : Boiler_Status_Type) return Boolean is
     (if (Integer (Status.Current_Temperature) < Regular_temp) then
        Status.Status_Increase_temperature = Increased
      else Status.Status_Increase_temperature = Not_Increased);
end boiler;
