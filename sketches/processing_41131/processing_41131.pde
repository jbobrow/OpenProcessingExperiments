


import processing.video.*;


Capture video;

color trackColor; 

void setup() {
  size(700,600);
  video = new Capture(this,width,height,15);

  trackColor = color(255,0,0);
  smooth();
}

void draw() {
 
  if (video.available()) {
    video.read();
  }
  video.loadPixels();
  image(video,0,0);

  
  float worldRecord = 500; 

 
  int closestX = 0;
  int closestY = 0;

 
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc = x + y*video.width;
     
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

     
      float d = dist(r1,g1,b1,r2,g2,b2);

      
      if (d < worldRecord) {
        worldRecord = d;
        closestX = x;
        closestY = y;
      }
    }
  }

 
  if (worldRecord < 10) { 
       
    
      ellipseMode(CENTER);
    float r =random(255);
    


 stroke(110);
 strokeWeight(10);
 line(closestX-20,closestY+30,closestX-20,closestY+80);
 line(closestX+20,closestY+30,closestX+20,closestY+80);
 
 
 //Draw Frog's body
 noStroke();
 fill(225,252,0);
 ellipse(closestX,closestY,100,110);
 fill(255);
 ellipse(closestX,closestY-20,70,120);
 
 
 
 //Draw Frog's head
  noStroke();
  fill(225,252,0);
 ellipse(closestX,closestY-75,200,100);
 
 //Draw Frog's eyes
  noStroke();
   fill(225,252,r);
 ellipse(closestX-100,closestY-100,70,70);
 ellipse(closestX+100,closestY-100,70,70);
 
 //Draw Frog's eyes' ball
  stroke(110);
  strokeWeight(1.5);
  fill( trackColor );
 ellipse(closestX-100,closestY-100,50,50);
 ellipse(closestX+100,closestY-100,50,50);
 fill(110);
 ellipse(closestX-90,closestY-90,20,20);
 ellipse(closestX+90,closestY-90,20,20);
 
 //Draw Frog's highlight
  noStroke();
  fill(255);
 ellipse(closestX,closestY-100,40,20);
 
 //Draw Frog's mouth
 stroke(110);
 strokeWeight(3);
 noFill();
 arc(closestX,closestY-80,100,50,0,PI);
  }
}

void mouseMoved() {
  // Save color where the mouse is clicked in trackColor variable
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
}

