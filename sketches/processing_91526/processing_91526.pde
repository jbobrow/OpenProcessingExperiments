
/*
do some crazy stuff
*/
float y = 0;
float x = 0;
void setup(){
size(600,600,P3D);
smooth();
}
void draw(){
  background(255);
  
translate(300,300,0);
sphere(75);
rotateY(y+=0.03);
rotateX(x+=0.04);

fill(random(0,255),random(0,255),random(0,255));
box(150);
rect(200,200,200,200);
strokeWeight(1);
stroke(random(0,255),random(0,255),random(0,255));
fill(random(0,255),random(0,255),random(0,255));
rect(200,200,200,200);
sphere(700);

}
