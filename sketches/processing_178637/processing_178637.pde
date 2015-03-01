
String[] images = {
  "animal0.png", "animal1.png", "animal2.png", "animal3.png", 
  "animal4.png", "animal5.png", "animal6.png", "animal7.png" 
};
 
String[] lines = {
  "line0.png", "line1.png", "line2.png", "line3.png", 
"line4.png", "line5.png",   
}; 

import ddf.minim.*;

AudioPlayer song;
Minim minim;

 
float[] positions =new float [images.length*2] ;

 
// 0,1,2,3,4,5
// 4,5,6,7,8,9
float bx;
float by;
int bs = 40;
int bz = 30;
boolean bover = false;
boolean locked = false;
float bdifx = 0.0; 
float bdify = 0.0; 
PImage[] image1 = new PImage [images.length];
PImage[] line1 = new PImage [lines.length];
float newx, newy;
int whichImage;


////ending 
int b =800;
void setup() 
{
 minim = new Minim(this);
      song = minim.loadFile("test.mp3", 5048);
  
  imageMode (CENTER);
  size(1000, 600);
  bx = width/2.0;
  by = height/2.0;
 
  for (int i=0; i < images.length; i++) {
    image1 [i]= loadImage(images[i]); 
  } 
 
  for (int j=0; j < images.length*2; j+=2) {
    positions[j]= random(width);
    positions[j+1]= random(50,150);
  }
  
   for (int i=0; i < lines.length; i++) {
    line1 [i]= loadImage(lines[i]); 
  } 
 
  for (int j=0; j < lines.length*2; j+=2) {
    positions[j]= j*10;
    positions[j+1]= j*20;
  }
}
 
void draw() 
{ 
  
  song.play();
  
 background(255);
  // Test if the cursor is over the box 
 
 //ending
  strokeWeight(5);
  stroke(0);
for(int a=0; a<5; a++){
  line(0,300+a*30,width,300+a*30);
}

strokeWeight(3);
 fill(0);
 rect(b,300,10,120);
 line(b-5,300,b-5,420);
 b=b-1;
 
 if(b<0){
   b=width;
 }
noStroke();
 
  for (int i=0; i < images.length; i++) {
    if (mouseX > positions[i*2]-bs && mouseX < positions[i*2]+bs && 
      mouseY > positions[i*2+1]-bs && mouseY < positions[i*2+1]+bs) 
    {
      println ("mouseover image: "+i);
      whichImage=i;
 
      bover = true;  
      if (!locked) 
      { 
        stroke(255); 
        fill(153);
      }
      break;
    } 
    else
    {
      stroke(153);
      fill(153);
      bover = false;
    }
  }
 
  // Draw the box
  //rect(bx, by, bs, bs);
 
  for (int j=0; j < images.length; j++) {
    // image= loadImage(images[j]); 
    
   
    image (image1[j], positions[j*2], positions[j*2+1], 300, 300) ;
    //  newx = positions[j*2];
    //  newy = positions[j*2+1];
    //whichImage = j;
    //image(image, bx, by, bs, bz);
  }
}

void mousePressed() {
  if (bover) { 
    locked = true;
  } 
  else {
    locked = false;
  }
  //  bdifx = mouseX-bx; 
  // bdify = mouseY-by;
}
 
void mouseReleased() {
  locked = false;
  
 
  // Draw the box
  //rect(bx, by, bs, bs);
 
  for (int j=0; j < lines.length; j++) {
    // image= loadImage(images[j]); 
    
   
    image (line1[j], positions[j*2], positions[j*2+1], 300, 300) ;
    //  newx = positions[j*2];
    //  newy = positions[j*2+1];
    //whichImage = j;
    //image(image, bx, by, bs, bz);
  }
}

 
void mouseDragged() {
  if (locked) {
    newx = mouseX; 
    newy = mouseY;
  }
 
  // println ("whichImage = "+whichImage);
  positions [whichImage*2] = newx;
  positions [(whichImage*2)+1] = newy;
}

void stop() {
  super.stop();
}



