
//Variables-------------
//int x = 225;
//int y = 150;

//--------------------


// -----Background info----
void setup() {
  size(450, 300); //width then height
  smooth();
  background(157, 156, 156);
}
//--------------------

void draw(){
  int centerX=mouseX;
  int centerY=mouseY;
  
  background(157, 156, 156);
    for (int y = 0; y <= height; y+=225) {
    for (int x = 0; x <= width; x+=225) {
// hair
  noStroke();
  fill(160,45,32);
  ellipse(centerX-59, centerY-94, mouseX/2, mouseX/2);

  noStroke();
  fill(160,45,32);
  ellipse(centerX+21, centerY-94, mouseX/2, mouseX/2);

  noStroke();
  fill(160,45,32);
  ellipse(centerX-19, centerY-114, mouseX/2, mouseX/2);
//---------------------------
    }}
//feet----------------------
//right foot---------------
  fill(224,154,61);
  beginShape();
  vertex(centerX-5, centerY+80);
  vertex(centerX+15, centerY+80);
  vertex(centerX+15, centerY+100);
  vertex(centerX+35, centerY+100);
  vertex(centerX+35, centerY+120);
  vertex(centerX-5, centerY+120);
  endShape(CLOSE);
//left foot-----------------
  fill(224,154,61);
  beginShape();
  vertex(centerX-33, centerY+80);
  vertex(centerX-53, centerY+80);
  vertex(centerX-53, centerY+100);
  vertex(centerX-73, centerY+100);
  vertex(centerX-73, centerY+120);
  vertex(centerX-33, centerY+120);
  endShape(CLOSE);
//--------------------------

//body
  noStroke();
  fill(255,175,0);
  ellipse(centerX-19, centerY-14, 125, 225);
//--------------------------

//eyes---------------------
//strap
  fill(28, 28, 28);
  rect(centerX-77, centerY-56, 116, 03);
//biggest black brim
  fill(28, 28, 28);
  ellipse(centerX-19, centerY-54, 48, 48);
//Large white bit
  fill(255, 225, 225);
  ellipse(centerX-19, centerY-54, 40, 40);
  
if (mousePressed==false) {
    //grey retina
      fill(170, 165, 163);
      ellipse(centerX-19, centerY-54, 15, 15);
    //black pupil
      fill(28, 28, 28);
      ellipse(centerX-19, centerY-54, 5, 5);

      } else {
        fill(28, 28, 28);
        rect(centerX-77, centerY-56, 100, 2);
      }
//----------------------------  
  
//belt
  stroke(28, 28, 28);
  fill(160,45,32);
  rect(centerX-20, centerY+54, 03, 44);
  
  stroke(28, 28, 28);
  rect(centerX-68, centerY+54, 97, 06);
//--------------------------

//mouth
  fill(160,45,32);
  noStroke();
  beginShape();
  vertex(centerX+15, centerY);
  vertex(centerX+5, centerY);
  vertex(centerX+5, centerY+10);
  vertex(centerX-40, centerY+10);
  vertex(centerX-40, centerY);
  vertex(centerX-50, centerY);
  vertex(centerX-50, centerY+20);
  vertex(centerX+15, centerY+20);
  endShape(CLOSE);
//----------------------------
 println(frameCount);
}
//----------------------------              
