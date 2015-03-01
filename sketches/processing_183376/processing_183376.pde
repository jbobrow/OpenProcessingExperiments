
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
   
    int X = 0;
   while( X < 8 ){
     String[] words = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"};
      int index = int(random(words.length)); 
      
      println(words[index]); 
      X++;
      text(words[index], x1+2, y1, 299, 299);
    x1 = x1;
    y1 = y1+11;
      noLoop();
      }

      output.flush();
      output.close();
   
}
  



