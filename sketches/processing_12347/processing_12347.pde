
void setup(){
// Set the size of the window
size(250,250);
background(mouseX,0, mouseY);
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
ellipse(75,70,90,80);

//left leg
noStroke();
 fill(mouseY, 0, mouseX); 
ellipse(60,112,15,15);
ellipse(55,123,12,12);
ellipse(50,130,9,9);

//right leg
 fill(mouseY, 0, mouseX); 
ellipse(93,112,15,15);
ellipse(98,123,12,12);
ellipse(103,130,9,9);

//eyes
fill (255);
stroke(40);
ellipse(56,70,30,33);
ellipse(94,70,30,33);
//pupils
fill(40);
ellipse(56,79,24,15);
ellipse(94,79,24,15);

}


//hair

//smile
stroke(0);
if (mouseY>=70)
{
line(56,94,95,100);
line(56,94,57,90);
line(95,96,95,100);
}
else
{
line(56,100,95,94);
line(56,100,55,96);
line(95,90,95,94);

}

}

void mousePressed() {
  
//eyes
fill (0);
ellipse(56,70,30,33);
ellipse(94,70,30,33);

}
 



