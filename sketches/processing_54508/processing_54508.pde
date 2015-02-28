
//Homework #11
//Tyler Porten (tporten) copyright 2012

final int MAX = 10;

float [] x;
float [] y;
float [] wd;
float [] ht;
float [] dx;
float [] dy;
color [] c;

void setup(){
  size(400, 400);
  x = new float [MAX];
  y = new float [MAX];
  wd = new float [MAX];
  ht = new float [MAX];
  dx = new float [MAX];
  dy = new float [MAX];
  c = new color [MAX];
  
  initObjArray(x, 20, width-20);
  initObjArray(y, 20, width-20);
  initObjArray(wd, 10, 50);
  initObjArray(ht, 10, 50);
  initObjArray(dx, 2, 10);
  initObjArray(dy, 2, 10);
  initColArray();
  
  background(255);
  smooth();
  
}

void draw(){
 prepWindow();
 moveObj();
 drawObj(); 
  
}

void prepWindow(){
  
  
  
}

void initObjArray(float [] array, float low, float high){
 for(int i = 0; i < array.length; i++){
  array[i] = int(random(low, high));
 } 
  
}

void initColArray(){
 for(int i = 0; i < c.length; i++){
  c [i] = color(int(random(200, 255)),
                int(random(200)),
                int(random(200)));
 } 
  
}

void moveObj(){
  for(int i = 0; i < x.length; i++){
   x [i] += dx [i];
    if (x [i] > width){
      dx [i] = -(dx [i]);
       c [i] = color(int(random(200, 255)),
                int(random(200)),
                int(random(200)));
    }
    else if (x [i] < 0){
      dx [i] = -(dx [i]);
       c [i] = color(int(random(200, 255)),
                int(random(200)),
                int(random(200)));
    }
   y [i] += dy [i];
    if (y [i] > height){
      dy [i] = -(dy [i]); 
       c [i] = color(int(random(200, 255)),
                int(random(200)),
                int(random(200)));
    }
    else if (y [i] < 0){
      dy [i] = -(dy [i]); 
       c [i] = color(int(random(200, 255)),
                int(random(200)),
                int(random(200)));
    }
  }

 
  
}

void drawObj(){
 for(int i = 0; i < x.length; i++){
   noStroke();
  fill(c [i]);
  rect(x [i], y [i], wd [i], ht [i]);
 } 
}

