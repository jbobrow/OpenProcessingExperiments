
class BaselineScenario {
  Worker w;
  Machine m;
  OutputPile p;

  PVector inputQueueRotation = new PVector(0,HALF_PI,0);
  PVector outputQueueRotation = new PVector(0,-HALF_PI,0);
  PVector neutralRotation = new PVector(0,0,0);

  int workerState = 0, machineState = 0;
  VectorLerp workerLerp;
  VectorLerp machineLerp;

  BaselineScenario(Worker wToUse, Machine mToUse, OutputPile pToUse) {
    w = wToUse;
    m = mToUse;
    p = pToUse;
  }

  void advance(float now) {
    boolean done = false;
    while(!done) {
      done = true;
      switch(workerState) {
        case 0: // Idle
          workerState = 1; // Start turning toward the input queue
          workerLerp = new VectorLerp(neutralRotation,inputQueueRotation,now,now+2);
          w.rotation = workerLerp.lerp(now);
          break;
        case 1: // Turning toward the input queue
          if(now < workerLerp.bX) {
            w.rotation = workerLerp.lerp(now);
          } else {
            workerLerp = new VectorLerp(inputQueueRotation,neutralRotation,now,now+3);
            w.rotation = workerLerp.lerp(now);
            workerState = 2; // Start turning back toward the machine to load the part
          }
          break;
        case 2: // Turning toward the machine with an input part
          if(now < workerLerp.bX) {
            w.rotation = workerLerp.lerp(now);
          } else {
            workerState = 3; // Wait for the machine to finish
            machineState = 1;
          }
          break;
        case 3: // Waiting for the machine to finish
          if(machineState == 3) {
            machineState = 0;
            workerLerp = new VectorLerp(neutralRotation,outputQueueRotation,now,now+5);
            w.rotation = workerLerp.lerp(now);
            workerState = 4; // Start putting away the part
            done = false;
          }
          break;
        case 4: // Turning toward the output queue
          if(now < workerLerp.bX) {
            w.rotation = workerLerp.lerp(now);
          } else {
            workerLerp = new VectorLerp(outputQueueRotation,neutralRotation,now,now+2);
            w.rotation = workerLerp.lerp(now);
            workerState = 5; // Start turning back toward the machine
            p.howManyOutput++;
          }
          break;
        case 5: // Turning toward the machine from the output queue
          if(now < workerLerp.bX) {
            w.rotation = workerLerp.lerp(now);
          } else {
            workerState = 1; // Start turning toward the input queue
            workerLerp = new VectorLerp(neutralRotation,inputQueueRotation,now,now+2);
            w.rotation = workerLerp.lerp(now);
          }
          break;
      }
      switch(machineState) {
        case 0: // Idle
          break;
        case 1: // Starting a part, holding an input part
          machineState = 2;
          machineLerp = new VectorLerp(neutralRotation,neutralRotation,now,now+4);
          break;
        case 2: // Running a part
          if(now < machineLerp.bX) {
            // Nothing to do here, machine's don't yet have an animation
          } else {
            machineState = 3;
          }
          break;
        case 3: // Done with a part, holding a finished part
         done = false;
         break;
      }
    }
  }
}

