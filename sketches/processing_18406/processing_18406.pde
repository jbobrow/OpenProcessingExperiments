
void setup(){
  size(300,300);
  background(255,255,255);
    noStroke();
  fill(90,50,10);
beginShape();
vertex(150,300);
vertex(189,300);
vertex(196,212);
vertex(300,150);
vertex(300,146);
vertex(198,196);
vertex(225,0);
vertex(218,0);
vertex(200,108);
vertex(154,17);
vertex(153,18);
vertex(198,116);
vertex(172,222);
vertex(36,86);
vertex(164,244);
endShape();
beginShape();
vertex(135,182);
vertex(135,67);
vertex(134,68);
vertex(128,193);
vertex(35,164);
vertex(35,166);
vertex(139,203);
endShape();
beginShape();
vertex(244,178);
vertex(244,82);
vertex(245,72);
vertex(249,175);
vertex(296,191);
vertex(295,191);
endShape();
}
void draw(){

}
void mousePressed(){
 fill(180,220,30);
 stroke(50,0,0);
 strokeWeight(1);
 ellipse(mouseX,mouseY,10,15);
 line(mouseX,mouseY-7.5,mouseX,mouseY+7.5);
 line(mouseX,mouseY-2,mouseX-4,mouseY-6);
 line(mouseX,mouseY-2,mouseX+4,mouseY-6);
 line(mouseX,mouseY+3,mouseX-5,mouseY-2);
 line(mouseX,mouseY+3,mouseX+5,mouseY-2);
}

