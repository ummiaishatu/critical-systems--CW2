pragma SPARK_Mode;

with AS_Io_Wrapper; use AS_Io_Wrapper;

package body boiler is
   -- the program works when you remove the integers of fill_boiler and Accept_temperature and include it outside the procedure.
   -- the program works when you change Boiler_Status.Current_Temperature to temperature
   -- the programs works when you change Boiler_Status.Current_Litre_water to Litre_water
   -- i had to do the program like this because of the dependency clauses, they kept giving out errors when they should not.
   -- in order for the dependencies to be successful, i had to make the program complie to them.
   -- without  changing all of this the program will set temperature and litre to zero.
   procedure Fill_boiler is
      Litre_water : Integer;
   begin
      AS_Put("Fill the boiler measure(in litres): ");
      loop
         AS_Get(Litre_water, "Please try again: ");
         exit when
         (Litre_water >= Regular_Litre) and (Litre_water <= Critical_water);
         AS_Put ("Please type in a litre value between ");
         AS_Put (Regular_Litre);
         AS_Put (" and ");
         AS_Put (Maximum_water);
         AS_Put_Line ("");
      end loop;
      if ((Litre_water >= Regular_Litre) and (Litre_water <= Maximum_water))
      then AS_Put_Line("Boiler is filled....");
      elsif (Litre_water > Maximum_water)
      then
         AS_Put("Fill the boiler to fit the required measurement to avoid leaking: ");
         loop
            AS_Get(Litre_water, "Please try again: ");
            exit when (Litre_water >= Regular_Litre) and (Litre_water <= Maximum_water);
            AS_Put ("Please type in a litre value between ");
            AS_Put (Regular_Litre);
            AS_Put (" and ");
            AS_Put (Maximum_water);
            AS_Put_Line ("");
         end loop;
         if ((Litre_water >= Regular_Litre) and (Litre_water <= Maximum_water))
         then AS_Put_Line("Boiler is filled....");
         else
            AS_Put_Line("");
         end if;
      else
         AS_Put_Line("");
      end if;
   end Fill_boiler;


   procedure Accept_Temperature is
      Temperature : Integer;
   begin
      AS_Put
        ("Please type in a temperature to boil water and produce steam: ");
      loop
         AS_Get (Temperature, "Please try again: ");
         exit when (Temperature) >= 0 and (Temperature <= Maximum);
         AS_Put ("Please type in a temperature value between ");
         AS_Put (Regular_temp);
         AS_Put (" and ");
         AS_Put (Maximum);
         AS_Put_Line ("");
      end loop;
   end Accept_Temperature;

   function Status_Reduced_temperature_Print
     (Status_Reduced_temperature : Boiler_Heat_Status_Type) return String
   is
   begin
      if (Status_Reduced_temperature = Reduced) then
         return "Sorry that temperature is too high could cause an accident Maximum: 212.....";
      else
         return "No need for Reduction.....";
      end if;
   end Status_Reduced_temperature_Print;

   function Status_Increase_temperature_Print
     (Status_Increase_temperature : Boiler_Cool_Status_Type) return String
   is
   begin
      if (Status_Increase_temperature = Increased) then
         return "That temperature is too low to boil the water.....";
      else
         return "No need for Increament.....";
      end if;
   end Status_Increase_temperature_Print;

   procedure Print_Status is
   begin
      AS_Put
        (Status_Reduced_temperature_Print
           (Boiler_Status.Status_Reduced_temperature));
      AS_Put_Line ("");
      AS_Put
        (Status_Increase_temperature_Print
           (Boiler_Status.Status_Increase_temperature));
      AS_Put_Line ("");
            AS_Put ("Current Temperature = ");
      AS_Put (Integer (Boiler_Status.Current_Temperature));
      AS_Put_Line ("");
      AS_Put ("Current Litre in Boiler = ");
      AS_Put (Integer (Boiler_Status.Current_Litre_water));
      AS_Put_Line ("");
   end Print_Status;

   procedure Reduce_Temperature is
   begin
      -- the program works when you change Boiler_Status.Current_Temperature to temperature
      if Integer(Boiler_Status.Current_Temperature) > Critical_temperature
      then
         Boiler_Status.Current_Temperature := Critical_temperature;
         Boiler_Status.Status_Reduced_temperature := Reduced;
      else
         Boiler_Status.Current_Temperature :=
           Boiler_Status.Current_Temperature;
         Boiler_Status.Status_Reduced_temperature := Not_reduced;
      end if;
   end Reduce_Temperature;

   procedure Increase_Temperature is
   begin
      -- the program works when you change Boiler_Status.Current_Temperature to temperature
      if Integer(Boiler_Status.Current_Temperature) < Regular_temp then
         Boiler_Status.Current_Temperature := Regular_temp;
         Boiler_Status.Status_Increase_temperature := Increased;
      else
         Boiler_Status.Status_Increase_temperature := Not_Increased;
      end if;
   end Increase_Temperature;

   procedure produce_steam is
   begin
      -- the programs works when you change Boiler_Status.Current_Litre_water to Litre_water
      if (Boiler_Status.Current_Litre_water >= Regular_Litre) and (Boiler_Status.Current_Litre_water <= Maximum_water)
        and (Boiler_Status.Status_Reduced_temperature = Not_reduced) and (Boiler_Status.Status_Increase_temperature = Not_Increased)
      then
         AS_Put_Line("Steam produced.....");
      else
         AS_Put_Line("");
      end if;
   end produce_steam;

   procedure Init is
   begin
      AS_Init_Standard_Input;
      AS_Init_Standard_Output;
      Boiler_Status :=
        (Current_Temperature => 0, Status_Reduced_temperature => Not_reduced,
         Status_Increase_temperature => Not_Increased, Current_Litre_water => 0);
   end Init;
-- i had to do the program like this because of the dependency clauses, they kept giving out errors when they should not.
end boiler;
