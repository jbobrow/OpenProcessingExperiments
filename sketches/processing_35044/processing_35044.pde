
class Input
{
  int  inputDimension;
  float [] v; // weight vectors

  Input(int n)
  {
    inputDimension = n;
    v = new float[inputDimension];
    // initialize weight vectors to random values
    for(int i = 0; i < inputDimension; i++) 
    {
      v[i] = random(0.1, 0.9); // fill weight with random values
     }//for i
  
  }//Input

}//class input

