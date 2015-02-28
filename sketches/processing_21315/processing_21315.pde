
class Checkpoint
{
  float X, Y;
  
  int[] OpenCP;
  int OpenCPNumber;
  
  Checkpoint(float X_, float Y_)
  {
    X = X_;
    Y = Y_;
    
    OpenCP = new int[CheckpointNumber];
  }

}

