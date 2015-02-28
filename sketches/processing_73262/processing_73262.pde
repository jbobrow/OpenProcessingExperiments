
import ddf.minim.*;

AudioPlayer ap;
Minim minim;
PImage pink;



void setup() {
  size(600, 600);
  frameRate(8);

  smooth();
  minim = new Minim(this);
  ap = minim.loadFile("Please Don't Leave Me.mp3");
  ap.play();
  pink = loadImage("pink.jpg");
  
}

void draw() {

  
  noStroke();
  smooth();
  float level = ap.mix.level();
   float w = level * width;
  float h = level * 800;
  
  for(int i =0 ; i<600; i = i+100){
    for (int j = 0; j<600; j = j+100)
    {
  image(pink, i, j);
 
 
  
    }
  }
  
  for(int i =0 ; i<300; i = i+50){
    for (int j = 0; j<300; j = j+50)
    {
      noFill();
      stroke(200,50,150);
  strokeWeight(1);
  rect(i,j,h,h);
 
    }
  }
  for(int i =300 ; i<600; i = i+50){
    for (int j = 300; j<600; j = j+50)
    {
      noFill();
      stroke(200,150, 50);
  strokeWeight(1);
  rect(i,j,h,h);
 
    }
  }
  for(int i =300 ; i<600; i = i+50){
    for (int j = 0; j<300; j = j+50)
    {
      noFill();
      stroke(50,150, 200);
  strokeWeight(1);
  rect(i,j,h,h);
 
    }
  }
  for(int i =0 ; i<300; i = i+50){
    for (int j = 300; j<600; j = j+50)
    {
      noFill();
      stroke(50,200, 150);
  strokeWeight(1);
  rect(i,j,h,h);
 
    }
  }
  
   fill(200,50,150,100);
  rect(0,0,300,300);
  fill(50,200, 150, 100);
  rect(0,300,300,300);
  fill(50,150, 200, 100);
  rect(300,0,300,300);
   fill(200,150, 50, 100);
   rect(300,300,300,300);
 
  fill(random(0,50), random(0,50),random(0,50),250);
   stroke(0);
  ellipse(width/2,height/2,w,w);
  noFill();
  strokeWeight(1);
   ellipse(width/2,height/2,h*1.5,h*1.5);
  ellipse(width/2,height/2,h,h);
 
   
  
  
  
}

