
color [] pal = {#000000,#FFFFFF,#FFEA00};
int k;
int x = 300;
int y = 300;
int d = 25;

float e = .01;
float d1x = 100;
float d1y = 100;
float ts = 20;

//float r = PI*0;
//setup/////////////////////////////////////////////////
void setup(){
  size(600,600);
  smooth();
  background(pal[0]);
}

//ship/////////////////////////////////////////////////
void ship(int xs,int ys, int s){
  fill(pal[1]);
  beginShape();
  vertex(xs,ys);
  vertex(xs-s,ys+s);
  vertex(xs,ys-s);
  vertex(xs+s,ys+s);
  endShape(CLOSE);  
}
//key move////////////////////////////////////////////
void keyMove(){
  if(key == ' ') k = 0;
  if(key == 'i') k = 1;
  if(key == 'k') k = 2;
  if(key == 'l') k = 3;
  if(key == 'j') k = 4;
//  if(key == 'e') r = 0;
//  if(key == 'r') r = 1;
  
  if(k == 0){
    ship(x,y,d);
    }
  if(k == 1){
    ship(x,y,d);
    y -= 2;
    }
  if(k == 2){
    ship(x,y,d);
    y += 2;
    }
  if(k == 3){
    ship(x,y,d);
    x += 2;
    }
  if(k == 4){
    ship(x,y,d);
     x -= 2;
    }
//  if(r == 0){
//    r += 10;
//  }
//  if(r == 1){
//  r = 0;
//  }
}
//target//////////////////////////////////////////////
void target(float d1x,float d1y, float ts,float e){
  fill(pal[1]); 
  ellipse(d1x,d1y,ts,ts);
  d1x += (x-d1x)*e;
  d1y += (y-d1y)*e;
  
}
  
//draw////////////////////////////////////////////////
void draw(){
  
  background(pal[0]);
//   rotate(r);
  ship(x,y,d); 
  target(d1x,d1y,ts,e);
  
  x = constrain(x, 0 + d/2, 600-d/2);
  y = constrain(y, 0 + d/2, 600-d/2);
  keyMove();
  
 
  
  
}
