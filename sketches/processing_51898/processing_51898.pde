
/************************************************************
Assignment 2
Elizabeth Figueroa
efiguero@haverford.edu
CS-110-02
2/7/12
This is a sketch of a beautiful ocean sunset in a magical cartoon
world where clouds are light pink round and look like polka dots in the sky!
Click the sky to see them get smaller as they approach the horizon and 
bigger as they go away from it. Click the sea to see purple bezier fish
do the same thing!! 
*************************************************************/
//variables
import netscape.javascript.*;
float horizonY=350;
float r=0.5;

void setup() {
  size(700,700);

  //sky
  background(207,29,165);
  stroke(0);
  line(0,horizonY,700,horizonY);

  //sea
  beginShape();
  fill(30,94,188);
  rect(0,350,700,350);
  endShape();

 //sun
 beginShape();
 smooth();
 strokeWeight(3);
 fill(232,149,7);
 arc(350,350,300,250,3.142,6.291);
 endShape();
}
 
void draw() {
} 

void mousePressed() {
int X=mouseX;
int Y=mouseY;
//fish
if(mouseY>horizonY){
  float r=(mouseY-horizonY)*.01;
  float X2=mouseX+55*r;
float Y2=mouseY-124*r;
float X3=mouseX+168*r;
float Y3=mouseY+4*r;
float X4=mouseX-5*r;
float Y4=mouseY-34*r;
   smooth();
   strokeWeight(5);
   fill(159,59,196);
 bezier(X,Y,X2,Y2,X3,Y3,X4,Y4);

 
 //clouds
} else if(mouseY<horizonY) {
  float r=(horizonY-mouseY)*100;
  smooth();
   strokeWeight(5);
   fill(254,198,247);
   ellipse(X,Y,r/horizonY,r/horizonY);   
} 
  
 
   }
  




  

  





