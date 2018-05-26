RUN ONCE better_rcs.

CLEARSCREEN.
PRINT "Starting".

SET STEERINGMANAGER:MAXSTOPPINGTIME TO 10.
SET STEERINGMANAGER:PITCHPID:KD TO 2.
SET STEERINGMANAGER:YAWPID:KD TO 2.
SET STEERINGMANAGER:PITCHTS TO 10.
SET STEERINGMANAGER:ROLLTS TO 5.

SET roll TO SHIP:FACING:ROLL.
LOCK STEERING TO HEADING(-85, 5).

PRINT "Steering locked".

WAIT UNTIL VANG(SHIP:FACING:FOREVECTOR, HEADING(-85, 5):VECTOR) < 2.

UNLOCK STEERING.

PRINT "Stopping".

UNTIL isStopped(SHIP) OR TERMINAL:INPUT:HASCHAR() {
  SET SHIP:CONTROL:ROTATION TO cancelMomentum(SHIP).
}
SET SHIP:CONTROL:NEUTRALIZE TO TRUE.

PRINT "Done".

//pointAt(SHIP, 90, 0, 0).

// Release all the ship controls.
//SET SHIP:CONTROL:NEUTRALIZE TO TRUE.
