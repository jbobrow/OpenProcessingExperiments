
void setup(){
// Set the size of the window
size(250,250);
//background(mouseX,0, mouseY);
background(0);
frameRate(30);
}



void draw() {

smooth();

ellipseMode(CENTER);
rectMode(CENTER);

  
 if (mouseX>3)
{
  //body
 fill(mouseX, 0, mouseY); 
// stroke(mouseX);
//ellipse(75,70,90,80);
ellipse(mouseX,mouseY,90,80);

//left leg
noStroke();
 fill(mouseY, 0, mouseX); 
ellipse(mouseX-15,mouseY+42,15,15);
ellipse(mouseX-20,mouseY+53,12,12);
ellipse(mouseX-25,mouseY+60,9,9);

//right leg
 fill(mouseY, 0, mouseX); 
ellipse(mouseX+18,mouseY+42,15,15);
ellipse(mouseX+23,mouseY+53,12,12);
ellipse(mouseX+28,mouseY+60,9,9);

//eyes
fill (255);
stroke(40);
ellipse(mouseX-19,mouseY,30,33);

ellipse(mouseX+19,mouseY,30,33);

//pupils
fill(40);
ellipse(mouseX-19,mouseY+9,24,15);
ellipse(mouseX+19,mouseY+9,24,15);

}


//hair

//smile

//x 75 y 70
stroke(0);
if (mouseY>=125)
{
line(mouseX-19,mouseY+24,mouseX+20,mouseY+30);
line(mouseX-19,mouseY+24,mouseX-18,mouseY+20);
line(mouseX+20,mouseY+26,mouseX+20,mouseY+30);
}

else
{
line(mouseX-19,mouseY+30,mouseX+20,mouseY+24);
line(mouseX-19,mouseY+30,mouseX-20,mouseY+26);
line(mouseX+20,mouseY+20,mouseX+20,mouseY+24);


}

}

void mousePressed() {
  
//eyes
fill (40);

ellipse(mouseX-19,mouseY,30,33);
ellipse(mouseX+19,mouseY,30,33);

}



