
void setup() {
  size(1000, 500);
  background(#FFFFFF);
 }
 

 void draw() {
 
   
if (keyPressed == true) {
saveFrame();
  background(#FFFFFF);
  }
}
 

  
void mouseDragged(){
    
float a = mouseX;
float b = mouseY+200;
float c = mouseX+random(0,100);
float d = mouseY+200+random(0,100);
float e = mouseY+random(0,100)+random(0,30);
 
 smooth();
 strokeWeight(4);
 stroke((mouseX*1.1)*255/1000);

 if (mouseX<0){
 stroke(0);
 strokeWeight(4);
 }

line(a-2000, b, a-200/5-a/1.6, b+300/3-b/2);
line(a-200/5-a/1.6, b+300/3-b/2,a-200/5-a/1.7, b-40);
line(a-200/5-a/1.7, b-40,a-200/5-a/1.9, b+300/3-b/2);
line(a-200/5-a/1.9, b+300/3-b/2,a-200/5-a/2, b+300/3-b/2);
line(a-200/5-a/2, b+300/3-b/2,a+400/7-a/1.8, b+150/3-b/2);
line(a+600/7-a/1.8, b+150/3-b/2,a+500/7-a/2,b+150/3-b/2);
line(a+400/7-a/1.8, b+150/3-b/2,a+500/7-a/2,b+150/3-b/2);
line(a+500/7-a/2,b+150/3-b/2,a+500/7-a/2, b+200/3-b/2);
line(a+500/7-a/2, b+200/3-b/2,a+200/3-a/4, b+200/5-b/4);
line(a+200/3-a/4, b+200/5-b/4,a+200/3-a/4, b+500/5-b/4);
line(a+200/3-a/4, b+500/5-b/4,a+200/5-a/6, b+500/5-b/6);
line(a+200/5-a/6, b+500/5-b/6, a+a/3,b+b/3);
line(a+a/3,b+b/3, a+a*5,b+b*5);


//point
  stroke((mouseX/2)*255/1000,100);
  strokeWeight(0.7);
  stroke((mouseX/2)*255/1000,100);
   if (mouseX<0){
  stroke(0);
}
  line(c+100/9-c/10, d+500/9-d/10,c+100/9-c/10, d+500/9-e/10);
 
  strokeWeight(random(0.1,1.5));
  stroke((mouseX/2)*255/1000,100);
   if (mouseX<0){
  stroke(0);
}
   if (mouseX<100){
  stroke(255,150);
}

line(c+400/7-c/1.8, d+100/3-d/2,c+400/7-c/1.8, d+100/3-d/2);
line(a-200/5-a/1.7, e-40,a-200/5-a/1.7, e-40);
 
}

