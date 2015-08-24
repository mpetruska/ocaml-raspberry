
let delay = Core.Span.of_sec 0.01

let jobs =
  Periodic.([
    every delay (fun i -> print_endline (Printf.sprintf "A [%d] - %.0f" i (Unix.time())));
    every (Core.Span.of_sec 1.0) (fun i -> print_endline "sec!")
  ])

let schedule_jobs () =
  Periodic.schedule_jobs jobs

let () =
    Async.Std.Scheduler.go_main ~main:schedule_jobs () |> Core.Std.never_returns
