
class Displayer
{
  float [] [] data;
  String path;
  int audioLength, buffer;
  boolean isPlaying = true;
  
  Displayer (String path, int buffer)
  {
    this.path = path;
    this.buffer = buffer;
    
    loadData ();
  }
  
  int getAudioLength()
  {
    return audioLength;
  }
  
  boolean isPlaying ()
  {
    return isPlaying;
  }
  
  void setisPlaying ()
  {
    isPlaying = !isPlaying;
  }
  
  float [] data (int pos)
  {
    pos = constrain (pos, 0, audioLength-1);
    
    float [] currentData = new float [buffer];
    
    for (int i = 0; i < buffer; i++)
    {
      currentData [i] = data [pos] [i];
    }
    
    return currentData;
  }
  
  void loadData ()
   {

     String [] rowText = loadStrings (path + ".txt");
     audioLength = rowText.length;
     data = new float [audioLength] [buffer];
     
     for (int i = 0; i < audioLength; i++)
     {
       String index = rowText [i];
       String [] dataAtIndex = splitTokens (index, " ");
       
       for (int j = 0; j < buffer; j++)
       {
         data [i] [j] = float (dataAtIndex[j]);
       }
     }
   }
}

