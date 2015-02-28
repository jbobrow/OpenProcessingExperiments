
PImage bird,bird2,bird3, bg;
float xpos;
float ypos;
float errything;
float size1;


int sc = 40;
float pos1 = 0;
float pos2 = 0;
float pos3 = 0;
float pos4 = 0;
int i = 45;
int j = 225;
float drag = 60;




void setup(){
  
  size(600 ,426);
  bg = loadImage("parkworld.gif");
  bird = loadImage("bird.gif");
  bird2 = loadImage("bird.gif");
  bird3 = loadImage("bird.gif");
  xpos = width/2;
  ypos = height/2;
  smooth();
  errything = dist(0,0,width,height);
}

void draw(){
  background(bg);
    for(int i = 0; i <= width; i += 20) {
    for(int j = 0; j <= height; j += 20) {
   size1 = dist(mouseX, mouseY,i,j);
  size1 = size1/errything * 50;
    }
    }
  image(bird, pos1, pos2,100,100);
  image(bird2,pos3+55,pos4-67,100,100);
  image(bird3, pos3+50,pos2-145,100,100);
 
 float xDif = mouseX - xpos-bird.width/2;
 float yDif = mouseY - ypos-bird.height/2;
 

 
 if( abs(xDif) > 1){
   
   xpos = xpos + xDif/drag;
   xpos = constrain(xpos,0,width-bird.width);
 }
 
  if( abs(yDif) > 1){
   
   ypos = ypos + yDif/drag;
   ypos = constrain(ypos,0,height-bird.height);
 }
 
 

 
 
 
 
 
 
 
 
 
 

  i += 3;
  j += 3;
  
  if( i > 405){
    i = 45;
    j = 225;
  }
  
  float ang1 = radians(i);
  float ang2 = radians(j);
  
  pos1 = mouseX + (sc * cos(ang1));
  pos2 = mouseY/2 + (sc * sin(ang2));
  pos3 = mouseX/2 +(sc * sin(ang1));
  pos4 = mouseY/2 + (sc * cos(ang2));
  
 
  
}



