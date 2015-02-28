
//leslie bloomfield, project 4

int card = 0;
boolean move=true;
PFont font1;
PImage arrow1;
PImage arrow2;
PImage card1;
PImage card2;
PImage card3;
PImage card4;
PImage card5;
PImage card6;
PImage card7;
PImage card8;
PImage card9;
PImage card10;
PImage card11;
PImage card12;
PImage card13;
PImage card14;


void setup()
{
  size(640, 480);
  smooth();
  font1 = loadFont ("OratorStd-36.vlw");
  card1 = loadImage ("card1.png");
  card2 = loadImage ("card2.png");
  card3 = loadImage ("card3.png");
  card4 = loadImage ("card4.png");
  card5 = loadImage ("card5.png");
  card6 = loadImage ("card6.png");
  card7 = loadImage ("card7.png");
  card8 = loadImage ("card8.png");
  card9 = loadImage ("card9.png");
  card10 = loadImage ("card10.png");
  card11 = loadImage ("card11.png");
  card12 = loadImage ("card12.png");
  card13 = loadImage ("card13.png");
  card14 = loadImage ("card14.png");
  arrow1 = loadImage ("arrow1.png");
  arrow2 = loadImage ("arrow2.png");
}

void draw()
{
  //card1  
    if (card == 0) 
    {
      image(card1, 0, 0);
      
      image(arrow2, 500, 400);
      int left = 490;
      int right = 650;
      int top = 390;
      int bottom = 480;
      
      if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom)
      {
        if (mousePressed && move) 
        {
          card = 2;
          move = false;
        }
        else {
          image (arrow1, 500, 400);
        }
      }
    }
    
    //card 2
    else if (card == 2) 
    {
      image(card2, 0, 0);
      
      image(arrow2, 500, 400);
      int left = 490;
      int right = 650;
      int top = 390;
      int bottom = 480;
      
      if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom)
      {
        if (mousePressed && move) 
        {
          card = 3;
          move = false;
        }
        else 
        {
          image (arrow1, 500, 400);
        }
      }
    }
    
    //card 3
    else if (card == 3)
    {
      image (card3, 0, 0);
      textFont (font1);
      textSize (20);
      fill (#FFFFFF);
      
      text ("- excuse me, sir", 250, 40);
      
      int left = 245;
      int right = 400;
      int top = 30;
      int bottom = 70;
      if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) 
      {
        if (mousePressed && move) 
        {
          card = 4;
          move = false;
        }
        else
        {
        }
      }
    
    text("- hey, you!", 250, 90);
    
    left = 245;
    right = 400;
    top = 80;
    bottom = 115;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) 
    {
      if (mousePressed && move)
      {
        card = 5;
        move = false;
      }
      else
      {
      }
    }
    }
    
    //card 4
    else if (card == 4)
      {
         image (card4, 0, 0);
         fill (#555555);
         text ("i'm trying to sleep.  i know i", 15, 25);
         text("keep irregular hours, but could", 15, 45);
         text("you please respect my lifestyle", 15, 65);
         text("choices?", 15, 85);
         
         fill(#FFFFFF);
         text("- i'm sorry", 370, 320);
         int left = 360;
         int right = 500;
         int top = 310;
         int bottom = 340;
         if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) 
         {
           if (mousePressed && move) 
        {
          card = 6;
          move = false;
        }
        else
        {
        }
      }
      
        text("- hell no!", 370, 355);
        left = 360;
        right = 500;
        top = 345;
        bottom = 375;
        if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) 
        {
          if (mousePressed && move)
          {
            card = 7;
            move = false;
          }
          else
          {
          }
        }
      }
    
    //card 5  
    else if (card == 5)
      {
         image (card5, 0, 0);
         fill (#555555);
         text ("i'm trying to sleep here you dick", 15, 25);
         text("turn down your music and leave me", 15, 45);
         text("to sleep in peace!", 15, 65);
         
         fill(#FFFFFF);
         text("- i'm sorry", 370, 320);
         int left = 360;
         int right = 500;
         int top = 310;
         int bottom = 340;
         if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) 
         {
           if (mousePressed && move) 
        {
          card = 6;
          move = false;
        }
        else
        {
        }
      }
      
        text("- hell no!", 370, 355);
        left = 360;
        right = 500;
        top = 345;
        bottom = 375;
        if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) 
        {
          if (mousePressed && move)
          {
            card = 7;
            move = false;
          }
          else
          {
          }
        }
      }
      
    //card 6
    else if (card == 6)
    {
      image (card6, 0, 0);
       fill (#555555);
       text ("maybe we can", 280, 110); 
       text("compromise--", 280, 130);
       text("i'll be quieter", 280, 150);
       
       fill(#FFFFFF);
       text("- ok", 165, 420);
       int left = 155;
       int right = 250;
       int top = 410;
       int bottom = 440;
       if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) 
         {
           if (mousePressed && move) 
        {
          card = 8;
          move = false;
        }
        else
        {
        }
      }
      
      
       text("- ugh", 165, 445);
       left = 155;
       right = 250;
       top = 435;
       bottom = 465;
       if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) 
         {
           if (mousePressed && move) 
        {
          card = 9;
          move = false;
        }
        else
        {
        }
         }
    }
    
    //card 7
    
    else if (card == 7)
    {
      image (card7, 0, 0);
      fill (#555555);
      text ("i have the", 280, 110); 
      text("right to be", 280, 130);
      text("here as much as", 280, 150);
      text("you!  you don't own", 280, 170);
      text("this forest!!!", 280, 190);
      
       fill(#FFFFFF);
       text("- ok", 165, 420);
       int left = 155;
       int right = 250;
       int top = 410;
       int bottom = 440;
       if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) 
         {
           if (mousePressed && move) 
        {
          card = 8;
          move = false;
        }
        else
        {
        }
      }
      
      
       text("- ugh", 165, 445);
       left = 155;
       right = 250;
       top = 435;
       bottom = 465;
       if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) 
         {
           if (mousePressed && move) 
        {
          card = 9;
          move = false;
        }
        else
        {
        }
         }
    }
      
   //card 8
   else if (card == 8)
    {
      image(card8, 0, 0);
      fill (#555555);
      text("that's a", 15, 25);
      text("good idea.", 15, 45); 
      text("just play", 15, 65);
      text("your music", 15, 85);
      text("softer so i", 15, 105);
      text("can sleep", 15, 125);
      
      fill (#FFFFFF);
      text("- alright!", 450, 325);
      int left = 440;
      int right = 550;
      int top = 315;
      int bottom = 345;
      if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) 
         {
           if (mousePressed && move) 
        {
          card = 10;
          move = false;
        }
        else
        {
        }
         }
        
        
      text("- wait...", 450, 360);
      left = 440;
      right = 550;
      top = 350;
      bottom = 380;
      if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) 
         {
           if (mousePressed && move) 
        {
          card = 11;
          move = false;
        }
        else
        {
        }
         }
    }

   //card 9
   else if (card == 9)
    {
      image (card9, 0, 0);
      fill (#555555);
      text ("if i must", 2, 15); 
      text ("stay awake", 2, 35);
      text ("why don't", 2, 55);
      text ("you come up", 2, 75);
      text ("here? your", 2, 95);
      text ("music is ", 2, 115);
      text ("hella dope and", 2, 135);
      text ("we can listen", 2, 155);
      text ("to it together", 2, 175);
      
      fill (#FFFFFF);
      text("- ok", 500, 325);
      int left = 490;
      int right = 550;
      int top = 315;
      int bottom = 345;
      if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) 
         {
           if (mousePressed && move) 
        {
          card = 13;
          move = false;
        }
        else
        {
        }
         }
      
      text("- um, no", 500, 360);
      left = 490;
      right = 550;
      top = 350;
      bottom = 380;
      if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) 
         {
           if (mousePressed && move) 
        {
          card = 11;
          move = false;
        }
        else
        {
        }
         }
    }
    
   //card10 - ending
    else if (card == 10)
    {
      image(card10, 0, 0);
    }
    
   //card11
   else if (card == 11)
    {
      image(card11, 0, 0);
      
      textSize (40);
      fill(#FFFFFF);
      text("i change my mind!", 15, 35);
      text("you're nothing but", 15, 70);
      text("an old grump!", 15, 105);
      text("i can do", 15, 140);
      text("whatever", 15, 175);
      text("i want!!!", 15, 210);
      int left = 5;
      int right = 450;
      int top = 5;
      int bottom = 230;
      if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) 
         {
           if (mousePressed && move) 
        {
          card = 12;
          move = false;
        }
        else
        {
        }
         }
    }
   
   //card12 - ending
   else if (card == 12)
    {
      image(card12, 0, 0);
    }
    
   //card 13
   else if (card == 13)
    {
      image(card13, 0, 0);
      fill(#FFFFFF);
      text("heh heh heh", 15, 35);
      int left = 5;
      int right = 150;
      int top = 30;
      int bottom = 60;
      if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) 
         {
           if (mousePressed && move) 
        {
          card = 14;
          move = false;
        }
        else
        {
        }
         }
    }
   
   //card 14 - ending
   else if (card == 14)
    {
      image(card14, 0, 0);
    }
   
}

void mouseReleased()
{
  move = true;
}
    


