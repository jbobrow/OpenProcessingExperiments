
PImage navigation;
PImage navigationUI;

PFont font;

color c;
void setup() {
  size (400, 400);
  
  navigation = loadImage("eins.jpg");
  navigationUI = loadImage("zwei.jpg");
  
  font = loadFont("");
  
  textFont(font);
  
  noStroke ();
  
}

void draw() {
  image(navigation, 0 ,0);
  image(navigationUI, 0 , 0);
  
  c = ge(mousex, mousey);
  
  if(c == -601323){
    fill(c);
    rect(0, navigation, height, width, 300);
    
    
    text("Kissen .", 10, navigation. height);
  }
  
  if (c == -564202){
    fill(c);
    rect(0, navigation.height, width, 300);
 
 text("Kissen2.", 10, navigation. height);
  }
    
   if (c == -564202){
     fill(c);
     rect(0, navigation.height, width, 300);
     
   }
