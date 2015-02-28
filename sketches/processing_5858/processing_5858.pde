
float w;
float a;
int x = 0;
int speed= 1;

void setup(){
size(400,400);
background(255,50,200);

}

void draw() {
//background(15);
 
w=random(255);
a=(200);
x=x+speed;
  

  stroke(0);
//line(10,200,w,100);
{fill(w,w,255,75);}
//rectMode(CENTER)
ellipse(a,height/2,w,w);

{if (mouseX <width/2) {
fill(238,99,99,30);
ellipse(200,200,width,height);}
else{
  fill(0,100,80,10);
  ellipse(200,200,300,300);}
  if ((x > width) || (x < 0)) {
speed = speed * -1;
}

fill(0,206,209,50);
ellipse(x,10,20,20);}
ellipse(x,390,20,20);
}









