
// Code by Sherin Kwan (YSDN Interactivity 1)

int x= 110;
int b= 140;
int y = 100;
float o= 1500;
int w= 2;

void setup(){
  size(650, 200);
  background(75);
  ellipseMode(CENTER);
  noFill();
 
  smooth();
}

void draw(){
  
  stroke(155);
  strokeWeight(w+6);
  ellipse(x, y, o, o);
  stroke(75);
  strokeWeight(w+7);
  ellipse(x, y, o+2, o+2);
  //ellipse(x, y, o-10, o-10);


  stroke(155);
  strokeWeight(w+6);
  ellipse(x, y, o+15, o+15);
  stroke(75);
  strokeWeight(w+7);
  ellipse(x, y, o+17, o+17);

   stroke(155);
  strokeWeight(w+6);
  ellipse(x, y, o+35, o+35);
  stroke(75);
  strokeWeight(w+7);
  ellipse(x, y, o+37, o+37);

  if (2>o){
    o = 1000;
    stroke(75);
  } else{
    o-=10;
  }
}

  

