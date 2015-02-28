
import pitaru.sonia_v2_9.*; // automcatically added when importing the library from the processing menu.
import processing.video.*;

Movie myMovie;

void setup()
{
   Sonia.start(this); // Start Sonia engine.
   LiveInput.start(256); // Start LiveInput and return 256 FFT frequency bands.
size(640, 480, P2D);
background(0);
                      frameRate(20);
                      myMovie = new Movie(this, "building.mp4");
                      myMovie.loop();
}    
                      void movieEvent(Movie myMovie) {
                        myMovie.read();
                          }

void draw()
{
           //float between values 0.0 and 1.0
    // float meterDataLeft = LiveInput.getLevel();
           //float meterDataRight = LiveInput.getLevel();
     float fftValue = LiveInput.getLevel();
           //getMeterLevel(); // Show meter-level reading for variable fftValue
                   
                     image(myMovie, 0, 0, width, height); // display movie
                      
                       if(fftValue < 0.2 ) { 
                       myMovie.speed(2.0); 
                     }
                       
                       if((fftValue > 0.2) && (fftValue < 0.4)) {
                             myMovie.speed(0.2);
                           } else { myMovie.play(); }
                       
                   
                       if(fftValue > 0.4) {
                         myMovie.speed(-1.5);
                            
                      
                     }
                    
     println(fftValue);      
}


public void stop()
{
    Sonia.stop();
    super.stop();
}



