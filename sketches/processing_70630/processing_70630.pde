
void setup()
{

size(600, 480); //set the window size

}

void draw()
{

background(37, 32, 78);
/*there is actually a difference between putting things in setup
versus putting things in draw...because until otherwise noted,
draw continually redraws everything. so if you have background
in draw, it'll clear the screen. if you don't, you'll get after-
images everywheeere.*/
ellipseMode(CORNERS); //sets how it draws the ellipse 
rectMode(CORNER); //set how it draws a rectangle
smooth(); //stops the anchor points from being shown (?)
//translate(mouseX-100, mouseY-100);

//first layer
//ear, please add another
noStroke();
fill(83, 78, 138);
ellipse(140, 30, 160, 70);

//front leg shadowed
beginShape();
vertex(220, 250); //start point of curve
bezierVertex(240, 310, 220, 440, 220, 440); //1st handle, 2nd handle, end point of curve
vertex(170, 260); //final vertex
endShape();
//back leg shadowed
beginShape();
vertex(400, 210);
bezierVertex(440, 260, 410, 390, 370, 440);
bezierVertex(370, 390, 380, 330, 360, 280);
endShape();

//back wing
fill(92, 136, 174);
strokeWeight(6);
stroke(189, 208, 225);
beginShape();
vertex(290, 220);
bezierVertex(250, 280, 150, 190, 230, 140);
bezierVertex(200, 90, 260, 40, 340, 70);
endShape();

//chest cloud
fill(176, 205, 229);
stroke(236, 243, 248);
beginShape();
vertex(120, 80);
bezierVertex(80, 110, 90, 130, 110, 140);
bezierVertex(70, 150, 40, 230, 110, 220);
bezierVertex(100, 260, 130, 260, 140, 250);
bezierVertex(140, 270, 170, 270, 180, 240);
endShape();

//second layer
//tail cloud
beginShape();
vertex(370, 170);
bezierVertex(530, 140, 560, 270, 510, 280);
bezierVertex(530, 320, 470, 360, 430, 300);
endShape();
noFill();
bezier(100, 190, 130, 160, 150, 200, 110, 220);
bezier(490, 230, 440, 210, 450, 290, 510, 280);

//neck
noStroke();
fill(118, 114, 166);
beginShape();
vertex(160, 70);
bezierVertex(160, 70, 250, 210, 280, 220);
bezierVertex(330, 220, 190, 270, 176, 275);
bezierVertex(160, 250, 120, 90, 120, 90);
endShape();

//extra ear
ellipse(150, 30, 170, 70);

//third layer
//head
ellipse(70, 50, 160, 100);

//body
ellipse(170, 190, 445, 320);

//fourth layer
//front leg
beginShape();
vertex(220+30, 250); //start point of curve
bezierVertex(240+30, 310, 220+30, 440, 220+30, 440); //1st handle, 2nd handle, end point of curve
vertex(170+30, 260); //final vertex
endShape();
//back leg
beginShape();
vertex(400+30, 210);
bezierVertex(440+30, 260, 410+30, 390, 370+30, 440);
bezierVertex(370+30, 390, 380+30, 330, 360+30, 280);
endShape();

//eye
fill(0, 0, 0);
ellipse(110, 60, 140, 90);

//fifth layer
//eye shine
fill(255, 255, 255);
/*pushMatrix();
translate(mouseX-120-5, mouseY-70-5);*/
ellipse(120-5, 70-5, 130-5, 80-5);
/*if ( x )
{
  
}
popMatrix();*/

//squares into diamonds
pushMatrix();
translate(165, 110);
rotate(radians(45));
rect(0, 0, 25, 25);
popMatrix();

pushMatrix();
translate(200, 145);
rotate(radians(45));
rect(0, 0, 10, 10);
popMatrix();

pushMatrix();
translate(195, 180);
rotate(radians(45));
rect(0, 0, 25, 25);
popMatrix();

pushMatrix();
translate(225, 230);
rotate(radians(45));
rect(0, 0, 35, 35);
popMatrix();

//body squares into diamonds
pushMatrix();
translate(240, 320);
rotate(radians(45));
rect(0, 0, 20, 20);
popMatrix();

pushMatrix();
translate(285, 280);
rotate(radians(45));
rect(0, 0, 10, 10);
popMatrix();

pushMatrix();
translate(315, 220);
rotate(radians(45));
rect(0, 0, 40, 40);
popMatrix();

pushMatrix();
translate(365, 280);
rotate(radians(45));
rect(0, 0, 5, 5);
popMatrix();

pushMatrix();
translate(385, 240);
rotate(radians(45));
rect(0, 0, 15, 15);
popMatrix();

pushMatrix();
translate(425, 260);
rotate(radians(45));
rect(0, 0, 25, 25);
popMatrix();


//final layer
//wing
fill(176, 205, 229);
strokeWeight(6);
stroke(236, 243, 248);
beginShape();
vertex(320, 210);
bezierVertex(280, 280, 180, 190, 260, 150);
bezierVertex(230, 90, 290, 40, 370, 70);
bezierVertex(400, 60, 420, 80, 420, 100);
bezierVertex(440, 80, 500, 80, 500, 120);
bezierVertex(540, 120, 540, 150, 510, 170);
bezierVertex(510, 210, 410, 250, 380, 220);
bezierVertex(380, 220, 350, 250, 320, 210);
endShape();
//finishing touches
noFill();
bezier(310, 100, 290, 140, 440, 120, 370, 70);
bezier(500, 120, 480, 160, 450, 120, 470, 110);
bezier(320, 210, 340, 170, 280, 170, 280, 190);
bezier(380, 220, 350, 170, 460, 150, 420, 200);

}
