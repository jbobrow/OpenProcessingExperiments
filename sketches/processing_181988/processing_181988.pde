
PrintWriter output;
PFont f; // declare a font class

float x1 = 10;
float y1 = 10;

void setup(){
  background (255);
  size(300,400);
  rectMode(CORNER);
  //create font
  f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on
  // Create a new file in the sketch directory
  
}

 void draw(){
textFont(f,16);
fill(0);
  float valx = random(0,1);
  if (valx < 0.5) {
    int X = int (random(20));
   while( X < 20 ){
     String[] words = { "UP","UP RIGHT", "UP LEFT", "RIGHT", "DOWN","DOWN RIGHT", "DOWN LEFT", "LEFT" };
      int index = int(random(words.length));  
     
      println(words[index]);  
      X++;
      text(words[index], x1, y1, 290, 290); 
    x1 = x1+11;
    y1 = y1+11;
      noLoop();
      }
  }else{    
   int X = int (random(20));
   while( X < 20 ){
     String[] words = { "UP", "RIGHT", "DOWN", "LEFT" };
      int index = int(random(words.length));  // Same as int(random(4))
      
     println(words[index]);  
      X++;
      // should print a list of words on screen in a box
     text(words[index], x1, y1, 290, 290); 
    x1 = x1+11;
    y1 = y1+11;
      noLoop();
      }
      
     
    
    
  }
      output.flush();
      output.close();
  
} 
  
 
 


