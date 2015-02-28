
class WaveformRenderer implements AudioListener{
  private float[] left;
  private float[] right;
  
  WaveformRenderer(){
    left = null; 
    right = null;
  }
  
  synchronized void samples(float[] samp){
    left = samp;
  }
  
  synchronized void samples(float[] sampL, float[] sampR){
    left = sampL;
    right = sampR;
  }
}


