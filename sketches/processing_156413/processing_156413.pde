
PFont font;
float rectWidth;
float rectHeight;
float xPos;
float yPos;

float xPos2;
float yPos2;

float yPos3;
float xPos3;

float xPos4;

boolean state1;
boolean state2;

boolean state3;
boolean state4;

boolean state5;
boolean state6;

void setup()
{
  size(700, 600);
  font=loadFont("Monospaced-48.vlw");
  rectWidth=60;
  rectHeight=60;
  xPos=150;
  yPos=200;
  
  xPos2=300;
  yPos2=200;
  
  yPos3=400;
  
  xPos3=350;
  xPos4=450;
}

void draw()
{
  background(0);
  textFont(font,18);
  textAlign(TOP, TOP);
  text("Do you like English or Math better?", width/5, height/10);
  //text("Math", xPos, yPos);
  // fill(0,0,0,0);
  rect(xPos, yPos, rectWidth, rectHeight);
  text("Math", xPos, yPos-50);
  //text("Math", xPos, yPos);
   //fill(0,200,0,800); 
   
   rect(xPos2, yPos2, rectWidth, rectHeight);
   text("English", xPos2, yPos-50);
   
   if(state1==true)
   {
     
      textFont(font,18);
      textAlign(TOP, TOP);
      text("Do you like Physics or Computer Science?",width/5 , (height/2)+25);
      rect(xPos,yPos3, rectWidth, rectHeight);
      text("Physics", xPos, yPos3-50);
      
      rect(xPos2,yPos3, rectWidth, rectHeight);
      text("Computer Science", xPos2, yPos3-50);
   }
   
   if(state2==true)
   {
      textFont(font,18);
      textAlign(TOP, TOP);
      text("Do you like Writing or Philosophy?",width/5 , (height/2)+25);
      rect(xPos3,yPos3, rectWidth, rectHeight);
      text("Writing", xPos3, yPos3-50);
      
      rect(xPos4,yPos3, rectWidth, rectHeight);
      text("Philosophy", xPos4, yPos3-50);
    
   } 
   
   if(state3==true)
   {
    text("Hey there George Orwell",xPos3, yPos3+75); 
   }
   
   if(state4==true)
   {
    text("Hey there Socrates", xPos4, yPos3+75); 
   }
   
   if(state5==true)
   {
    text("Hi Einstein",xPos, yPos3+75); 
   }
   
   if(state6==true)
   {
    text("Hey there Bill Gates", xPos2, yPos3+75); 
   }
   
   
   
   
}

void mousePressed()
{
  //checks the boundary of the box for the choice Math
  if(mouseX > xPos && mouseX <xPos+rectWidth)
  {
     if(mouseY >yPos && mouseY <yPos+rectHeight)
     {
       state1=!state1;
     } 
    
  }
  
  //checks the boundary for the box English
  if(mouseX > xPos2 && mouseX < xPos2+rectWidth)
  {
     if(mouseY >  yPos && mouseY <yPos +rectHeight)
      {
        state2=!state2;
        
      }
   
  }
 //checks the boundary for the box writing
 if(mouseX > xPos3  && mouseX < xPos3+rectWidth)
  {
       if(mouseY > yPos3 && mouseY < yPos3 + rectWidth)
       {
        state3=!state3;
         
       }
       
  }     
  //checks the boundary for the box philosophy
  if(mouseX > xPos4  && mouseX < xPos4+rectWidth)
  {
       if(mouseY > yPos3 && mouseY < yPos3 + rectWidth)
       {
        state4=!state4;
         
       }
       
  }

 if(mouseX > xPos && mouseX <xPos+rectWidth)
  {
     if(mouseY >yPos3 && mouseY <yPos3+rectHeight)
     {
       state5=!state5;
     } 
    
  } 
 
  if(mouseX > xPos2 && mouseX <xPos2+rectWidth)
  {
     if(mouseY >yPos3 && mouseY <yPos3+rectHeight)
     {
       state6=!state6;
     } 
    
  }   
       
  
}




