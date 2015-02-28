
import processing.video.*;
Capture video;
color trackColor; 

PImage white;
PImage redp;
PImage greenp;
PImage bluep;
PImage yellow;


int devisions = 10; // pixels
PFont font;
float xDiv;
float yDiv;




void setup() {
  white = loadImage("pebbles.jpg");
  redp = loadImage("red.jpg");
  greenp = loadImage("green.jpg");
  bluep = loadImage("blue.jpg");
  yellow = loadImage("yellow.jpg");
  size(640,480);
  video = new Capture(this,width,height,15);
  trackColor = color(255,0,0);
  smooth();
  xDiv = video.width/devisions;
  yDiv = video.height/devisions;
  println(xDiv);
}

void draw() {
  if (video.available()) {
    video.read();
  }
  video.loadPixels();
  image(video,0,0);

  float maxDist = 500; 

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

      if (d < maxDist) {
        maxDist = d;
        closestX = x;
        closestY = y;
      }
    }
  }

if (maxDist < 10) { 
  
    
  
  
    for(int i = 0; i < height; i+= devisions) {
      for(int j = 0; j < width; j+= devisions) {
        color filler = video.get(int(j),int(i));
        fill(filler);
        float value = brightness(filler);
     tint(value,value);
    // rect(j,i,value,value);
    color area = video.get(int(j),int(i));
    
    float R3d = red(area);
    float Blu = blue(area);
    float Grn = green(area);

    if(R3d<90 && Blu>130 && Grn<100) { //track blue
    image(bluep,j,i);}
     // fill(0, 0, 200);
     // rect(j,i,xDiv,yDiv);}
      
    if(R3d>130 && Blu<90 && Grn<90){ //track red
    image(redp,j,i);}
     // fill(200, 0, 0);
     // rect(j,i,xDiv,yDiv);}
      
      if(R3d<90 && Blu<90 && Grn>105){ //track green
      image(greenp,j,i);}
     // fill(0, 200, 0);
      //rect(j,i,xDiv,yDiv);}
      
      if(R3d>120 && Blu<90 && Grn>120){ //track yellow
      image(yellow,j,i);}
     // fill(200, 200, 0);
     // rect(j,i,xDiv,yDiv);}
      
     if(R3d>200 && Blu>200 && Grn>200){
      image(white,j,i);}
     
     //else {
        
    
     //image(white,j,i);}
   
         
      println(value);
      }
    }
  }
}

void mousePressed() {
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      devisions++;
    } else if (keyCode == DOWN) {
      devisions--;
    }
  }
  constrain(devisions,1,99);
}


