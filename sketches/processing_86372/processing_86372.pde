
void setup() {
  size(480, 480);
  smooth();
  strokeWeight(2);
  background(90, 154, 112);
}
void draw(){
//wheels
fill(150);
ellipse(220, 270, 30, 15);
ellipse(220,270,15,7);
ellipse(300, 270, 30, 15);
ellipse(300,270,15,7);
//car body
beginShape();
fill(232,105,70);
vertex(185, 210);
vertex(210, 190);
vertex(320, 190);
vertex(318, 230);
vertex(310, 230);
vertex(310, 235);
vertex(318, 235);
vertex(320, 270);
vertex(210, 270);
vertex(185, 250);
vertex(185, 210);
endShape();
//right headlight
beginShape();
fill(240,193,93);
vertex(190,215);
vertex(210,195);
vertex(210,215);
vertex(190,215);
endShape();

//left headlight
beginShape();
fill(240,193,93);
vertex(190,245);
vertex(210,245);
vertex(210,265);
vertex(190,245);
endShape();

//rear right headlight
beginShape();
fill(240,193,93);
vertex(315,195);
vertex(313,215);
vertex(300,215);
vertex(300,195);
vertex(315,195);
endShape();

//rear left headlight
beginShape();
fill(240,193,93);
vertex(315,265);
vertex(313,245);
vertex(300,245);
vertex(300,265);
vertex(315,265);
endShape();

//windshield
beginShape();
fill(90,154,175);
vertex(230,260);
vertex(260,255);
vertex(260,205);
vertex(230,200);
vertex(230,260);
endShape();

//body creases
line(225,241,190,236);
line(225,220,190,225);
line(225,234,190,233);
line(225,227,190,228);
line(260,205,300,195);
line(260,255,300,265);

}



