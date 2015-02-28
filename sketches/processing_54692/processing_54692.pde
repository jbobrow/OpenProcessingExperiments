
PFont myFont;
PFont yourFont;
PFont hisFont;
PFont herFont;
Boolean mousePressing = false;
int mainColor;
int tempx;
int tempy;
int tempc;
int fillVal;
int tempe;

String[] providenceWords = 
{
     "College", "Memorial", "Textron", "World", "Headquarters", "Park", "Here", "Interstate", "I-95", "10", "Weybosset", "Private", "Assigned", "Parking", "Unauthorized", "Vehicles", "Towed", "Owners", "Expense", "Fasten", "Seatbelts", "TD", "Ameritrade", "BranchFloor", "Covering", "John", "E.", "Fogarty", "Federal", "Building", "Originally", "U.S", "Custom", "House", "Constructed", "1856", "Monday", "Through", "Friday", "This", "Garage", "Closes", "9 P.M.", "Early", "Bird", "Special"
};

void setup()
{
     size(800, 800);
     background(0, 0, 0);
}
void mousePressed(){ mousePressing = true;
}
void mouseReleased(){ mousePressing = false;}
void draw()

{
     print(mousePressing);
     if(mousePressing == false){
          
     tempx = mouseX;
     tempy = mouseY;
     }
     int tempd;

     fill(0, 0, 0);
     rect(0, 0, 800, 800);
     //fill(255,255,255);
     myFont = loadFont("DilleniaUPCItalic-48.vlw");
     yourFont = loadFont("EdwardianScriptITC-48.vlw");
     hisFont = loadFont("ErasITC-Light-48.vlw");
     herFont = loadFont("FreesiaUPC-48.vlw");
     PFont[] ourFonts = 
     { 
          myFont, yourFont, hisFont, herFont
     };
     textAlign(CENTER);
     if (keyPressed)
     {
          for (;;) {
          } //break the program
     }
     
//     if (mousePressed)
//     {
//////          fill(0, 0, 0);
//////          rect(0, 0, 440, 800);
////          fill(255, 255, 255);
////          tempd=int(map((abs(mouseY - 400)), 0, 500, 17, 1));
////          tempd=tempd + int(map((abs(mouseX - 220)), 0, 500, 17, 1));
////          textSize(tempd);
////          text(providenceWords[int(random(30))]+" "+providenceWords[int(random(46))]+" "+providenceWords[int(random(46))], mouseX, mouseY);
//     }
//     else
//     {
          for (int i=0;i<81;i++)
          { 
               for (int j = 0;j<20;j++)
               {

                    textFont(ourFonts[int(random(3))]);
                    //tempd = (50 - int(sqrt((tempx - j*50)*(tempx - j*50) + (tempy - i*10)*(tempy - i*10))));

                    tempd=int(map((abs(tempy - (i*10))+10), 0, 500, 1, 38));
                    tempd=tempd + int(map((abs(tempx - (j*50))+10), 0, 500, 1, 38));
                    if (mousePressing == true)
                    {
                    tempc = int(sqrt((mouseX - tempx)*(mouseX - tempx) + (mouseY - tempy)*(mouseY - tempy))); //distance between mouse and the last clicked point
                    tempe=int(sqrt((j*50 - tempx)*(j*50 - tempx) + (i*10- tempy)*(i*10-tempy)));       //distance between the current letter and the last clicked point
                    tempe=int(map(abs(tempe - tempc),0,456,255,0));
                    
                    fill(tempe,tempe,tempe);     
                         
                    ;}
                    else
                    {
                    fill(3*tempd, 3*tempd, 3*tempd);
                    }
                    textSize(tempd);
                   
                    //print(tempd);


                    text(providenceWords[int(random(30))]+" "+providenceWords[int(random(46))]+" "+providenceWords[int(random(46))], j*50, i*10);
               }
          }
     }
//}


