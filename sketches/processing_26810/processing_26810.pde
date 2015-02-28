
//DECLARATIONS

int r, g, b;
int value = 0;
//INITIAL SETTINGS
void setup(){
  size(400, 400);
  smooth();
  r = 0;
  g = 20;
  b = 50;

}

//REPEAT
void draw(){
   background(r, g, b);
   b = int(map(mouseX, 0, width, 10, 255));
   g = int(map(mouseX, 0, width, 0, 255));
   


}


void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
  
}

