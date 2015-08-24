
open Async.Std

type t =
  {
    delay: Core.Span.t;
    f: int -> unit
  }

let every delay f = { delay; f }

let schedule_job { delay; f } =
  let rec run_job i =
    let clock_delay () = Clock.after delay in
    don't_wait_for (clock_delay () >>| fun () -> run_job (i + 1));
    don't_wait_for (clock_delay () >>| fun () -> f i)
  in
  
  run_job 0

let schedule_jobs =
  List.iter schedule_job
