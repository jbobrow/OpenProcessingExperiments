
void setup() {
  size(500,500);
  background(255);
}
void draw() {
  background(0);
stroke(255);
translate(10,0);

line(20,20,100,20);

line(140,20,220,20);
line(260,20,340,20);
stroke(#E5B03C);
line(380,20,460,20);
stroke(255);
translate(-10,0);
fill(100);
pushMatrix();
rotate(radians(1));
stroke(#E5B03C);
noFill();
rect(20,40,20,80);
stroke(255);
fill(100);
rect(60,40,20,80);
popMatrix();
rect(100,40,20,80);
rect(140,40,20,80);
rect(180,40,20,80);
pushMatrix();
translate(220,40);
rotate(radians(mouseX/5));
rect(0,0,20,80);
popMatrix(); 
resetMatrix();
rect(260,40,20,80);
rect(300,40,20,80);
rect(340,40,20,80);
pushMatrix();

rotate(radians(2));
rect(380,40,20,80);
popMatrix();
fill(70);
rect(420,40,20,80);
rect(460,40,20,80);
pushMatrix();
translate(20,160);
noFill();
for(int i=0;i<470;i+=20){
  ellipse(i,0,30,30);
}
popMatrix();
resetMatrix();

pushMatrix();
noFill();

for(int i=20;i<400;i+=100){
rect(i,200,60,60);
}
translate(420,200);
rotate(radians(mouseY/PI));
stroke(#E5B03C);
rect(0,0,60,60);

popMatrix();
resetMatrix();
stroke(255);
fill(70);
translate(20,300);
for(int i=0;i<500;i+=50){
 rect(i,0,10,90); 
 
}
noFill();
translate(-20,140);
for(int i=0;i<500;i+=60){
  ellipse(i,-10,40,40);
}
stroke(#E5B03C);
rect(20,30,100,10);
pushMatrix();
rotate(radians(1));
stroke(255);
fill(70);
rect(140,30,100,10);
popMatrix();

noFill();
stroke(#E5B03C);
rect(260,30,100,10);
pushMatrix();
rotate(radians(1));
fill(70);
stroke(255);

rect(380,20,100,10);
popMatrix();

}
