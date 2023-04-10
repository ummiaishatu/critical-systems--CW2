pragma SPARK_Mode (On);

with boiler;        use boiler;
with AS_Io_Wrapper; use AS_Io_Wrapper;

procedure Main is

begin
   Init;
   Fill_boiler;
   loop
      pragma Loop_Invariant( heat_safe(Boiler_Status));
      Accept_Temperature;
      Reduce_Temperature;
      Increase_Temperature;
      Print_Status;
      exit when (Boiler_Status.Status_Reduced_temperature = Not_reduced) and
        (Boiler_Status.Status_Increase_temperature = Not_Increased);
   end loop;
   produce_steam;
end Main;
