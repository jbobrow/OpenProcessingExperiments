
void setup() {
  size(300,300);
  smooth();
}
 
void draw() {
  background(16,174,178);
  translate(-20,-10);
  for(int y=0; y<400; y=y+50) {
    for(int x=0; x<350; x=x+40) {
      pushMatrix();
      scale(0.4);
      translate(x*2.5,y*2.5);
      rotate(radians(-frameCount));
     ssdraw();
      popMatrix();
    }
  }
}
 
void ssdraw() {
  noStroke();
  scale(0.6);
 //얼굴몸통
fill(255,50,100);
strokeWeight(5);
beginShape();
vertex(50,70);
vertex(180,70);
vertex(180,240);
vertex(50,240);
endShape(CLOSE);
 
//눈썹
strokeWeight(3);
line(81,95,81,103);
line(81+7,95,81+7,103);
line(142,95,142,103);
line(142+7,95,142+7,103);
 
//눈
fill(0,0,0);
ellipse(85,120,6,8);
ellipse(145,120,6,8);
 
//코
strokeWeight(5);
fill(250,190,0);
ellipse(115,170,80,50);
//콧구멍
fill(0,0,0);
ellipse(100,170,5,5);
ellipse(130,170,5,5);
 
//귀
fill(255,50,100);
strokeWeight(5);
beginShape();
vertex(60,40);
vertex(65,60);
vertex(50,60);
endShape(CLOSE);
 
beginShape();
vertex(170,40);
vertex(180,60);
vertex(165,60);
endShape(CLOSE);

}            
                
