
int t = 0;

   
void setup() {

  size(250, 250);
  background(#052121);
 
  smooth();
   
  //background
  noStroke();
  
  fill(#BBDFEB, 100);
  rect (30, 30, 190, 190);
  
  fill(#052121);
  rect (50, 50, 150, 150);
  

}

void draw() {
  
  t++;
  
  PFont font = loadFont ("Univers-66.vlw");
  
    // ("text", time, horizontal offset, vertical offest, color, font
    
    letter_stream("This",   120,   -70,   -30,  #A69E89, font);    
    letter_stream("is",     140,   -50,   0,    #D96523, font);
    letter_stream("a",      160,  -10,   -10,  #143840, font);
    letter_stream("test",   180,  -10,  0,    #E0C297, font);
  
}

void letter_stream(String letter, int end, int posX, int posY, int stream_color, PFont font){
  textFont(font, 30);
  // get static font and t variables
  if(t < end){
    fill(stream_color);
    
    text(letter, t + posX, t + posY);
  }else{
    fill(255);
    text(letter, end + posX, end + posY);
  }
  
  
}
