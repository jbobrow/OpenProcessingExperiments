
//import processing.pdf.*;

size(1000,800);
//beginRecord(PDF, "rayos9.pdf");
background(0);
noStroke();

for(int a = -10;a<=width;a+=80){
for(int b=-10;b <=height;b+=80){
noFill();
strokeWeight(random (1,80));
stroke(random (20,150),random (20,120), random (20,120),150);
line(a, b , 1200,1000);

}
}
//endRecord();

//saveFrame();

