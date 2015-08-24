
type t

val every: Core.Span.t -> (int -> unit) -> t

val schedule_job: t -> unit

val schedule_jobs: t list -> unit
