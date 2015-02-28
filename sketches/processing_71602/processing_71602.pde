

void setup(){
float B=100;
 size(1000, 800);
background(B);

}
float j=400;
float h=500;
float i = 0; 
 float I=1;
float P=30;
float R=0;
float W=255;
void draw(){ 
 background(0); 
noStroke();
 float p=random (R,W);
 float s=random(R, W);
 float Y=random(R, W);
 i = i + .1; 
 I= I+1;
 
fill (W);{
 ellipse (h, j, j, j);
}
 fill (R);{
 ellipse (h, j, 250, 250);
 }
 translate(h,j); 
 smooth(); 
 fill(255,0,0);{
  if (mouseX+0+ mouseY+0 <=300); 
 rotate(i); 
 rect(-25,-25,50,50);
 }

fill(255);
 rotate(I); {
   fill (p, s, Y);
ellipse(50, 380, j, 100);
}}
void mouseMoved() {
  P=P+10;
  if (P > 150) {
    P=5;}
frameRate(P);
}


