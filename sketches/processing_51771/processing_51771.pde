
 //HW#5-initials.
//Joshua Chang
//jmc1 Copyright 2012
//Move mouse around
//Drag the mouse to flash the lights and have laser circles
//Move the mouse to go back to normal
//Press any button to flash quickly

float x,y,value=random(255),colora;

void setup()
{

  size(400,400);
  smooth();
  background(255);
  mouseX=mouseX;
  mouseY=mouseY;
x=width/2;
y=height/2;
rectMode(CENTER);
noStroke();
strokeCap(PROJECT);
strokeJoin(SQUARE);
colora=255;

}

void rect()
{
  noStroke();
  fill (colora,0,0,90);
 rect(x,y,2*x,2*y); 
}

 void mouseDragged()

   {
Initials();
Circles();
  colora=random(200);
   }
void mouseMoved()
{
 colora=255; 
}
void Circles()
{
 noFill();
stroke(random(255), random(255),random(255));
strokeWeight(5);

ellipse(mouseX,mouseY,mouseX-mouseY,300);
ellipse(mouseX,mouseY,300,mouseY-mouseX); 
}

void Initials()
{


//Lines
stroke(colora,255,colora);
strokeWeight(5);
line(0,mouseY-50,width,mouseY-50);
strokeWeight(5);
line(0,mouseY+50,width,mouseY+50);
strokeWeight(1);
line(0,mouseY-55,width,mouseY-55);
strokeWeight(1);
line(0,mouseY-45,width,mouseY-45);
strokeWeight(1);
line(0,mouseY+45,width,mouseY+45);
strokeWeight(1);
line(0,mouseY+55,width,mouseY+55);
 

stroke(255);
strokeWeight(20);
noFill();
arc(mouseX-100,mouseY-35, 100, 50, PI, TWO_PI);
//line(50, 150, 150, 150);
arc(mouseX-100, mouseY+35, 100, 50, 0, PI);
//line(50, 250, 150, 250);

//C-Bottom

arc(mouseX+100, mouseY-35, 100, 50, PI, TWO_PI);
//line(250,150, 350, 150);
arc(mouseX+100, mouseY+35, 100, 50, 0, PI);
//line(250,250, 350, 250);

 fill(colora,255,colora);
  noStroke();
ellipse(mouseX,mouseY,2*x/3,2*y/3);


//J-Bottom
stroke(45,78,98);
strokeWeight(6);
noFill();
arc(mouseX-100,mouseY-35, 100, 50, PI, TWO_PI);
//line(50, 150, 150, 150);
arc(mouseX-100, mouseY+35, 100, 50, 0, PI);
//line(50, 250, 150, 250);
//C-Bottom

arc(mouseX+100, mouseY-35, 100, 50, PI, TWO_PI);
//line(250,150, 350, 150);
arc(mouseX+100, mouseY+35, 100, 50, 0, PI);
//line(250,250, 350, 250);


//M 

strokeWeight(6);
line(mouseX-50, mouseY-40, mouseX-50, mouseY+40);
line(mouseX-50,mouseY-40, mouseX, mouseY+30);
line(mouseX,mouseY+30, mouseX+50, mouseY-40);
line(mouseX+50,mouseY-40, mouseX+50, mouseY+40);

  }
  
  void draw()
{
  rect();
Initials();
}

 void keyPressed()
 {
 background(random(255),random(255),random(255)); 
 }



   
    //saveFrame ("hw5-initials.jpg");
 
 

 //ellipse(mouseX,mouseY,x,y);
  //fill(0,77,77);
  //ellipseMode(CENTER);


