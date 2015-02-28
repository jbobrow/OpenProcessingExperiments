

import codeanticode.gsvideo.*;

// Variable for capture device
GSCapture video;


void setup() {
  size(640, 480, P3D);
  frameRate(20);
 

  // Uses the default video input, see the reference if this causes an error
  video = new GSCapture(this, width, height);
  video.start();
  
  video.loadPixels();
  background(0);
}


void draw() { 
    if (video.available()) {
    video.read();
    image(video,0,0);
    }
    background(0);
  
    int eSize = mouseX;
    
    int b1 = 0;
    int b2 = 0;
    int r1 = 0;
    int r2 = 0;
    int g1 = 0;
    int g2 = 0;
    int blu1 = 0;
    int blu2 = 0;
    
    //takes video pixel array, if pixel array is half than length
    //that half of the pixels are added to the array
    for (int i = 0; i < video.pixels.length ; i++){
       if(i > video.pixels.length/2){
         b2 += brightness(video.pixels[i]);
         r2 += red(video.pixels[i]);
         g2 += green(video.pixels[i]);
         blu2 += blue(video.pixels[i]);
       } else {
         b1 += brightness(video.pixels[i]);
         r1 += red(video.pixels[i]);
         g1 += green(video.pixels[i]);
         blu1 += blue(video.pixels[i]);
       }
     }
   
   println("b2 = " + b2 + " r2 = " + r2);
   
   // creates a variable dividing the amount per color in 
   // the array with the overall length of the array
   int brightTop = int(b1)/video.pixels.length;
   int brightBot = int(b2)/video.pixels.length;
   int redTop = int(r1)/video.pixels.length;
   int redBot = int(r2)/video.pixels.length;
   int greenTop = int(g1)/video.pixels.length;
   int greenBot = int(g2)/video.pixels.length;
   int bluTop = int(blu1)/video.pixels.length;
   int bluBot = int(blu2)/video.pixels.length;
   
   println("redTop = " + redTop);
   
   //maps the above variables on a scale from 0 - 255
   float s1 = map(brightTop, 1, 255, 0, (width+height)/2);
   float s2 = map(brightBot, 1, 255, 0, (width+height)/2);
   float redAve1 = map(redTop, 1, 255, 0, (width+height)/2);
   float redAve2 = map(redBot, 1, 255, 0, (width+height)/2);
   float greAve1 = map(greenTop, 1, 255, 0, (width+height)/2);
   float greAve2 = map(greenBot, 1, 255, 0, (width+height)/2);
   float bluAve1 = map(bluTop, 1, 255, 0, (width+height)/2);
   float bluAve2 = map(bluBot, 1, 255, 0, (width+height)/2);
    
    
    stroke(0);
    line(0, height/2, width, height/2);
    
    //setup ellipse
    ellipseMode(CENTER);
    noFill();
    //ellipse b1
    stroke(brightTop);
    ellipse(width/2,height/3,s1,s1);
    
    //ellipse b2
    stroke(brightBot);
    ellipse(width/2,height*2/3,s2,s2);
    
    //ellipse r1
    stroke(redAve1);
    ellipse(width/2,0,redAve1,redAve1);
    //ellipse r2
    
    
    //ellipse rotate
    pushMatrix();
    translate(width/2,height/2);
  
    int circles = 3;
    int arms = brightTop - brightBot;
    
    //multiplies arms draws circles
    for (int i = 0; i < arms; i++) {
      //rotates arms
      rotate((2*PI)/arms);
      
      fill(255);
      noFill();
      stroke(255);
      strokeWeight(2);
  
      float sFill = 0;
      float w = width/(circles);
      
      for (int j = 0; j < circles ; j++) {
        if (j % 3 == 0) {
          stroke(redAve1,0,0);
          sFill = w*redAve1/255 + w*redAve2/255;
        }
        else if( j % 3 == 1) {
          sFill = w*bluAve1/255 + w*bluAve2/255;
        }
        else if (j % 3 == 2) {
          sFill = w*greAve1/255 + w*greAve2/255;
        }
        ellipse(0,j*w+sFill,sFill,sFill);
        rect(0,0,sFill,sFill);
      }
      //rectangle
      println("sFill = " + sFill);
      println("circles = " + circles);

    }
    popMatrix();
    filter(BLUR,3);

}

