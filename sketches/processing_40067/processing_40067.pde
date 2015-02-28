
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
  colorMode (HSB,0,50,200,50);
  
  PImage b;
   b = loadImage("GG.JPG");
   image(b,0,0);

  
  for(int i = 0; i < data.length; i++) {    
    
    float rectSize = map(data[i], 9000,100700,50,100); 
    fill(100,100,rectSize);
    stroke(100);
    smooth();
    
    rect (i*70 + 5 ,150,rectSize,rectSize); 
   
    
   text(data[i], i*70 + 10, 115); 
    
    
   PFont font; 
   textSize(35);
   text("San Francisco Neighborhoods",225,65);
   
  font = loadFont("Social.vlw"); 
  textFont(font,18);
   
  text("Chinatown", 10,360);
   
  text("Sunset", 85,330);
   
  text("Castro",148,300);
    
  text("Mission" ,220,280);
  
  text("Haight", 290,260);
  
  text("Marina",355,253);
  
  text("Noe",445,230);
  
  text ("Valley", 432,248);
  
  text("Tenderloin", 480,148);
    
  text("North ", 572,230);
  
  text("Beach", 570,248);
  
  text("Filmore",633,148);
  
  text("Potrero",700,230);
  
  text("Hill",718,248);
  
  text("SoMa",783,225);
  
  text("Financial", 825,148);
    
    
    } 
}



