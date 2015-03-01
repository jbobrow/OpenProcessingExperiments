
//changes the color of the red stripes

PImage img;
PFont font;

boolean state1;
boolean state2;
boolean state3;
boolean state4;
boolean state5;
boolean state6;
boolean state7;
void setup()
{
  size(1300, 1000);
  
  font=loadFont("Serif-48.vlw");
  img=loadImage("american_flag.png");
}

void draw()
{
textFont(font);
text("Click on the red stripes of the american flag to change its color", 0,30 );

image(img, width/10, height/15);

    if(state1==true)
    {
       fill(0,255,255);
       //rect(width/10, height/15, width/2, height/2);
       rect((width/2)-20, height/15, width/2.6, height/20);
    }
   
   if(state2==true)
   {
    fill(0,255,0);
    rect((width/2)-20, (height/15)+100, width/2.6, (height/20));
   } 
    
    if(state3==true)
   {
    fill(200,255,0);
    rect((width/2)-20, (height/15)+200, width/2.6, (height/20));
   } 
   
    if(state4==true)
   {
    fill(255,200,0);
    rect((width/2)-20, (height/15)+300, width/2.6, (height/20));
   } 
   
    if(state5==true)
   {
    fill(255,200,100);
    rect(width/10, (height/15)+400, 2*width/2.6, (height/20));
   } 
   
    if(state6==true)
   {
    fill(255,250,100);
    rect(width/10, (height/15)+500, 2*width/2.6, (height/20));
   } 
   
    if(state7==true)
   {
    fill(255,250,100);
    rect(width/10, (height/15)+600, 2*width/2.6, (height/20));
   } 

}

void mousePressed()
{
  
  if(mouseX > (width/2)-50 && mouseX < width-120)
   {
     
     //first red stripe flag
     if(mouseY > 0 && mouseY < 110)
     {
        state1=!state1; 
     }
     
     //second red stripe flag
     if(mouseY > (height/15)+100 && mouseY < ( height/15)+150)
     {
      state2=!state2; 
     }
     
      //third red stripe flag
      if(mouseY > (height/15)+200 && mouseY < ( height/15)+250)
     {
      state3=!state3; 
     }
     //fourth red stripe flag
      if(mouseY > (height/15)+300 && mouseY < ( height/15)+350)
     {
      state4=!state4; 
     }
     
      //if(mouseY > (height/15)+400 && mouseY < ( height/15)+450)
     //{
      //state5=!state5; 
     //}
     
   }
   
   if(mouseX > 0 && mouseX < width-120)
   {
     //fifth red stripe flag
     if(mouseY > (height/15)+400 && mouseY < ( height/15)+450)
     {
      state5=!state5; 
     }
     
     //sixth red stripe flag
      if(mouseY > (height/15)+500 && mouseY < ( height/15)+550)
     {
      state6=!state6; 
     }
      //last red stripe flag
      if(mouseY > (height/15)+600 && mouseY < ( height/15)+650)
     {
      state7=!state7; 
     }
   }
   
   
   
   
  
}



