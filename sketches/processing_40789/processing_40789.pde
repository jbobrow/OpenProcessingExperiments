
// This class is a very simple implementation of AudioListener. By implementing this interface, 
// you can add instances of this class to any class in Minim that implements Recordable and receive
// buffers of samples in a callback fashion. In other words, every time that a Recordable object has 
// a new buffer of samples, it will send a copy to all of its AudioListeners. You can add an instance of 
// an AudioListener to a Recordable by using the addListener method of the Recordable. If you want to 
// remove a listener that you previously added, you call the removeListener method of Recordable, passing 
// the listener you want to remove.
//
// Although possible, it is not advised that you add the same listener to more than one Recordable. 
// Your listener will be called any time any of the Recordables you've added it have new samples. This 
// means that the stream of samples the listener sees will likely be interleaved buffers of samples from 
// all of the Recordables it is listening to, which is probably not what you want.
//
// You'll notice that the three methods of this class are synchronized. This is because the samples methods 
// will be called from a different thread than the one instances of this class will be created in. That thread 
// might try to send samples to an instance of this class while the instance is in the middle of drawing the 
// waveform, which would result in a waveform made up of samples from two different buffers. Synchronizing 
// all the methods means that while the main thread of execution is inside draw, the thread that calls 
// samples will block until draw is complete. Likewise, a call to draw will block if the sample thread is inside 
// one of the samples methods. Hope that's not too confusing!

class WaveformRenderer implements AudioListener
{
  private float[] left;
  private float[] right;
  int r;
  int b; 
  int counter;

  
  WaveformRenderer()
  {
    left = null; 
    right = null;
    color col;
    r = 255;
    b = 0;
    counter = 0;

  }
  
  synchronized void samples(float[] samp)
  {
    left = samp;
  }
  
  synchronized void samples(float[] sampL, float[] sampR)
  {
    left = sampL;
    right = sampR;
  }
  
  void switchColor(){
    counter++;
  }
  synchronized void draw()
  {
    // we've got a stereo signal if right or left are not null

  pushMatrix();

    if ( left != null && right != null )
    {
//      r++;

      noStroke();
      beginShape();
      int ran = 5;//round(random(1, 50));


      for ( int i = 0; i < left.length; i+=ran)
      {
       // println(25*abs(left[i])+2);
float op = 4*abs(left[i])+1;
println(counter);
        if(counter == 0){
         fill(0); 
        }

        if (counter == 1){
        fill(0, 0, 255, 15);
        }
        
        if (counter == 2){
        fill(185, 13, 16, 15);
        }
        
        if (counter == 3){
          fill(29, 16, 85, 5);
        }
        
        if (counter == 4){
        fill(33, 71, 203, 2 );
        }
        
        if (counter == 5){
        fill(22, 201, 44, 1.5 );
        }
        
        if (counter == 6){
        fill(220, 0, 0, 10);
        }
        
        
        
               
        
        ellipse(i, height/4+left[i]*500, 5, 5);

        //vertex(i, height/4 + left[i]*50);
      }
      endShape();
//      beginShape();
//      for ( int i = 0; i < right.length; i++ )
//      {
//        vertex(i, 3*(height/4) + right[i]*50);
//      }
//      endShape();
    }
    else if ( left != null )
    {
      noFill();
      stroke(255);
      beginShape();
      for ( int i = 0; i < left.length; i++ )
      {

        vertex(i, height/2 + left[i]*50);
      }
      endShape();
    }
    popMatrix();
  }
}

