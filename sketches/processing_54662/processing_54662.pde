
int x=1;
PFont myFont;
int b = 255;
int sizer;
int upVal =1;          //This is to store if the column goes up or down
int colorVal;
String[] providenceWords = 
{
     "College", "Memorial", "Textron", "World", "Headquarters", "Park", "Here", "Interstate", "I-95", "10", "Weybosset", "Private", "Assigned", "Parking", "Unauthorized", "Vehicles", "Towed", "Owners", "Expense", "Fasten", "Seatbelts", "TD", "Ameritrade", "BranchFloor", "Covering", "John", "E.", "Fogarty","Federal","Building","Originally","U.S","Custom","House","Constructed","1856","Monday","Through","Friday","This", "Garage", "Closes", "9 P.M.","Early","Bird","Special"
     };
     
     void setup()
     {
          size(900,900);
          background(140,120,100);
          myFont = loadFont("AngsanaUPC-BoldItalic-48.vlw");
          
          
     }
     
     void draw()
     {
      textFont(myFont);  
     }
     
     
//     void mouseDragged()
//     {
//          textSize(sizer);
//          
//          b-=10;
//          fill(0,0,0,1);
//          rect(0,0,900,900);
//          fill(255,255,255);
//          text(providenceWords[int(random(30))]+" "+providenceWords[int(random(30))]+" "+ providenceWords[int(random(30))],mouseX,mouseY);
//          
//     }
     void keyPressed()
     {
         if (key == 'a' || key == 'A') 
         {textAlign(LEFT);
         }
         if (key == 's' || key == 'S') 
         {textAlign(CENTER);
         }
         if (key == 'd' || key == 'D') 
         {textAlign(RIGHT);
         }
         if (key == 'q' || key == 'Q') 
         {sizer = 10;    
         }
         if (key == 'w' || key == 'W') 
         {sizer = 20;    
         }
         if (key == 'e' || key == 'E') 
         {sizer = 40;    
         }
         if (key == 'r' || key == 'R') 
         {sizer = 80;    
         }
         if (key == 't' || key == 'T') 
         {sizer = 160;    
         }
         if (key == 'y' || key == 'Y') 
         {sizer = 320;    
         }
         if (key == 'u' || key == 'U') 
         {sizer = 640;    
         }
         if (key == 'i' || key == 'I') 
         {sizer = 1280;    
         }
         if (key == 'o' || key == 'O') 
         {sizer = 2560;    
         }
         if (key == 'z' || key == 'Z') 
         {upVal = 1;    
         }
         if (key == 'x' || key == 'X') 
         {upVal = 2;
         }
         print(key);                              
     }
     void mousePressed()
     {
          if (upVal ==1)
          {
          textSize(sizer);
//          for(int g=0;g<3;g++)
//          {
          for(int i=0; i<50;i++)
          {
          b-=10;
          fill(0,colorVal,colorVal);
          
          text(providenceWords[int(random(30))]+" "+providenceWords[int(random(30))]+" "+providenceWords[int(random(30))],mouseX,mouseY - sizer*i);
          }
          fill(0,0,60,1);
          rect(0,0,900,900);
          colorVal++;
     }
if (upVal ==2)
          {
          textSize(sizer);
//          for(int g=0;g<3;g++)
//          {
          for(int i=0; i<50;i++)
          {
          b-=10;
          fill(0,colorVal,colorVal);
          
          text(providenceWords[int(random(30))]+" "+providenceWords[int(random(30))]+" "+providenceWords[int(random(30))],mouseX,mouseY + sizer*i);
          }
          fill(0,0,60,1);
          rect(0,0,900,900);
          colorVal++;
     }
          }

