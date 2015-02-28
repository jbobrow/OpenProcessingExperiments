
PImage imga1, imga2;
int x = 0;
float theta;

void setup() {
size(600, 600);
  imga1 = loadImage("bw1.jpg");
  imga2 = loadImage("bw2.jpg");
frameRate(3);
}
void draw() {
//background(255);
background(0);

  if ( x % 2 == 0) {
   // println("0");
    image(imga1, 0, 0);
  }
  else if (x%2 != 0) {
    //println("=================");
    image(imga2, 0, 0);
  }


  x++;
theta =map(sin(frameCount*0.051),0,150,0,2.5*PI);
translate(width/2, height);
branch(120);
}
void branch(float len) {
fill(random(200, 256), random(30, 255), random(0, 255));
rect(0, 0, 15, -len);
ellipse(0,30,5,5);
translate(0, -len);
if (len > 20) { // no inf. loop
pushMatrix();
rotate(-theta*random(-1,15));
//branch(len*random(.5 , .8));
branch(len*.75);
popMatrix();

pushMatrix();
rotate(theta*random(1,25));
branch(len*random(.5 , .8));
//branch(len*.75);
popMatrix();

pushMatrix();
rotate(theta*random(10,20));
branch(len*random(.2 , .6));
//branch(len*.75);
popMatrix();

pushMatrix();
rotate(theta*random(5,10));
//branch(len*random(.2 , .6));
branch(len*.75);
popMatrix();

//println(x);
}
}


