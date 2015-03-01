
// sets the background color and the size where are can draw. 

void setup()
{
 size(540,480);
 background(62,130,182);
 frameRate(200); 

 White = color(255,255,255);
 Red = color(220,20,60);
 Green = color(200,255,0);
 Blue = color(0,50,255);
 Grey = color(125,151,153);
 LightGrey = color(200);
 currentColor = color(125,125,125);
 typeIsRect = true;
}


void draw()
{
 stroke(5);
 smooth();
 
 fill(White);
 ellipse(30,60,20,20);
 fill(Red);
 ellipse(60,60,20,20);
 fill(Green);
 ellipse(90,60,20,20);
 fill(Blue);
 ellipse(120,60,20,20);

 // This  makes the color to start painting when is clicked.
 
 if (mousePressed)
 {
   noStroke();
   fill(currentColor);
   if (typeIsRect)
   {
     if ((mouseX>140) && (mouseY>20) && (mouseX<190) && (mouseY<70))
     {
       ellipse(mouseX-25,mouseY-25,50,50);
     }
     else
     {
       ellipse(mouseX-10,mouseY-10,20,20);
     }
   }
   else
   {
     ellipse(mouseX,mouseY,20,20);
   }
 }
}

// sets the current color that is being selected.
void mousePressed()
{
 
//elipses
 if ((mouseX>20) && (mouseY>50) && (mouseX<40) && (mouseY<70))
 {
   typeIsRect = false;
   currentColor = color(White);
 }
 if ((mouseX>50) && (mouseY>50) && (mouseX<70) && (mouseY<70))
 {
   typeIsRect = false;
   currentColor = color(Red);
 }
 if ((mouseX>80) && (mouseY>50) && (mouseX<100) && (mouseY<70))
 {
   typeIsRect = false;
   currentColor = color(Green);
 }
 if ((mouseX>110) && (mouseY>50) && (mouseX<130) && (mouseY<70))
 {
   typeIsRect = false;
   currentColor = color(Blue);
 }
}
