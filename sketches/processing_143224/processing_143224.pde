
/*
 Konkuk University
 SOS iDesign
 
Name:Lim Hyun Seung
 ID: 201420104 Lim Hyun Seung
 
*/
//<Audio>
import ddf.minim.*;

Minim minim;
AudioInput in;
float volume = 0;
float volumeF = 0;

//-------------------------------------
void setupAudio(){
minim = new Minim(this);
in = minim.getLineIn(Minim.MONO, 512);
}

//-------------------------------------
void getVolume(){
volumeF = in.right.level()*1000;
volume = 0.8*volume + 0.8*volumeF;  //Sensitivity = standard is 0.2*volumeF
}

//-------------------------------------
void stop(){
in.close();
minim.stop();
super.stop();
}

//<Sketch>
void setup()
{
  size (600, 600);
  setupAudio();
  smooth();
  background(206, 251, 201);
}
  
void draw()
{
 
 
   float mx1 = map (mouseX, 0, width, 147, 243);
   float mx2 = map (mouseX, 0, width, 357, 453);
   float my = map (mouseY, 0, height, 394, 408);
 
//Head
stroke(0, 0, 0);
strokeWeight(12);
fill(255, 112, 18);
ellipse(189, 404, 208, 208);
fill(250, 244, 192);
ellipse(mx1, my, 84, 84);
 
//Head2
stroke(0, 0, 0);
strokeWeight(12);
fill(255, 112, 18);
ellipse(403, 404, 208, 208);
fill(250, 244, 192);
ellipse(mx2, my, 84, 84);
 
//Face
stroke(0,0,0);
strokeWeight(4);
beginShape();
vertex(179, 129);
vertex(179, 130 );
vertex(179, 131);
vertex(179, 132);
vertex(179, 133);
vertex(179, 134);
vertex(179, 135);
vertex(178, 134);
vertex(178, 137);
vertex(178, 139);
vertex(178, 141);
vertex(176, 145);
vertex(178, 147);
vertex(175, 145);
vertex(176, 146);
vertex(178, 153);
vertex(174, 152);
vertex(174, 156);
vertex(173, 161);
vertex(171, 163);
vertex(172, 165);
vertex(172, 166);
vertex(174, 167);
vertex(175, 168);
vertex(174, 168);
vertex(174, 171);
vertex(172, 174);
vertex(172, 177);
vertex(172, 179);
vertex(169, 181);
vertex(169, 184);
vertex(169, 185);
vertex(169, 186);
vertex(169, 187);
vertex(169, 188);
vertex(169, 189);
vertex(169, 190);
vertex(169, 191);
vertex(163, 220);
vertex(162, 224);
vertex(160, 226);
vertex(166, 229);
vertex(162, 229);
vertex(159, 235);
vertex(160, 238);
vertex(160, 241);
vertex(160, 244);
vertex(160, 245);
vertex(159, 249);
vertex(158, 253);
vertex(158, 256);
vertex(159, 260);
vertex(159, 265);
vertex(155, 268);
vertex(155, 271);
vertex(152, 276);
vertex(150, 279);
vertex(149, 283);
vertex(148, 286);
vertex(147, 289);
vertex(147, 297);
vertex(176, 301);
vertex(148, 307);
vertex(148, 311);
vertex(149, 316);
vertex(151, 321);
vertex(151, 323);
vertex(160, 334);
vertex(165, 338);
vertex(167, 343);
vertex(179, 351);
vertex(195, 354);
vertex(202, 351);
vertex(245, 352);
vertex(401, 349);
vertex(412, 352);
vertex(415, 350);
vertex(419, 350);
vertex(421, 347);
vertex(424, 347);
vertex(425, 345);
vertex(427, 343);
vertex(431, 343);
vertex(432, 343);
vertex(435, 340);
vertex(435, 341);
vertex(437, 340);
vertex(440, 337);
vertex(443, 332);
vertex(444, 331);
vertex(445, 329);
vertex(446, 328);
vertex(448, 323);
vertex(450, 321);
vertex(452, 320);
vertex(449, 318);
vertex(450, 316);
vertex(452, 313);
vertex(456, 311);
vertex(454, 307);
vertex(452, 305);
vertex(452, 304);
vertex(452, 301);
vertex(452, 298);
vertex(452, 297);
vertex(452, 295);
vertex(451, 292);
vertex(451, 289);
vertex(450, 287);
vertex(449, 287);
vertex(448, 283);
vertex(447, 282);
vertex(428, 175);
vertex(422, 129);
vertex(180, 125);
endShape();
 
 
 
//eyes(Left)
noStroke();
fill(0, 0, 0);
ellipse(232, 203, 70, 118);
fill(0, 220, 255);
ellipse(232, 203, 45, 74);
fill(0, 0, 0);
ellipse(232, 203, 28, 48);
fill(255, 255, 255);
ellipse(221, 220, 12, 12);
fill(255, 255, 255);
ellipse(241, 163, 28, 28);
fill(255, 255, 255);
ellipse(231, 156, 22, 22);
noFill();
stroke(0, 0, 0);
strokeWeight(7);
line(194, 129, 278, 169);
 
//Eyes(Right)
noStroke();
fill(0, 0, 0);
ellipse(362, 203, 70, 115);
fill(0, 220, 255);
ellipse(362, 203, 45, 74);
fill(0, 0, 0);
ellipse(362, 203, 28, 48);
fill(255, 255, 255);
ellipse(351, 220, 12, 12);
fill(255, 255, 255);
ellipse(371, 163, 28, 28);
fill(255, 255, 255);
ellipse(362, 156, 12, 12);
noFill();
stroke(0, 0, 0);
strokeWeight(7);
line(327, 163, 402, 133);
 
if(mousePressed){
   
//Missile
 stroke(0, 0, 0, 40);
 strokeWeight(5);
 fill(random(255),random(255),random(255), 200);
 rectMode(CENTER);
 rect(mouseX, mouseY, 40, 110);
 triangle(mouseX-20, mouseY+55, mouseX+20, mouseY+55, mouseX, mouseY+89);
 quad(mouseX-50, mouseY-95, mouseX-20, mouseY-55, mouseX+20, mouseY-55, mouseX+50, mouseY-95);
  
  rect( width-mouseX, mouseY, 40, 110);
 triangle( width-mouseX-20, mouseY+55,  width-mouseX+20, mouseY+55,  width-mouseX, mouseY+89);
 quad( width-mouseX-50, mouseY-95,  width-mouseX-20, mouseY-55,  width-mouseX+20, mouseY-55,  width-mouseX+50, mouseY-95);
  
  rect(mouseX, height-mouseY, 40, 110);
 triangle(mouseX-20,height-mouseY+55, mouseX+20, height-mouseY+55, mouseX, height-mouseY+89);
 quad(mouseX-50, height-mouseY-95, mouseX-20, height-mouseY-55, mouseX+20, height-mouseY-55, mouseX+50, height-mouseY-95);
  
  rect(width-mouseX, height-mouseY, 40, 110);
 triangle(width-mouseX-20, height-mouseY+55, width-mouseX+20, height-mouseY+55, width-mouseX, height-mouseY+89);
 quad(width-mouseX-50, height-mouseY-95, width-mouseX-20, height-mouseY-55, width-mouseX+20, height-mouseY-55, width-mouseX+50,  height-mouseY-95);
  
  
}
 
if(keyPressed){
   
  //close eyes
  stroke(0, 0, 0);
  strokeWeight(10);
  line(197, 206, 266, 206);
  line(327, 206, 397, 206);
  noStroke();
  fill(250, 244, 192);
  rectMode(CORNERS);
  rect(190, 129, 404, 203);
   stroke(0, 0, 0);
  strokeWeight(6);
  line(179, 125, 420, 127);
   
  //Creat Mouse
  stroke(0, 0, 0);
  strokeWeight(3);
  fill(241, 95, 95);
  triangle(275, 288, 308, 288, 299, 315);
}
 //Volume Check
  getVolume();
  float Y = map(volume, 0, 200, 2, 100); 
  float X = map(volume, 0, 200, 2, 200);

noStroke();
fill(241, 95, 95);
translate(width/2, height/2);
ellipse(0, 0, X+30, Y+30);
rectMode(CENTER);
rect(400, 312, 35, 35);


}
 
void keyPressed() {
    background(random(255), random(255), random(255));
}

