
PFont myFont;
PFont yourFont;
PFont hisFont;
PFont herFont;


String[] providenceWords = 
{
     "College", "Memorial", "Textron", "World", "Headquarters", "Park", "Here", "Interstate", "I-95", "10", "Weybosset", "Private", "Assigned", "Parking", "Unauthorized", "Vehicles", "Towed", "Owners", "Expense", "Fasten", "Seatbelts", "TD", "Ameritrade", "BranchFloor", "Covering", "John", "E.", "Fogarty", "Federal", "Building", "Originally", "U.S", "Custom", "House", "Constructed", "1856", "Monday", "Through", "Friday", "This", "Garage", "Closes", "9 P.M.", "Early", "Bird", "Special"
};

void setup()
{
     size(1200, 600);
     background(0,0,0);
}
void draw()
{
     int tempx = mouseX;
     int tempy = mouseY;
     int tempd;
     
     fill(0,0,0);
     rect(0,0,1200,600);
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
     for (int i=0;i<61;i++)
     { 
          for (int j = 0;j<25;j++)
          {
               
               textFont(ourFonts[int(random(3))]);
               //tempd = (50 - int(sqrt((tempx - j*50)*(tempx - j*50) + (tempy - i*10)*(tempy - i*10))));
               
               tempd=int(map((abs(mouseY - (i*10))+10),0,500,1,40));
               tempd=tempd + int(map((abs(mouseX - (j*50))+10),0,500,1,40));
               textSize(tempd);
               print(tempd);
               fill(3*tempd, 177-3*tempd, 255-3*tempd);
               text(providenceWords[int(random(30))]+" "+providenceWords[int(random(46))]+" "+providenceWords[int(random(46))], j*50, i*10);
          }
     }
}


