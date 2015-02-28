
//homework4
//suzanne choi, suzanne1
//copy rights 2013 suzanne choi. 


//mouse click for sticking tongue out
//mouse move for snow effect
//space bar for girl's heart
//continue clicking space bar for changing the heart shape

float x,y,wd,ht;

void setup ()
{
x=0;
y=0;
wd=400;
ht=400;

  size (400,400);
 background(216,97,42); 
  smooth();
   //legs  
  noStroke();
  fill(245,226,203);
  ellipse(x+wd*.45,y+ht*.7,30,200);
  ellipse(x+wd*.55,y+ht*.7,30,200);
//clothes
  fill(28,31,134);
  triangle(x+wd*.5,y,x+wd*.2,y+ht*.7,x+wd*.8,y+ht*.7);

  
}

void draw()
{ 
 x=0;
 y=0;
 wd=400;
 ht=400;

//face
  noStroke();
  fill(245,226,203);
  ellipse(x+wd*.5,y,140,140);

 //hair
  fill(222,205,22);
  ellipse(x+wd*.3,y,25,25);
  ellipse(x+wd*.3,y+ht*.05,20,20);
  ellipse(x+wd*.3,y+ht*.09,20,20);
  ellipse(x+wd*.3,y+ht*.13,20,20);
  ellipse(x+wd*.7,y,25,25);
  ellipse(x+wd*.7,y+ht*.05,20,20);
  ellipse(x+wd*.7,y+ht*.09,20,20);
  ellipse(x+wd*.7,y+ht*.13,20,20);
  
  strokeWeight(2);
  stroke(222,205,22);
  line(x+wd*.7,y+ht*.15,x+wd*.7,y+ht*.20);
  line(x+wd*.7,y+ht*.15,x+wd*.72,y+ht*.20);
  line(x+wd*.7,y+ht*.15,x+wd*.68,y+ht*.20);
  line(x+wd*.3,y+ht*.15,x+wd*.3,y+ht*.20);
  line(x+wd*.3,y+ht*.15,x+wd*.28,y+ht*.20);
  line(x+wd*.3,y+ht*.15,x+wd*.32,y+ht*.20);
//nose  
  strokeWeight(2);
  stroke(203,176,134);
  line(x+wd*.5,y+ht*.02,x+wd*.48,y+ht*.03);
  line(x+wd*.5,y+ht*.02,x+wd*.52,y+ht*.03);
  
//tongue out 
  if(mousePressed) {
    fill(134,28,44);
    noStroke();
    arc(x+wd*.5, y+ht*.1, 15, 30, 0, PI/2);
    arc(x+wd*.5, y+ht*.1, 15, 30, PI/2, PI);}
//normal 
  else{ strokeWeight(2);
  stroke(134,28,44);
  line(x+wd*.46,y+ht*.1, x+wd*.54,y+ht*.1);
  }
  
  fill(255,95);
  noStroke();
  ellipse(mouseX,mouseY,10,10);

}
     
void keyPressed(){
//heart    
if(key == ' '); { 
fill(255,random(255),random(255));

beginShape();
noStroke();
curveVertex(x+wd*.53,y+ht*.33); //control point
curveVertex(x+wd*.5,y+ht*.3);
curveVertex(x+wd*.46,y+ht*.28);
curveVertex(x+wd*.44,y+ht*.31);
curveVertex(x+wd*.46,y+ht*.34);
curveVertex(x+wd*.5,y+ht*.37);
curveVertex(x+wd*.53,y+ht*.4); //control point
endShape();
beginShape();
noStroke();
curveVertex(x+wd*.47,y+ht*.33);//control point
curveVertex(x+wd*.5,y+ht*.3);
curveVertex(x+wd*.54,y+ht*.28);
curveVertex(x+wd*.56,y+ht*.31);
curveVertex(x+wd*.54,y+ht*.34);
curveVertex(x+wd*.5,y+ht*.37);
curveVertex(x+wd*.47,y+ht*.4);//control point
endShape();

  }


//if(key == 'q')saveFrame("hw4.jpg");
}


