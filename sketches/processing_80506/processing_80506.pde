
void setup () {
 background (0);
size (700,500,P3D);
}
void draw() {
noFill();
stroke(random(225),2,random(247));
line((mouseX),(mouseY),random (700), random (500));

translate (mouseX,mouseY,random(-1000,2000));
box (100);
translate (100,90);
box (90);
translate (65,115,100);
box (200);
  translate (23,450,235);
box (100);
translate (250,250,34);
box (400);
translate (250,255,-455);
box (50);
translate (250,250,23);
box (50);
translate (250,255,235);
box (50);
translate (250,250,-234);
box (50);
translate (250,250);
box (50);
}
