
/*Arrays for tracking live and peak values*/
float[] live_value = new float[60];  
float[] live_accum = new float[60];  
float live_multi = .095;    //Multiplier for smoothing the live tracking. 1= no smoothing, lower = smoother
int[] peak_value = new int[60];      
int[] peak_multi = new int[60];      
int[] peak_angle = new int[60];      
int reading = 0;     //Stores current value

/*Noise adjustment variables*/
float xoff = 0.0;
float xincrement = .35;

void setup()
{
  size(900, 245);
  background(0);
  frameRate(60);
  smooth();
  noStroke();   //Speeds up animation
  noiseDetail(3);
}

void draw()
{
  for(int x=0; x<60; x++){  //Loop through each column of the display.
    reading = int(noise(xoff)*65536);    //Generate random noise for each column.
    xoff += xincrement;
    if(reading > live_value[x]){   //If the current noise is greater than it was:
      live_value[x] = reading;  //Ride the noise to the top.
      live_accum[x] = reading;
    }
    else{   //If the current noise is lower than it was:
      live_value[x] = live_multi + ((1-live_multi)*live_accum[x]);  //Smoothly decay the displayed reading
      live_accum[x] = live_value[x];      
    }
    if(reading > peak_value[x]){    //If the current noise is greater than the last peak:
      peak_value[x] = reading;      //Ride it to the top,
      peak_multi[x] = reading;
      peak_angle[x] = 90;    //and reset the decay.
    }
    else{     //If the current noise is lower than the last peak:
      peak_value[x] = int(float(peak_multi[x])*(sin(radians(peak_angle[x]))));    //Let the peak fall like gravity.
      peak_angle[x] += 5;
      if(peak_angle[x] > 180){    //Keeps the peak from animating below zero noise.
        peak_angle[x] = 180;   
      }
    }
    for(int y = 0; y <= 16; y++){    //Cycle through the display rows for each column.
      if(y == int(float(peak_value[x])/65536*16)){  //If the current row is a peak:
        fill(255, 255, 255);
        ellipse((width)/60*x+6, 240/16*(16-y)-5, 10, 10);    //Draw a white circle for the peak.
      }
      else if (y < int((live_value[x])/65536*16)){   //Or if the current row is part of the noise column:
        fill(255, 255/10*y, 0);
        ellipse((width)/60*x+6, 240/16*(16-y)-5, 10, 10);   //Draw a circle fading from red (bottom) to yellow(top).
      }
      else {   //If the current row is not noise or a peak:
        fill(0,0,0);
        ellipse((width)/60*x+6, 240/16*(16-y)-5, 13, 13);   //Erase the last frame's circle.
      }
    }
  }
}





