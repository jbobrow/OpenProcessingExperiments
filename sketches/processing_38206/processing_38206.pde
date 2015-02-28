
//Homework 4
//Copyright Paul Bracchitta September 2011, Pittsburgh PA 15221


float x,y,wd,ht;
color col1;
color col2;
color col3;

void setup() {
  size( 800, 800);

  
  x = 10;
  y = 10;
  wd = 35*x;
  ht = 35*y;
  
  col1 = color(145,10,0);
  col2 = color(23,63,145);
  col3 = color(212,187,0);

  smooth();
  strokeWeight(4);
  
}


void draw () {
   if (mousePressed) {
   background(0);
 fill(255);
 ellipse(mouseX, mouseY, wd, ht);
   fill(255);
   col1 = color(random(256),random(256),random(256));
   col2 = color(random(256),random(256),random(256));
   col3 = color(random(256),random(256),random(256));
   
 }else{
  background(255);
  col1 = color(145,10,0);
  col2 = color(23,63,145);
  col3 = color(212,187,0);
 }
  stroke(0);
  noFill();
  ellipse(mouseX, mouseY, wd, ht);


//guidelines
strokeWeight(1);
stroke(0);
noFill();
ellipse(mouseX, mouseY, .9*wd, ht); //vertical
ellipse(mouseX, mouseY, .8*wd, ht);
ellipse(mouseX, mouseY, .7*wd, ht);
ellipse(mouseX, mouseY, .6*wd, ht);
ellipse(mouseX, mouseY, .5*wd, ht);
ellipse(mouseX, mouseY, .4*wd, ht);
ellipse(mouseX, mouseY, .3*wd, ht);
ellipse(mouseX, mouseY, .2*wd, ht);
ellipse(mouseX, mouseY, .1*wd, ht);
line(mouseX, mouseY-17.5*y, mouseX, mouseY+17.5*y);
ellipse(mouseX, mouseY, wd, .9*ht); //horizontal
ellipse(mouseX, mouseY, wd, .8*ht);
ellipse(mouseX, mouseY, wd, .7*ht);
ellipse(mouseX, mouseY, wd, .6*ht);
ellipse(mouseX, mouseY, wd, .5*ht);
ellipse(mouseX, mouseY, wd, .4*ht);
ellipse(mouseX, mouseY, wd, .3*ht);
ellipse(mouseX, mouseY, wd, .2*ht);
ellipse(mouseX, mouseY, wd, .1*ht);
line(mouseX-17.5*x, mouseY, mouseX+17.5*x, mouseY);
// end guidlines

strokeWeight(.8*x);
stroke(col1);
//Begin P
beginShape();
  //point(x-100,y+120);
  //point(x-137, y+86);
  //point(x-110, y+108);
  
  //point(x-158, y);
  //point(x-140,y);
  
  //point(x-137,y-86);
  //point(x-110,y-108);
  
  //point(x-119,y+114);
  //point(x-90,y+134);
  //point(x-90,y-134);
  //point(x-119,y-114);
  
  curveVertex(mouseX-11.9*x,mouseY+11.4*y);
  curveVertex(mouseX-13.7*x,mouseY+8.6*y);
  curveVertex(mouseX-15.8*x,mouseY);
  curveVertex(mouseX-13.7*x,mouseY-8.6*y);
  curveVertex(mouseX-11.9*x,mouseY-11.4*y);
endShape(); //end of left leg

beginShape();
  curveVertex(mouseX-9*x,mouseY+13.4*y);
  curveVertex(mouseX-11*x,mouseY+10.8*y);
  curveVertex(mouseX-14*x,mouseY);
  curveVertex(mouseX-11*x,mouseY-10.8*y);
  curveVertex(mouseX-9*x,mouseY-13.4*y);
endShape(); // end of right leg P

line(mouseX-11*x,mouseY+10.8*y,mouseX-13.7*x,mouseY+8.6*y);
line(mouseX-11*x,mouseY-10.8*y,mouseX-13.7*x,mouseY-8.6*y);
 bezier(mouseX-11*x,mouseY-10.8*y,mouseX-5.5*x,mouseY-5.5*y,mouseX-2*x,mouseY-2*y,mouseX-14*x,mouseY);
 
//end P

strokeWeight(.8*x);
stroke(col2);
//begin A
beginShape();
  curveVertex(mouseX+5*x,mouseY+19*y);
  curveVertex(mouseX-1.5*x,mouseY+17*y);
  curveVertex(mouseX-4*x,mouseY);
  curveVertex(mouseX,mouseY-17*y);
  curveVertex(mouseX+5*x,mouseY-17.5*y);
endShape(); // left leg A

beginShape();
  curveVertex(mouseX-5*x,mouseY+19*y);
  curveVertex(mouseX+1.5*x,mouseY+17*y);
  curveVertex(mouseX+4*x,mouseY);
  curveVertex(mouseX,mouseY-17*y);
  curveVertex(mouseX-5*x,mouseY-17.5*y);
endShape(); //right leg A

beginShape();
  curveVertex(mouseX-10*x,mouseY);
  curveVertex(mouseX-4*x,mouseY);
  curveVertex(mouseX+4*x,mouseY);
  curveVertex(mouseX+10*x,mouseY);
endShape(); //end A

stroke(col3);
strokeWeight(.8*x);
beginShape();
  curveVertex(mouseX,mouseY-17.5*y);
  curveVertex(mouseX+7*x,mouseY-13*y);
  curveVertex(mouseX+10.5*x,mouseY);
  curveVertex(mouseX+7*x,mouseY+13*y);
  curveVertex(mouseX,mouseY+17.5*y);
endShape();//end left leg B

line(mouseX+7*x,mouseY+13*y,mouseX+10*x,mouseY+10.8*y);
line(mouseX+7*x,mouseY-13*y,mouseX+10*x,mouseY-10.8*y);

beginShape();
  curveVertex(mouseX+3*x,mouseY-17.5*y);
  curveVertex(mouseX+10*x,mouseY-10.8*y);
  curveVertex(mouseX+12.5*x,mouseY);
  curveVertex(mouseX+10*x,mouseY+10.8*y);
  curveVertex(mouseX+3*x,mouseY+17.5*y);
endShape(); //end right leg B

beginShape();
  curveVertex(mouseX+7.0*x,mouseY+13.0*y);
  curveVertex(mouseX+10.0*x,mouseY+10.8*y);
  curveVertex(mouseX+14.0*x,mouseY+6.6*y);
  curveVertex(mouseX+15.0*x,mouseY+.6*y);
  curveVertex(mouseX+12.5*x,mouseY-1.5*y);
  curveVertex(mouseX+15.0*x,mouseY-2.2*y);
  curveVertex(mouseX+14.0*x,mouseY-6.7*y);
  curveVertex(mouseX+10.0*x,mouseY-10.8*y);
  curveVertex(mouseX,mouseY-17.5*y);
endShape(); // end B curves

}

void keyPressed()
{
  //ht = 35*y;
  //wd = 35*x;
  
  if(key == CODED) {
    if (keyCode == LEFT) {
      x = x - 0.05*x;
      wd = 35*x;
    } 
    if (keyCode == DOWN) {
      y = y - 0.05*x;
      ht = 35*y;
    }
    if (keyCode == UP) {
      y = y + 0.05*y;
      ht = 35*y;
    }
    if (keyCode == RIGHT) {
      x = x + 0.05*x;
      wd = 35*x;
    }
  }
}
                
                
