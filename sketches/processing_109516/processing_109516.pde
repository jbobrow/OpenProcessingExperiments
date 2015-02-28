
int px = 300;
int py = 300;
int lar = 100;
int alt = 100;
int ang = 1;
int ang2 = 1;
int ang3 = 1;

void setup(){
  size(600,600);
  background(0);
  loop();
}

void draw(){
  
  background(0);
  stroke(255);
  strokeWeight(10);
  smooth();
    
  noFill();
    
  ang += 1;
  ang2 += 2;
  ang3 += 3;
  
  arc(px,py,lar,alt, radians(ang), radians(ang+300));
  arc(px,py,lar+30,alt+30, radians(-ang2), radians(-ang2+150));
  arc(px,py,lar+60,alt+60, radians(ang3), radians(ang3+200));
  arc(px,py,lar+90,alt+90, radians(-ang2), radians(-ang2+300));
  arc(px,py,lar+120,alt+120, radians(ang), radians(ang+100));
  arc(px,py,lar+150,alt+150, radians(-ang3), radians(-ang3+300));
  arc(px,py,lar+180,alt+180, radians(ang), radians(ang+150));
  arc(px,py,lar+210,alt+210, radians(-ang2), radians(-ang2+200));

}
