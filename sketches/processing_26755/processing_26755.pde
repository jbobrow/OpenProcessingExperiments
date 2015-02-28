
int Yellow;
int Red;
int Green;
int Blue;
int Grey;
int LightGrey;
color currentColor;
boolean typeIsRect;


void setup()
{
 size(640,480);
 background(95);
 frameRate(60);

 Yellow = color(255,255,0);
 Red = color(255,0,0);
 Green = color(0,255,0);
 Blue = color(0,0,255);
 Grey = color(95);
 LightGrey = color(95);
 currentColor = color(102);
 typeIsRect = true;
 

}

//buttons for painting
void draw()
{
 stroke(3);
 smooth();

 fill(Yellow);
 rect(20,20,20,20);
 fill(Red);
 rect(50,20,20,20);
 fill(Green);
 rect(80,20,20,20);
 fill(Blue);
 rect(110,20,20,20);
 
 //eraser
 fill(Grey);
 rect(140,20,50,50);
 
 fill(Yellow);
 ellipse(30,60,20,20);
 fill(Red);
 ellipse(60,60,20,20);
 fill(Green);
 ellipse(90,60,20,20);
 fill(Blue);
 ellipse(120,60,20,20);

 // Paints if mouse is pressed
 if (mousePressed)
 {
   noStroke();
   fill(currentColor);
   if (typeIsRect)
   {
     if ((mouseX>140) && (mouseY>20) && (mouseX<190) && (mouseY<70))
     {
       rect(mouseX-25,mouseY-25,50,50);
     }
     else
     {
       rect(mouseX-10,mouseY-10,20,20);
     }
   }
   else
   {
     ellipse(mouseX,mouseY,20,20);
   }
 }
}

void mousePressed()
{
//rectangle brush
//yellow
if ((mouseX>20) && (mouseY>20) && (mouseX<40) && (mouseY<40))
 {
   typeIsRect = true;
   currentColor = color(Yellow);
 }
 
 //red
 if ((mouseX>50) && (mouseY>20) && (mouseX<70) && (mouseY<40))
 {
   typeIsRect = true;
   currentColor = color(Red);
 }
 
 //green
 if ((mouseX>80) && (mouseY>20) && (mouseX<100) && (mouseY<40))
 {
   typeIsRect = true;
   currentColor = color(Green);
 }
 
 //blue
 if ((mouseX>110) && (mouseY>20) && (mouseX<130) && (mouseY<40))
 {
   typeIsRect = true;
   currentColor = color(Blue);
 }
 
 //grey
 if ((mouseX>140) && (mouseY>20) && (mouseX<190) && (mouseY<70))
 {
   typeIsRect = true;
   currentColor = color(Grey);
 }
 
//elipses
//yellow
 if ((mouseX>20) && (mouseY>50) && (mouseX<40) && (mouseY<70))
 {
   typeIsRect = false;
   currentColor = color(Yellow);
 }
 
 //red
 if ((mouseX>50) && (mouseY>50) && (mouseX<70) && (mouseY<70))
 {
   typeIsRect = false;
   currentColor = color(Red);
 }
 
 //green
 if ((mouseX>80) && (mouseY>50) && (mouseX<100) && (mouseY<70))
 {
   typeIsRect = false;
   currentColor = color(Green);
 }
 
 //blue
 if ((mouseX>110) && (mouseY>50) && (mouseX<130) && (mouseY<70))
 {
   typeIsRect = false;
   currentColor = color(Blue);
 }
}

