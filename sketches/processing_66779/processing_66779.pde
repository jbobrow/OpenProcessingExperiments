
float circle;
int colorcount;
int face;

PImage intro;
PImage face1;
PImage face2;
PImage face3;
PImage face4;
PImage face5;

void setup(){
  size(500, 500);
  smooth();
  imageMode(CENTER);
  colorcount=0;
  face=0;
  intro = loadImage("intro.jpg");
  face1 = loadImage("face1.jpg");
  face2 = loadImage("face2.jpg");
  face3 = loadImage("face3.jpg");
  face4 = loadImage("face4.jpg");
  face5 = loadImage("face5.jpg");
  
  background(intro);
}

void mouseDragged(){
  noStroke();
  ellipse(mouseX, mouseY, 5*circle, 5*circle);
}


void keyPressed(){
  
  if (keyCode == UP) {
    circle++;
  }
  
  if (keyCode == DOWN) {
    circle-=1;
  }

//Color Toggle
 if (keyCode == LEFT){
   colorcount++;
 }

 if (colorcount == 0){
   fill(0);
 }

 if(colorcount == 1){
   fill(220, 20, 60);
 }
 
 if (colorcount == 2){
   fill(155, 48, 255);
 }
 
 if (colorcount == 3){
   fill(72, 118, 255);
 }
 
 if (colorcount == 4){
   fill(0, 255, 127);
 }
 
 if (colorcount == 5){
   fill(255, 255, 0);
 }
 
 if (colorcount == 6){
   fill(255, 97, 3);
 }
 
 if (colorcount == 7){
   fill(random(0,255), random(0, 255), random(0, 255));
 }
 
 if (colorcount > 6){
   colorcount = 0;
 }
 



//Face Toggle
if (keyCode == RIGHT){
  face++;
}

 if(face == 0){
   background(255);
 }
 
 if(face == 1){
   background(face1);
 }
 
 if(face == 2){
   background(face2);
  }
  
 if(face == 3){
   background(face3);
 }

 if(face == 4){
   background(face4);
 }
 
  if(face == 5){
   background(face5);
  }
  
  if(face > 5){
   face = 0;
  }
}

void draw(){
  ellipse(450, 450, 5*circle, 5*circle);
}



  


