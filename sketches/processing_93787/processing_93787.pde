
PImage motif1; 
PImage motif2;
PImage eye1;
PImage eye2;
PImage eye3;
boolean paused = false;
float genius;


float appeara;
int aspect = 1;
int aspecta = 5;
int aspectb = 5; 
int grow = 1;
int wubbs = 400;
int wubbs2 = 200;
int wubbs3 = 600;
 
 
 
void setup(){
  size(800,800);
  background(20);
  noStroke();
  loop();
  frameRate(325);
  motif1 = loadImage("Eyes Collage.png");
  motif2 = loadImage("trial.png");
  eye1 = loadImage("eye1.png");
  eye2 = loadImage("eye2.png");
  eye3 = loadImage("eye3.png");
}
 
 
 
void draw(){
  if(!paused){
  genius = random(-8, 2.0);
  image(motif1, random(-width,width), random(-height,height), motif1.width/genius, motif1.height/genius);
}
  if(!paused){
  genius = random(-8, 1.0);
  image(motif1, random(-width,width), random(-height,height), motif1.width/genius, motif1.height/genius);
   
 
 
   
  image(motif1, mouseX, mouseY, motif1.width/genius/5, motif1.height/genius/5);
  }
  
  fill(30,20);
  rect(0,0,800,800);
   
  stroke(20);
  line(0,0,mouseX,mouseY);
  line(0,800,mouseX,mouseY);
  line(800,0,mouseX,mouseY);
  line(800,800,mouseX,mouseY);
  line(200,300,mouseX,mouseY);
  line(700,500,mouseX,mouseY);
  
  if(!paused){
  if (mouseX>400) {
     wubbs = wubbs+1;
     wubbs2 = wubbs2+1;
     wubbs3 = wubbs3+1;
     aspect = aspect-1;
     grow = grow -5;
     aspecta = aspecta -3;
     aspectb = aspectb+3;
}

  fill (0,0,0,20);

  image(eye1,50,100 , aspect, aspect);
  image(eye1,240,400 , aspect, aspect);

  image (eye2, 800, 800, aspect, aspect);
  image (eye2, 800, 600, aspectb,aspectb);
  
  image (eye3, 750, 25, aspecta, aspecta);
  image (eye3, 19, 690, aspect, aspect);
  
  if(mouseX<400) {
  aspect = aspect + 1;
  wubbs=wubbs-1;
  wubbs2=wubbs2-1;
  wubbs3=wubbs3-1;
  grow = grow +5;
  aspecta = aspecta + 3;
  aspectb = aspectb -3; 
} 
}

 
}

//PAUSE AND CLEAR ACTIONS 
void keyPressed(){
 if (key == ' '){
//if (paused) means that paused == true;
//make the program restart again
 if (paused==true){
 paused = false;
 }
 else{
 paused = true;
}
}
 if (key == 'c'){
 background(20);
}
}


void mousePressed(){
  image(motif2, mouseX, mouseY, motif2.width, motif2.height);
 
}



