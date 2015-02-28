
//Richard May rwmay@andrew.cmu.edu
//hw#5
//Copyright September 2012
//hold z to spawn circles, hold c to clear the screen with black
//hold spacebar and move mouse around to spawn initials
//hold b to slow down spawn of intial and hold v to speed the spawn rate up

float x,y,wd,ht,rot;
color col;

void setup ()
{
  size (800,800);
  background (255,255,255);
  col = color (255);
}


void keyPressed() {
  if (key == 'z'){
  scatter (dist (mouseX, mouseY, 20, 20),random (0,width),random (0,height),dist (mouseX, mouseY, 20,20),dist (mouseX, mouseY, 20,20),20);
  
    loop();
}
}



void draw()
{

float tail;
tail=10;
smooth();
noStroke();
// fuzball (mouseX, mouseY);
//if (keyPressed) {
//    if (key == ' '){

if (keyPressed) {
    if (key == 'v'){
      tail= 5;
    }
    else if (key == 'b'){
      tail=20;
    }
    else if (key == 'c'){
      fill (0,0,0,15);
      rect(0,0,width,height);
    }
    if(frameCount%tail==0)
   {
  intial (mouseX,mouseY, width/3,height/3);
   }
    println (tail);
}
}
//if (keyPressed) {
//      if (key == 'b'){  
//         
//      }
//  else if (key == 'c') { 
//    noStroke();
//    fill(255,255,255,5);
//    //rectMode(CORNER);
//    rect (.5*width,.5*height,width,height);
//    }
 

void scatter (float d, float runX, float runY, float runW, float runH,float opac)
{
 fill (random (255), random (255), random (255),opac);
  ellipse (runX,runY,runW,runH);
}
void intial (float x, float y, float wd, float ht)
{
  
smooth();
  
 
noFill();
stroke (220,220,220);
strokeWeight(3);
fill(210,210,210,0);
ellipse(x ,y ,wd ,ht);
ellipse(1.1 * x,1.1 * y,wd,ht);
ellipse(x,y, .7 * wd, .7 * ht);
fill(210,0,0,10);
ellipse(1.1 * x,1.1 * y,wd,ht);
 
beginShape();
  //R
    //strokeWeight (30);
    stroke(137,0,9);
    curveVertex(x-wd/1,y+ht/10);//curve define
    curveVertex(x-wd/2.5,y+ht/3.2);//1
    curveVertex(x - wd/2.4, y-ht/3);//3
    curveVertex(x-wd/10,y-ht/3);//5
    curveVertex(x-wd/3, y-ht/20);//8
    curveVertex(x-wd/5,y+ht/2);//9
    curveVertex(x-wd/10,y+ht/6);//curve define
endShape();
 
//strokeWeight (10);
stroke (144,174,255);
point (x-wd/2.5,y+ht/3.2);//1
point (x - wd/2.4, y-ht/3);//3
point (x-wd/10,y-ht/3);//5
point (x-wd/3, y-ht/20);//8
point (x-wd/5,y+ht/2);//9
 
//noFill();
fill(0,210,0,10);
beginShape();
  //W
    stroke (206,117,0);
    curveVertex(x-wd/7,y-ht/1);
      curveVertex (x-wd/3.5, y-ht/20);//8
      curveVertex(x-wd/6.3,y+ht/2);//9
      curveVertex(x-wd/12, y-ht/20);//8
      curveVertex(x+wd/4,y+ht/2);//9
      curveVertex(x+wd/2,y-ht/16);//9
     curveVertex(x+wd/5,y-ht/3);
endShape();
 
stroke (225,225,225);
point (x-wd/3.5, y-ht/20);//8
point (x-wd/6.3,y+ht/2);//9
point (x-wd/12, y-ht/20);//8
point (x+wd/4,y+ht/2);//9
point (x+wd/2,y-ht/16);//9
 
fill(0,0,210,10);
beginShape();
  //M
    stroke(98,1,87);
  curveVertex (x-wd/8,y-ht/10);
    curveVertex(x-wd/5, y+ht/3);
    curveVertex(x-wd/8, y-ht/6);
    curveVertex(x+wd/4, y+ht/3);//8
    curveVertex(x+wd/2, y-ht/7);
    curveVertex(x+wd/1.8, y+ht/3);
  curveVertex(x+wd/2,y-ht/4);
endShape();
     
     
     
point (x-wd/5, y+ht/3);
point (x-wd/8, y-ht/6);
point (x+wd/4, y+ht/3);//8
point (x+wd/2, y-ht/7);
point (x+wd/1.8, y+ht/3);
 
//saveFrame("hw2.jpg");
}



