
float x;
float y;
int w;
int h;
int c;
int o;
float bend;
float bend2;

int on;

void setup(){
  size (200, 200);
  background (0);
  
  on = 1;
  
}

void draw(){
  if(on ==1){
//    stroke(c);
  //  bend = (int)random(200);
    //bend2 = (int)random(200);
    //curve (bend, bend2, 0, 0, x, y, bend2, bend);
  rectMode(CENTER);
  stroke(0);
  rect (x, y, w, h);
  fill(c, o);
  c = (int)random(-20, 275);
  o = (int)random(100);
  y = y+h;
  w = (int)random(8, 20);
  h = (int)random(8, 20); 
//  w = (mouseX+1)/4;
 // h = (mouseY+1)/4;
  if(y>height){
    y = 0;
    x = x+w;
  }
  if(x>width){
    x = 0;
  }
  if(y>height){
    y = 0;
  }
  }
    
}

void mousePressed(){
  if(on == 1){
    on = 0;
    
  }else{
    on = 1;
  }
}


