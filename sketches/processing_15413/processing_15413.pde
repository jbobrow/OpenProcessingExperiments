

import pitaru.sonia_v2_9.*; // automcatically added when importing the library from the processing menu.

void setup(){
   size(1024, 768);
   noCursor();
   Sonia.start(this); // Start Sonia engine.
   LiveInput.start(256); // Start LiveInput and return 256 FFT frequency bands.
}

void draw(){
  noCursor();
   background(0);
   getMeterLevel(); // Show meter-level reading for Left/Right channels.
   getSpectrum(); // Show FFT reading
   }

void getSpectrum(){
   strokeWeight(2);
   stroke(255);

  // populate the spectrum array with FFT values.
   LiveInput.getSpectrum();
   // draw a bar for each of the elements in the spectrum array.
   // Note - the current FFT math is done in Java and is very raw. expect optimized alternative soon.
   for ( int i = 0; i < LiveInput.spectrum.length; i++){
    
      //line(i*20, height, i*20, height - LiveInput.spectrum[i]);
    
     // line(i*20, 0, width, i*20-LiveInput.spectrum[i]);
       //   line(0, i*20, i*20-LiveInput.spectrum[i], width);
        //   line(width/2, 0, i*20-LiveInput.spectrum[i], width);
        //   line(0, i*20-LiveInput.spectrum[i], i*20-LiveInput.spectrum[i], height);
          // line(0, i*20-LiveInput.spectrum[i], width, i*20-LiveInput.spectrum[i]); 
         //  line(width, height, i*20-LiveInput.spectrum[i], 0);
          // line(i*20-LiveInput.spectrum[i], i*20-LiveInput.spectrum[i], i*20-LiveInput.spectrum[i], i*20-LiveInput.spectrum[i]);
          
        ellipse( width/4, height/2, i*20-LiveInput.spectrum[i], i*20-LiveInput.spectrum[i]);
        ellipse( width-width/3, 300, i*20-LiveInput.spectrum[i], i*20-LiveInput.spectrum[i]);
  
   }
   
   
}


void getMeterLevel(){
   // get Peak level for each channel (0 -> Left , 1 -> Right)
   // Value Range: float from 0.0 to 1.0
   // Note: use inputMeter.getLevel() to combine both channels (L+R) into one value.
   float meterDataLeft = LiveInput.getLevel();
   float meterDataRight = LiveInput.getLevel();

   // draw a volume-meter for each channel.
 //  fill(0,100,0);
   float left = meterDataLeft*height;
   float right = meterDataRight*height; 
   //rect(width/2 - 100, height, 100 , left*-1);
  // rect(width/2 , height, 100, right*-1);
   
 
  stroke(255); //white guys
noFill();

/*stroke(0, 0, 255);
for (int j = 20; j<width; j+=50){
  ellipse (j, height-height/4, right, right +20);
  
 
}*/
  
  /*
  stroke(200);
   ellipse(right, width/2, right, right);
   ellipse(width/4, right, right, right);
   ellipse(right, width/8, right, right);
   ellipse(width/8, right, right, right);
   
   stroke(255, 0, 0); //red guys
   ellipse(width-width/8, height/2, right/2, right/2);
   ellipse(right, right, right, right);
   ellipse(height-400, right, right, right);
   
   
   /*for (int b = 0; b < width; b+= 800){
   ellipse(b, 400, right, right);
   }*/
   
}

// Safely close the sound engine upon Browser shutdown.
public void stop(){
    Sonia.stop();
    super.stop();
}


