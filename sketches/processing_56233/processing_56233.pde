

// import processing.pdf.*;


void setup()
{
    PFont   font = createFont("Courier New", 40);
    //PFont font;
    //font = loadFont("Monofur-20.vlw");
    
    size (160, 340 );
    textFont(font);
    fill (0);
    smooth();
    noStroke();
    frameRate(2);

};

void draw()
{
  //beginRecord(PDF, "patterns" + frameCount + ".pdf");
  background (255);
  smooth();
  fill (0);
  
  
      String [] symbols = {
    "\u2320", "\u2321", "\u2502", "\u2510", "\u2514", "\u2518", "\u251C", "\u2524", "\u252C", "\u2534", "\u253C", "\u2550", 
    "\u2551", "\u2552", "\u2553", "\u2554", "\u2555", "\u2556", "\u2557", "\u2558", "\u2559", "\u255A", "\u255B", "\u255C",
    "\u255D", "\u255E", "\u255F", "\u2560", "\u2561", "\u2562", "\u2563", "\u2564", "\u2565", "\u2566", "\u2567", "\u2568",
    "\u2569", "\u256A", "\u256B", "\u256C", "\u2580", "\u2584", "\u2588", "\u258C", "\u2590", "\u2591", "\u2592", "\u2593", 
    "\u25A0", "\u25A1", "\u25AA", "\u25AB", "\u25B2", "\u25BA", "\u25BC", "\u25C4", "\u25CA", "\u25CB", "\u25CC", "\u25CF", 
    "\u25D8", "\u25D9", "\u25E6", "\u034F", "\u00F8"};
    
    
    int xRand = round(random(0, 64));    
    String x = symbols[xRand];
    println(x);
    
    int yRand = round(random(0, 64));    
    String y = symbols[yRand];
    println(y);
    
    int zRand = round(random(0, 64));    
    String z = symbols[zRand];
    println(z);
    
    
  switch (7) {
    
    case 1:
      textSize(25);
      textLeading(29);
      text ( 
      x + y + x + y + x + y + x + y + x +
      x + y + x + y + x + y + x + y + x +
      x + y + x + y + x + y + x + y + x +
      x + y + x + y + x + y + x + y + x +
      x + y + x + y + x + y + x + y + x +
      x + y + x + y + x + y + x + y + x +
      x + y + x + y + x + y + x + y + x +
      x + y + x + y + x + y + x + y + x +
      x + y + x + y + x + y + x + y + x +
      x + y + x + y + x + y + x + y + x +
      x + y + x + y + x + y + x + y + x
      , 10,10 , 140, 320 );
      break;
    case 2:
      textSize(25);
      textLeading(29);
      text ( 
      x + y + x + y + x + y + x + y + x +
      y + x + y + x + y + x + y + x + y +
      x + y + x + y + x + y + x + y + x +
      y + x + y + x + y + x + y + x + y +
      x + y + x + y + x + y + x + y + x +
      y + x + y + x + y + x + y + x + y +
      x + y + x + y + x + y + x + y + x +
      y + x + y + x + y + x + y + x + y +
      x + y + x + y + x + y + x + y + x +
      y + x + y + x + y + x + y + x + y +
      x + y + x + y + x + y + x + y + x     
      , 10,10 , 140, 320 );
      break;
      
    case 3:
    textSize(25);
      textLeading(29);
      text ( 
      x + y + z + y + x + y + z + y + x +
      y + z + y + z + y + z + y + z + y +
      x + y + z + y + x + y + z + y + x +
      y + z + y + z + y + z + y + z + y +
      x + y + z + y + x + y + x + y + x +
      y + z + y + z + y + x + y + z + y +
      x + y + z + y + x + y + z + y + z +
      y + z + y + z + y + x + y + z + y +
      x + y + z + y + x + y + z + y + z +
      y + z + y + z + y + x + y + z + y +
      x + y + z + y + x + y + z + y + z     
      , 10,10 , 140, 320 );
      break;
      
    case 4:
     textSize(25);
      textLeading(29);
      text ( 
      x + x + x + x + x + x + x + x + x +
      y + z + y + z + y + z + y + z + y +
      x + x + x + x + x + x + x + x + x +
      y + z + y + z + y + z + y + z + y +
      x + x + x + x + x + x + x + x + x +
      y + z + y + z + y + x + y + z + y +
      x + x + x + x + x + x + x + x + x +
      y + z + y + z + y + x + y + z + y +
      x + x + x + x + x + x + x + x + x +
      y + z + y + z + y + x + y + z + y +
      x + x + x + x + x + x + x + x + x     
      , 10,10 , 140, 320 );
      break;
    case 5:
     textSize(25);
      textLeading(29);
      text ( 
      x + x + x + x + x + x + x + x + x +
      y + y + y + y + y + y + y + y + y + 
      x + x + x + x + x + x + x + x + x +
      y + y + y + y + y + y + y + y + y + 
      x + x + x + x + x + x + x + x + x +
      y + y + y + y + y + y + y + y + y + 
      x + x + x + x + x + x + x + x + x +
      y + y + y + y + y + y + y + y + y + 
      x + x + x + x + x + x + x + x + x +
      y + y + y + y + y + y + y + y + y + 
      x + x + x + x + x + x + x + x + x
      , 10,10 , 140, 320 );
      break;
    case 6:
     textSize(25);
      textLeading(29);
      text ( 
      x + z + x + z + x + x + x + z + x +
      y + y + z + y + z + z + z + y + z + 
      x + z + x + z + x + x + x + z + x +
      y + y + z + y + z + z + z + y + z + 
      x + z + x + z + x + x + x + z + x +
      y + y + z + y + z + z + z + y + z + 
      x + z + x + z + x + x + x + z + x +
      y + y + z + y + z + z + z + y + z + 
      x + z + x + z + x + x + x + z + x +
      y + y + z + y + z + y + z + y + z + 
      x + z + x + z + x + z + x + z + x
      , 10,10 , 140, 320 );
      break;
    case 7:
     textSize(25);
      textLeading(29);
      text ( 
      x + z + x + z + x + z + x + z + x +
      y + z + y + z + y + z + y + z + y + 
      x + z + x + z + x + z + x + z + x +
      y + z + y + z + y + z + y + z + y + 
      x + z + x + z + x + z + x + z + x +
      y + z + y + z + y + z + y + z + y + 
      x + z + x + z + x + z + x + z + x +
      y + z + y + z + y + z + y + z + y + 
      x + z + x + z + x + z + x + z + x +
      y + z + y + z + y + z + y + z + y + 
      x + z + x + z + x + z + x + z + x
      , 10,10 , 140, 320 );
    
    
  }
    
 // endRecord();
  
  
  
  
 
  
};

