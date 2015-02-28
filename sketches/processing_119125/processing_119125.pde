
// ___________________ START OF PROGRAM

 //number of rectangles
 Rectangle[] rectangles = new Rectangle[16];
 float xPos, yPos;
 int r, g, b;
 int number_selected;
 int r1 ,g1 ,b1;
 int r2, g2 ,b2;


 void setup(){

   size(525,525);  //size of window
   
   number_selected = 0;  // start with zero cards selected
   xPos = 25;  //margin
   yPos = 25;

   
   for(int i=0; i<rectangles.length; i++){
     
     if(i==0 || i==7){r=0; g=0; b=0;}        // set the colours for when square is active
     if(i==1 || i==11){r=255; g=0; b=0;}
     if(i==2 || i==8){r=0; g=100; b=0;}
     if(i==3 || i==6){r=127; g=0; b=255;}
     if(i==4 || i==12){r=0; g=0; b=255;}
     if(i==5 || i==13){r=255; g=0; b=255;}
     if(i==9 || i==10){r=255; g=128; b=0;}
     if(i==14 || i==15){r=255; g=255; b=0;}
    
     rectangles[i] = new Rectangle(xPos, yPos, r, g, b);
     
     xPos += 125;
   
     //creating a new row of rectangles
     if(i==3 || i==7 || i==11)
     {
      yPos += 125;
      xPos = 25; 
     }
   }

   
 }


 void draw()
 {
 //draw the rectangles 
   for(int i=0; i<rectangles.length; i++){
     rectangles[i].drawRectangle(); 
   }
   
 }


//Class for object Rectangle
 class Rectangle
 {
   int red,green,blue;
   float x,y,w,h;
   boolean selected;
   boolean display;
   
   
      
   Rectangle(float xPos, float yPos, int r, int g, int b)
   {
     x = xPos;
     y = yPos;
     red = r;
     green = g;
     blue = b;
     w=100;
     h=100;
     selected=false;
     display=true;
     
     
     
     
     
  }
  
  
   void drawRectangle()
   {
     if(display==true)  // only display if still in play
     {
       if(selected==true)  //  change colour if selected
       {
         fill(red, green, blue);
       }
       else  // OR have it white
       {
         fill(255);
       }
       rect(x,y,w,h);
     }
     
     
   }
   
  
     
   // called whenever the mouse is clicked
   // allows you to select or deselect a card
   void clicked()
   {
       if (number_selected<3)  // only check if 2 or less selected
       {
         if(mouseX > x && mouseX <(x+w) && mouseY > y && mouseY < (y+h))
         {
             // if 2 are not selected yet, select one
           if(selected==false && number_selected<2)
           {
             selected = true;
             number_selected++;
           }
             // if it is selected, make not selected
             // this allows you to pick another card in its place
           else if(selected==true)
           {
             selected = false;
             number_selected--;
           }
           
           
         }
       }
       
       
     
   }
   


 }

 // every time the mouse is clicked, check if it is clicked on a specific rectangle
 void mouseClicked()
 {
   for(int i=0; i<rectangles.length; i++)
   {
     rectangles[i].clicked();
   }
 }
