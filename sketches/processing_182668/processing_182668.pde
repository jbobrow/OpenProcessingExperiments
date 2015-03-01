
int posX;
int posY;
float x1;
float y1;
PImage img;


void setup(){
  size(500,500,P3D);
  background(0);
  posX=width/2;
  posY=height/2;
  x1=0;
  y1=0;
}

void draw(){
  background(255);
 
//stroke(255);
  //fill(255,0,0);
  if (mousePressed){
    posX=mouseX;
     posY=mouseY;
  } 
  
     x1=map(mouseX,0,width,0,360);
     y1=map(mouseY,0,height,0,360);
  
  translate(posX,posY,0);
  rotateY(radians(x1));
  rotateX(radians(y1));

   beginShape();
    texture(img);
   beginShape();
   for (int y=-20;y<=200;y++){
     vertex(-200,y,-200,0,400);
     vertex(200,y,-20,0,400);
     vertex(200,y,20,0,400);
     vertex(-200,y,20,0,400);
      vertex(-200,y,-20,0,400);
   }
   endShape();
  
}

