
void setup() {
  size(350,350);
  background(#6386be);
}
 
 
void draw() {
  for( float x=0; x<350; x=x+10 ){
  for( float y=0; y<350; y=y+10 ){
  pushMatrix();
  translate(x*6,y*6);
  rotate(radians(15));
  scale(0.2);
  dororo_draw();
  popMatrix();
  }
 }
}
 
 
void dororo_draw() {
//ear
//뒤
strokeWeight(1);
fill(#aeb1aa);
beginShape();
vertex(0,100);
vertex(200,100);
vertex(200,130);
vertex(0,130);
endShape(CLOSE);
 
//얼굴
strokeWeight(1);
fill(#aeb1aa);
ellipse(100,80,170,170);
 
//머리
strokeWeight(1);
fill(#dee3e7);
ellipse(100,35,170,100);
 
//눈주변
strokeWeight(1);
fill(#6386be);
beginShape();
vertex(15,100);
vertex(15,30);
vertex(100,20);
vertex(185,30);
vertex(185,100);
vertex(100,90);
endShape(CLOSE);
 
//왼쪽눈
strokeWeight(1);
fill(255,255,255);
ellipse(55,60,60,60);
 
strokeWeight(1);
fill(#82b5ec);
ellipse(55,60,35,35);
 
//오른쪽눈
strokeWeight(1);
fill(255,255,255);
ellipse(145,60,60,60);
 
strokeWeight(1);
fill(#82b5ec);
ellipse(145,60,35,35);
 
//왼쪽
strokeWeight(1);
fill(#aeb1aa);
beginShape();
vertex(15,30);
vertex(25,29);
vertex(15,150);
vertex(-10,120);
endShape(CLOSE);
 
//오른쪽
strokeWeight(1);
fill(#aeb1aa);
beginShape();
vertex(175,29);
vertex(185,30);
vertex(220,120);
vertex(185,150);
endShape(CLOSE);
 
//빨간별
strokeWeight(1);
fill(#d34752);
beginShape();
vertex(95,-2);
vertex(105,-2);
vertex(100,10);
endShape(CLOSE);
 
//코
line(80,100,70,110);
line(85,105,77,118);
line(105,110,107,125);
line(111,107,120,113);
}
 

