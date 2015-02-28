
/*
Renders a fish in a sea!
@author Matt Prorok

*/
import javax.swing.*;
private String myBackground;
private Random myRandom = new Random();
void draw()
{
 renderBackground(); 
 fill(System.currentTimeMillis()%255,(System.currentTimeMillis()
 /1000)%255,myRandom.nextInt(255)); 
 triangle(mouseX-80,mouseY-10,mouseX-80,mouseY+30,mouseX-55,mouseY+10);
 ellipse(mouseX-20, mouseY+10,70,45); 
 fill(0,0,0);
 ellipse(mouseX, mouseY,7,7);
  
}
void renderBackground()
{
  if(myBackground.equals("blue"))
  for(int k=0;k<300; k++)
   for(int j=0; j<300; j++){
    set(k,j,color(0,k/1.5,255));      
   }
   else if (myBackground.equals("red"))
    for(int k=0; k<300; k++)
     for(int j=0; j<300; j++){
       set(k,j,color(255,k/1.5,0));
     }
   else
    for(int k=0; k<300; k++)
      for(int j=0; j<300; j++){
        set(k,j,color(0,255,k/1.5));
      }
}
boolean isValidInputColor()
{
 return myBackground.equals("red") || myBackground.equals("green")
    || myBackground.equals("blue"); 
}
void setup()
{
  while (true){
 myBackground=JOptionPane.showInputDialog("red, green, or blue?").
 toLowerCase().trim();
 if (isValidInputColor())
   break;
  }
 
 smooth();

 size(300,300);
 
 renderBackground();




}

