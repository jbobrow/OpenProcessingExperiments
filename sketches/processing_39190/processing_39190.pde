
//dana gloria
//September 28 2011
//data visualization


int data []= {100574,85252,57244,47234,38738,30690,30574,25067,20171,12934,10622,10490,9701};   
void setup () {
  smooth();
  
 PImage b;
  b= loadImage ("GG.JPG");
  size(900,700);
}


void draw () {
  background(200);
  //smooth(); 
  float colorValue = 0 ; 
  colorMode (HSB,100,100,100,100);
  
  PImage b;
   b = loadImage("GG.JPG");
   image(b,0,0);

  
  for(int i = 0; i < data.length; i++) {    
    
    float rectSize = map(data[i], 2250,100600,0,200); 
    fill(100,100,rectSize);
    stroke(100);
    smooth();
    
    rect (i*70 + 10,180,rectSize,rectSize);  
    
   text(data[i], i*70 + 10, 125); 
    
    
   PFont font; 
   textSize(35);
   text("San Francisco Neighborhoods",225,70);
   
  font = loadFont("Social.vlw"); 
  textFont(font,18);
   
  text("Chinatown", 25,370);
   
  text("Sunset", 100,325);
   
  text("Castro",160,270);
    
  text("Mission" ,228,252);
  
  text("Haight", 300,240);
  
  text("Marina",363,230);
  
  text("Noe",445,210);
  
  text ("Valley", 432,230);
  
  text("Tenderloin", 480,177);
    
  text("North Beach", 550,235);
  
  text("Filmore",623,177);
  
  text("Potrero",690,215);
  
  text("Hill",708,235);
  
  text("SoMa",769,177);
  
  text("Financial", 820,215);
    
    
    } 
}



