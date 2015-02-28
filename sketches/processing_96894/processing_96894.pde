
float x,y;
float oldX,oldY;
float dist=40;
float angle = 0;
float big = TWO_PI/3;
float small = TWO_PI/3;

void setup(){
 size(900,700);
 x= width/2;
 y = height/2;
 oldX = x;
 oldY = y;
 stroke(255,80);
 background(0);
 
}

void draw(){
  for(int i=0;i<160;i++){
  float dir = 2*(round(random(1))-0.5);
  if(random(1)>0.5){
   angle += big*dir; 
  } else {
   angle += small*dir; 
  }
  
  x += cos(angle)*dist;
  y += sin(angle)*dist;
  line(oldX,oldY,x,y);
  oldX = x;
  oldY = y;
  if(x<0){
   x+= width;
  oldX += width; 
  } else if(x>width){
   x -= width;
   oldX -= width; 
  }
  
  if(y<0){
   y+= height;
  oldY += height; 
  } else if(y>height){
   y -= height;
  oldY -= height; 
  }
  }
  if(random(1)>0.5){
   stroke(0,60); 
  } else {
    stroke(255,60); 
  }
}


