
//"hw4" CMU 48-757 F'11
//copheightwrite 2011 Zack Jacobson-Weaver
//Drog the mouse to move j's dot.  Press and hold'g' to see if you've got it.  
//'a' may make it easier just keep pressing. 'f' will take you h0me.
  color col;
  color col0;
  color col1;
  color col2;
  color col3;
  color col4;
  color col5;

void setup()
{
  size(400,400);
  frameRate(10);  
  noCursor();
  smooth();
  col=color (random (255),random (255), random (255),20);
  col0=color (0,0,0);
  col1=color(5,23,175);
  col2=color(169,233,240);
  col3=color(255,3,7);
  col4=color(235,3,252);
  col5=color(147,8,147);
}

void draw()
{
  background(col0);
  ellipseMode(CENTER);
  noStroke();
  fill(col1);
  ellipse((width*.5),(height*.5),(width*.75),(height*.75));
  fill(col2);
  ellipse((width*.5),(height*.5),(width*.75-20),(height*.75-20));
  fill(col1);
  ellipse((width*.5),(height*.5),(width*.75-30),(height*.75-30));
stroke(col3);
strokeWeight(5);
noFill();
curve(width*.15,height*.5,width*.175,height*.5,width*.525,height*.275,width*.5,height*.875);
  curve(width*-.1,height*.625,width*.275,height*.7,width*.525,height*.275,width*.5,height*.875);
curve(width*.15,height*.625,width*.275,height*.7,width*.725,height*.5,width*.75,height*1.5);
  stroke(col4);
  beginShape();
  curveVertex(width*.25,height*1.15);
  curveVertex(width*.375,height*.6625);
  curveVertex(width*.475,height*.4425);
  curveVertex(width*.575,height*.335);
  curveVertex(width*.675,height*.28);
  endShape();
beginShape();
curveVertex(width*.438,height*1.2);
curveVertex(width*.438,height*.75);
curveVertex(width*.4625,height*.55);
curveVertex(width*.575,height*.335);
curveVertex(width*.675,height*.28);
endShape();
  beginShape();
  curveVertex(width*.438,height*1.2);
  curveVertex(width*.438,height*.75);
  curveVertex(width*.625,height*.4);
  curveVertex(width*.7,height*.25);
  curveVertex(width*.75,height*.125);
  endShape();
beginShape();
curveVertex(width*.5,height*1.2);
curveVertex(width*.5,height*.8);
curveVertex(width*.6,height*.45);
curveVertex(width*.7,height*.25);
curveVertex(width*.75,height*.125);
endShape();
  noFill();
  stroke(col5);
  bezier(width*.735,height*.285,width*.5875,height*.75,width*.65,height*.8,width*.575,height*.7);
}
void keyPressed()
{
  if (key=='a'){
background(col, random (255),random(255));
col1=color (col,random (128), random (128));
col2=color (col,random (35), random (35));
col3=color (col,random (66),random(66));
col4=color (col,random (187),random (187));
col5=color (col,random (220),random (220));
}
else {
  if (key=='f'){
    
col1=color(5,23,175);
col2=color(169,233,240);
col3=color(255,3,7);
col4=color(235,3,252);
col5=color(147,8,147);
  
}
else{
  if (key=='g'){
ellipseMode(CENTER);
strokeWeight(20);
ellipse(pmouseX, pmouseY, 10,10);
}
}
}
}
void mouseDragged()
{
ellipseMode(CENTER);
strokeWeight(20);
stroke(col5,75);
 ellipse(pmouseX+random(200), pmouseY+random(200), 10,10);
 ellipse(pmouseX/2, pmouseY/2, 10,10);
 ellipse(pmouseX*2, pmouseY*2, 10,10);
 ellipse(pmouseX*2+100, pmouseY*2+200, 10,10);
}
                
                
