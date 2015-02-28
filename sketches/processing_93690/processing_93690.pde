
void setup(){
  size(200,200);
  background(199, 219, 212);
}
void draw(){
int i;
stroke(1);
for (i=-350;i<200;i+=4){
fill(206, 232,223);
strokeWeight (1);
stroke (218, 240, 232);
ellipse(i+100,i*i/120+100,5,5);
ellipse(-i+100,-i*i/120+100,5,5);
ellipse(i*i/120+100,i+100,5,5);
ellipse(-i*i/120+100,-i+100,5,5);
ellipse(i*i/300+100,i+100,5,5);
ellipse(-i*i/300+100,-i+100,5,5);
 }
}
