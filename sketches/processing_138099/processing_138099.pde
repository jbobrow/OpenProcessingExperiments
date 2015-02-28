
//Declare a PImage variable type
PImage cat;
float x= mouseX;

//Load Image file from HDD
void setup() {
 size (800, 600);
 cat = loadImage("taccoprocessing.jpg");
 image(cat, 0, 0);
 cat.resize(800,600);
 image(cat, 0, 0);
 background (0);
 smooth();
}

// draw
void draw(){
  image(cat,0,0,width,height);
  
  }
  
// keyInput, embedded mouseInput  
void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background(360);
  if (key=='s' || key=='S') saveFrame("catmodifi.png");
  
   switch(key){
  case 'g':
    tint (0,mouseX,0);
       break;
    
  case 'b':
      tint (0,0,mouseX);
    break;
    
  case 'r':
     tint (mouseX,0,0);
    break;
   
  }
    
}



