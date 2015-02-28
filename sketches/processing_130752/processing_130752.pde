
int a = 302;             //integer #1
int b = 255;             //integer #2
int c = 400;             //integer #3
int d = 0;               //integer #4
int e = 200;             //integer #5
int f = 80;              //integer #6
int h = 1;  
float z = 400;
float y = 255;
float x = 55;

void setup(){
  size(c,c);
  frameRate(h);
  strokeWeight(random(5));
}
void draw(){
  background((random(y)), (random(y)), (random(y)));
  
  stroke(c,(random(b)), (random(c)));
  fill((random(c)), (random(c)), (random(e)), (random(f)));
  ellipse((random(e)), (random(e)), (random(b)), (random(b)));
  ellipse((random(f)), (random(f)), (random(e)), (random(e)));
  
  stroke((random(y)));
  line(e, (random(y)),b, (random(y)));
  line(f, (random(y)),f, (random(y)));
  line(h, (random(y)),e, (random(y)));
  line(f, (random(y)),h, (random(y)));
  triangle(y,x,a,f, (random(x)),(random(y)));
}
