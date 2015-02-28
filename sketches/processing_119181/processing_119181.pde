
void draw()
{
//4.Reihe 2.Rechteck
  pushMatrix();
  
translate(200,240);
float winkel = map(mouseX,0,20000,0,3*PI);
rotate(winkel);

fill(255);
noStroke();
rect(-10,-10,55,70);

fill(50,50,130);
noStroke();
rect(0,0,25,50);
  
  popMatrix();
  resetMatrix();
  
  
//4.Reihe 2.Rechteck
  pushMatrix();
  
translate(50,240);
float winkel1 = map(mouseX,0,20000,0,3*PI);
rotate(winkel1);

fill(255);
noStroke();
rect(-10,-10,55,70);

fill(50,50,130);
noStroke();
rect(0,0,25,50);
  
  popMatrix();
  resetMatrix();
  
//4.Reihe 8.Rechteck
  pushMatrix();
  
translate(350,240);
float winkel2 = map(mouseX,0,20000,0,3*PI);
rotate(winkel2);

fill(255);
noStroke();
rect(-10,-10,55,70);

fill(50,50,130);
noStroke();
rect(0,0,25,50);
  
  popMatrix();
  resetMatrix();
 
}


void setup()
{
size(500,500);
background(255);

fill(80);
rect(25,25,25,50);
rect(75,25,25,50);
rect(125,25,25,50);
rect(175,25,25,50);
rect(225,25,25,50);
rect(275,25,25,50);
rect(325,25,25,50);
rect(375,25,25,50);
rect(425,25,25,50);
rect(475,25,25,50);

translate(-25,75);
fill(80);
rect(25,25,25,50);
rect(75,25,25,50);
rect(125,25,25,50);
rect(175,25,25,50);
rect(225,25,25,50);
rect(275,25,25,50);
rect(325,25,25,50);
rect(375,25,25,50);
rect(425,25,25,50);
rect(475,25,25,50);
resetMatrix();


translate(0,140);
fill(80);
rect(25,25,25,50);
rect(75,25,25,50);
rect(125,25,25,50);
rect(175,25,25,50);
rect(225,25,25,50);
rect(275,25,25,50);
rect(325,25,25,50);
rect(375,25,25,50);
rect(425,25,25,50);
rect(475,25,25,50);
resetMatrix();

translate(-25,215);
fill(80);
rect(25,25,25,50);
rect(75,25,25,50);
rect(125,25,25,50);
rect(175,25,25,50);
rect(225,25,25,50);
rect(275,25,25,50);
rect(325,25,25,50);
rect(375,25,25,50);
rect(425,25,25,50);
rect(475,25,25,50);
resetMatrix();

translate(0,290);
fill(80);
rect(25,25,25,50);
rect(75,25,25,50);
rect(125,25,25,50);
rect(175,25,25,50);
rect(225,25,25,50);
rect(275,25,25,50);
rect(325,25,25,50);
rect(375,25,25,50);
rect(425,25,25,50);
rect(475,25,25,50);
resetMatrix();

translate(-25,365);
fill(80);
rect(25,25,25,50);
rect(75,25,25,50);
rect(125,25,25,50);
rect(175,25,25,50);
rect(225,25,25,50);
rect(275,25,25,50);
rect(325,25,25,50);
rect(375,25,25,50);
rect(425,25,25,50);
rect(475,25,25,50);
resetMatrix();

translate(0,440);
fill(80);
rect(25,25,25,50);
rect(75,25,25,50);
rect(125,25,25,50);
rect(175,25,25,50);
rect(225,25,25,50);
rect(275,25,25,50);
rect(325,25,25,50);
rect(375,25,25,50);
rect(425,25,25,50);
rect(475,25,25,50);
resetMatrix();


}
