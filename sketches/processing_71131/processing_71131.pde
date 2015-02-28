
//Gloriana Gonzalez
//gloriang@andrew.cmu.edu
//Homework #2
//Copyright Gloriana Gonzale, Pittsburgh, August 2012

float px, py, wd, ht;
color col, col2;

void setup ()
{
size(400, 400);
px=width*.5;
py=height*.5;
wd= 150;
ht= 150;
col= color(240, 180, 100);
col2= color (210, 75, 750);
}


void draw()
{
background (140, 195, 195);

 back (px, py, width-frameCount%width, frameCount%height);
  initials (mouseX, mouseY, frameCount%width, frameCount%height);
  
   }


void back (float x, float y, float w, float h)
{
strokeWeight(10);
stroke(210, 75, 75, 50);
fill(190, 225, 225);
ellipse(x+x*.1, y, w*1.8, h*1.8);
fill(190, 225, 225, 60);
strokeWeight(15);
stroke(240,180,100, 70);
ellipse(x+x*.1, y, w*2.2, h*2.2);
}

void initials (float x, float y,  float w,  float h)
{
//Left G
noStroke();
fill(col);
beginShape();
vertex(x, y+.5*h);
vertex(x, y);
vertex(x-w*.2, y);
vertex(x-w*.2, y+h*.1);
vertex(x-w*.1, y+h*.1);
vertex(x-w*.1, y+h*.3);
vertex(x-w*.4, y+h*.3);
vertex(x-w*.4, y-h*.3);
vertex(x, y-h*.3);
vertex(x, y-h*.5);
vertex(x-w*.5, y-h*.5);
vertex(x-w*.5, y+h*.5);
vertex(x, y+.5*h);
endShape();


//Right G
fill (col2);
beginShape();
curveVertex(x+w*.7,y+.5*h);
curveVertex(x+w*.7, y+.5*h);
curveVertex(x+w*.7, y);
curveVertex(x+w*.7-w*.2, y);
curveVertex(x+w*.7-w*.2, y+h*.1);
curveVertex(x+w*.7-w*.1, y+h*.1);
curveVertex(x+w*.7-w*.1, y+h*.3);
curveVertex(x+w*.7-w*.4, y+h*.3);
curveVertex(x+w*.7-w*.4, y-h*.3);
curveVertex(x+w*.7, y-h*.3);
curveVertex(x+w*.7, y-h*.5);
curveVertex(x+w*.7-w*.5, y-h*.5);
curveVertex(x+w*.7-w*.5, y+h*.5);
curveVertex(x+w*.7, y+.5*h);
curveVertex(x+w*.7,y+.5*h);
endShape();
}

void keyPressed() {
   if (keyCode == SHIFT) {
     col=color(random(255), random(255), random(255));
     col2=color(random(255), random(255), random(255));
   }
     
       
   

}


