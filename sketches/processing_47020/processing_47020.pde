
void setup(){
size (640,360);
smooth ();

}
void draw (){
 noStroke();
 background (234,222,200);
 fill(217,67,53);
 if (mouseButton == LEFT) fill(224,122,255);

 
beginShape();
vertex(0, 0);
vertex(209, 0);
vertex(213, 17);
vertex(110, 42);
vertex(0, 22);
endShape(CLOSE);
 
fill(119,158,197);
if (mouseButton == LEFT) fill(201,237,89);

beginShape();
vertex(208,0);
vertex(214, 16);
vertex(280, 0);
endShape(CLOSE);
 
fill(170,137,130);
if (mouseButton == LEFT) fill(130,255,255);


 
beginShape();
vertex(584, 18);
vertex(633, 6);
vertex(639, 13);
vertex(639, 132);
vertex(435, 201);
vertex(359, 150);
endShape(CLOSE);
 
 
fill(119,158,197);
if (mouseButton == LEFT) fill(255,156,112);
 
beginShape();
vertex(412, 0);
vertex(580, 0);
vertex(603, 92);
vertex(222, 181);
vertex(146, 61);
endShape(CLOSE);
 
  fill(0);
  noStroke();
ellipse(27,233, 415,425);
 
 
fill(220,197,85);
if (mouseButton == LEFT) fill(23,115,255);
 
beginShape();
vertex(0, 199);
vertex(19, 197);
vertex(45, 307);
vertex(0, 318);
endShape(CLOSE);
 
 
fill(174,176,175);
if (mouseButton == LEFT) fill(255,255,112);
 if (mousePressed == true) {
    fill(0);
 
beginShape();
vertex(31, 249);
vertex(115, 230);
vertex(126, 273);
vertex(41,293);
endShape(CLOSE);
 
fill(223,210,175);
if (mouseButton == LEFT) fill(2,255,176);

beginShape();
vertex(437, 202);
vertex(638, 134);
vertex(638, 156);
vertex(437, 229);
endShape(CLOSE);
 
fill(60,56,47);
 if (mouseButton == LEFT) fill(173,64,0);
beginShape();
vertex(359, 149);
vertex(436, 202);
vertex(436, 229);
vertex(330, 156);
endShape(CLOSE);
 
fill(73,60,48);
if (mouseButton == LEFT) fill(173,0,250);
 
beginShape();
vertex(639, 157);
vertex(639, 252);
vertex(554, 185);
endShape(CLOSE);
 
fill(216,212,211);
if (mouseButton == LEFT) fill(0,128,250);
 else if (mousePressed && (mouseButton == RIGHT)) {
    fill(255);
 
beginShape();
vertex(15, 64);
vertex(289, 0);
vertex(370, 0);
vertex(19, 84);
endShape(CLOSE);
 
fill(196,25,23);
if (mouseButton == LEFT) fill(0,130,0);
 else if (mousePressed && (mouseButton == LEFT)) {
    fill(170);
 
beginShape();
vertex(21, 85);
vertex(374, 0);
vertex(410, 0);
vertex(23, 90);
endShape(CLOSE);


}
}
}
}
 
               

                
                
