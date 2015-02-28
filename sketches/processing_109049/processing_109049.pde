
int c =0;
float x =0;
float y =0.0;

//preparation
void setup(){
 size(800,600);
frameRate(30);
}

//looping forever
void draw(){
  background(c%6,255,0); 
  fill(0,c%6,0);
  noStroke();
  rect(x,y,100,100);
  ellipse(x+100,y+50,50,50);
  c = c+10;
  x = x + 1;
  //y = y + 1;
  println(y);
}
