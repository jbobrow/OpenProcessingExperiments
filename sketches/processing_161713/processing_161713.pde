
/*****************************************
 * Assignment <<< #3 >>>
 * Name:         <<< Tyler Tilton >>>
 * Course:       CSC 103 - Creative Computing - Fall 2014
 * Submitted:    <<<9/14/14>>>
 * 
 * <<<With a little help from learnprocessing.com, this sketch features a person jumping on a trampoline all day 
 untill the stars come out. >>>
 *
***********************************************/

void setup() {
  size(500, 500);
  smooth();
}
//I was able to learn how to manipulate gravity at http://www.learningprocessing.com/examples/chapter-5/example-5-9/
float x=250;
float y=265;
float a=220;
float b=a;
float c=280;
float d=b;
float e=x;
float f=270;
float g=0;
float h=0;
float i = random(10,50);
float j = random(10,50);
float k = random(100,200);
float l = random(10,50);
float m = random(200,300);
float n = random(10,50);
float o = random(300,400);
float p = random(10,50);
float q = random(400,485);
float r = random(10,50);
float s = 0;
float diam = random(10,15);
float speed= 0;
float gravity=0.01;

void draw() {
  //Face
  background(#7EC0EE);
  noStroke();
  fill(#d2b48c);
  rectMode(CENTER);
  rect(x,y,230,230,20);
  y= y + speed;
  speed= speed + gravity;
  
  if (y > height) {
    speed = speed * -0.95;  
  }
  
  //Eyes
  noStroke();
  fill(#000000);
  ellipse(a,b,20,20);
  b= b + speed;
  speed= speed + gravity;
  
  if (b > height) {
    speed = speed * -0.95;  
  }
  ellipse(c,d,20,20);
  d= d + speed;
  speed= speed + gravity;
  
  if (d > height) {
    speed = speed * -0.95;  
  }
  
  //Smile
  stroke(#ea4f4f);
  noFill();
  arc(e,f,150,150,0,PI);
  f= f + speed;
  speed= speed + gravity;
  
  if (f > height) {
    speed = speed * -0.95;  
  }
 
 //Trampoline
 noStroke();
 fill(#000000);
 rectMode(CENTER);
 rect(250,500,500,15);
 
 //clouds
  noStroke();
  fill(#ffffff);
  ellipse(250,30,70,40);
  ellipse(400,40,60,30);
  ellipse(215,35,50,20);
  ellipse(50,50,70,30);
 
 //Sun
  noStroke();
  fill(#ffff00);
  ellipse(g,35,70,70);
  g=g+1;
  
  
//Darkness
  noStroke();
  fill(0,0,0,h);
  rectMode(CENTER);
  rect(250,250,500,500);
  h=h+.33;
  
//Stars

if (h > 200){
  s = 255;
}
  noStroke();
  fill(#ffff00, s);
  ellipse(i,j,diam,diam);
  
  noStroke();
  fill(#ffff00, s);
  ellipse(k,l,diam,diam);
  
  noStroke();
  fill(#ffff00, s);
  ellipse(m,n,diam,diam);
  
  noStroke();
  fill(#ffff00, s);
  ellipse(o,p,diam,diam);
  
  noStroke();
  fill(#ffff00, s);
  ellipse(q,r,diam,diam);
  
 
}




