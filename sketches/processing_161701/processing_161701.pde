
/*****************************************
 * Assignment <<< #3>>
 * Name:         <<< Travis Helton >>>
 * Name:         <<< Maciel Smith >>>
 * Course:       CSC 103 - Creative Computing - Fall 2014
 * Submitted:    <<< 9/10/2014>>>
 * 
 * <<< We wanted to fully capture the essense of the "Pew". >>>
 *
***********************************************/
int xPos=199;
int yPos=265;
int Tx=40;
int Ty=50;
int y2=90;
int y3=90;

boolean hitTriangle = false;

//if(int xPos=30; xPos < width; 
//for(
void setup()
{
//frameRate(10);
size(500,500);
background(#5095E8);

}

void draw()
{
  background(#5F3AFA);
 fill(#14F591);
  ellipse(xPos, yPos, 20, 20); //moving circle
  yPos=yPos-2;
  xPos=xPos-2;
  beginShape();
fill(#1C0BDE);
ellipse(250,250,50,50); //head 
endShape();

//stroke(#FFBB0D);//body color for lined body 
beginShape();//stick man
//line(250,350,250,275);//body
stroke(255);
line(200,275,250,320);//left arm stick
line(300,275,250,320);//right arm stick
line(200,400,250,350);//left leg stick
line(300,400,250,350);//right leg stick
rect(230,280,40,50);//square body
fill(#610483);//lower body color
rect(230,320,40,30);//lower body
rect(200, 275, 5, 5);
rect(200, 275, 15,5);
endShape();

beginShape();//grass
fill(#03901B);
noStroke();
rect(0,400,500,300); //grass
endShape();

beginShape();//thoughts 
fill(#1F46CE);//top circle
ellipse(300,200,15,15);//closest to thought
ellipse(380,150,200,50);//largest thought bubble, couldn't get the text inside of it.
fill(#00F4FF);//middle bubble color
ellipse(285,210,15,15);//middle bubble
fill(#FF0026);//smallest bubble
ellipse(275,225,15,15);//closest to head bubble
endShape();
PFont f; //How To get the txt
f = createFont("Arial",16,true);
textFont(f,30);
fill(#D00AF0);
text("Pew! Pew!",300,165); //change the text here

beginShape();//sun
fill(#D8F711);//yellow
ellipse(475,20,100,100);//sun
endShape();

if(abs(xPos - Tx) < 50 && abs(yPos - Ty) < 50){
  hitTriangle = true; 
}

beginShape();//triforce
triangle(60,10,40,50,80,50);//top triangle (x,y,2x,2y,3x,3y)
triangle(80,50,60,90,100,90);//right triangle
triangle(Tx,Ty,20,y2,60,y3);//left triangle

  if (hitTriangle){
    fill(#030000);
    y2=Ty+4;
    Ty=y2+4;
    y3=y3+4;
  }

endShape();
}  

//movement starts below 
/*background(0);
 fill(#14F591);
  ellipse(xPos, yPos, 20, 20); //moving circle
  yPos=yPos-1;
  xPos=xPos-1;
  */


