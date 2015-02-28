
 void setup() {
  size(350,350);
  background(100);
}
  
  void draw() {
  for( float x=0; x<350; x=x+5 ){
  for( float y=0; y<350; y=y+5 ){
  pushMatrix();
  translate(x*6,y*6);
  rotate(radians(frameCount+x));
  scale(0.2);
  hwijin_draw();
  popMatrix();
  }
 }
}


 void hwijin_draw() {

//얼굴
strokeWeight(2.5);
fill(255,255,0);
ellipse(100,100,150,150);
 


//눈
 
strokeWeight(4)
fill(10,0,0);
ellipse(131,100,20,21);
 
strokeWeight(1.5);
fill(255);
ellipse(130,102,10,10);
 
 
 
strokeWeight(4);
fill(0,0,0);
ellipse(50,100,20,20);
 
strokeWeight(1);
fill(#ffffff);
ellipse(50,102,10,10);
 
 
strokeWeight(3);
line(100,60,80,60);
fill(#000000);
 
 
fill(255,0,0);
strokeWeight(2);
ellipse(40,80,11,6);
ellipse(140,80,11,6);
 
 
fill(0)
beginShape();
vertex(65,165);
vertex(65,125);
vertex(55,125);
vertex(55,160);
endShape(CLOSE);
 
fill(0)
beginShape();
vertex(80,172);
vertex(80,125);
vertex(70,125);
vertex(70,167);
endShape(CLOSE);
 
fill(0)
beginShape();
vertex(95,175);
vertex(95,125);
vertex(85,125);
vertex(85,172);
endShape(CLOSE);
 
fill(0)
beginShape();
vertex(110,174);
vertex(110,125);
vertex(100,125);
vertex(100,174);
endShape(CLOSE);
 
fill(0)
beginShape();
vertex(125,170);
vertex(125,125);
vertex(115,125);
vertex(115,172);
endShape(CLOSE);
 
fill(0)
beginShape();
vertex(140,162);
vertex(140,125);
vertex(130,125);
vertex(130,167);
endShape(CLOSE);
 
fill(0)
beginShape();
vertex(155,151);
vertex(155,125);
vertex(145,125);
vertex(145,160);
endShape(CLOSE);
 
fill(0)
beginShape();
vertex(170,127);
vertex(170,125);
vertex(160,125);
vertex(160,144);
endShape(CLOSE);
 
fill(0)
beginShape();
vertex(50,156);
vertex(50,125);
vertex(40,125);
vertex(40,145);
endShape(CLOSE);
}
