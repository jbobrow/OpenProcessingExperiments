
int grin=0;
float i = 0;

void setup(){
  background(0);
  size(800, 800);
  fill(255);
  stroke(0);
  
  //Face
  fill(#d0a37e);
  ellipse(400, 400, 400, 540);
  
  //mouth
  bezier(334, 592,  353, 559,  420, 563, 468, 573);
}

void draw(){
  
   i = i + .3;
   smooth(); 
   fill(random(0,255),random(0,255),random(0,255)); 
   pushMatrix();
   translate(400,400);
   rotate(i); 
   ellipse(200 ,300 ,50,50);
   popMatrix();
  
  //cordinates
  println("mouse x: ");
  println(mouseX);
  println("mouse y: ");
  println(mouseY);
  
   //right eye
  strokeWeight(2);
  fill(255);
  ellipse(506, 345, 125, 180);
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(509, 347, 75, 130);
  fill(0);
  ellipse(509, 347, 50, 105);
  fill(255);
  ellipse(527, 315, 10, 20);
  
  //left eye
  fill(255);
  ellipse(308, 345, 125, 180);
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(311, 347, 75, 130);
  fill(0);
  ellipse(311, 347, 50, 105);
  fill(255);
  ellipse(331, 315, 10, 20);
  
  //hair
  fill(#4b311e);
  strokeWeight(10);
  stroke(#351f0f);
  beginShape();
  vertex(386, 183);
  vertex(362, 204);
  vertex(349, 229);
  vertex(276, 436);
  vertex(273, 342);
  vertex(241, 488);
  vertex(232, 340);
  vertex(194, 451);
   vertex(172, 348);
  vertex(178, 253);
  vertex(190, 201);
  vertex(245, 140);
  vertex(334, 109);
  vertex(435,104);
  vertex(480,82);
  vertex(533,84);
  vertex(506,101);
  vertex(535, 134);
  vertex(585, 236);
  vertex(601, 286);
  vertex(557, 250);
  vertex(458,229);
  vertex(386, 183);
  endShape();
  
  //nose
  strokeWeight(3);
  noFill();
  beginShape();
  vertex(395, 368);
  vertex(385, 436);
  vertex(377,448);
  vertex(374, 453);
  vertex(380, 469);
  vertex(396, 479);
  endShape();
  
  //tooth
  if(grin==1)
  {
    fill(random(0,255),random(0,255),random(0,255));
    beginShape();
    vertex(429,547);
    vertex(470,536);
    vertex(477,576);
    vertex(462,586);
    vertex(437,595);
    endShape();
  }

}

//mouth
void mouseReleased(){
  if(grin==1)
  {
    fill(#d0a37e);
    noStroke();
    rect(273,501, 250, 100);
    rect(440,460,130,75);
    rect(384,586,50,50);
    noFill();
    stroke(0);
    bezier(334, 592,  353, 559,  420, 563, 468, 573);
  grin=0;
  }
  else
  {
    fill(#d0a37e);
    noStroke();
    rect(273,501, 250, 100);
    noFill();
    stroke(0);
    fill(255);
    beginShape();
    vertex(289,515);
    vertex(317,526);
    vertex(339,531);
    vertex(367,531);
    vertex(443,509);
    vertex(561,466);
    vertex(536,513);
    vertex(529,520);
    vertex(505,561);
    vertex(467,585);
    vertex(414,608);
    vertex(324,575);
    vertex(289,515);
    endShape();
    line(325,575,529,518);
    line(367, 530, 385,597);
    line(421,517,437,597);
    line(465,502,478,578);
    line(504,487,510,550);
  grin=1;
  }
}


