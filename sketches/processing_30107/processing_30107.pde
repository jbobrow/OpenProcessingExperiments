
void setup(){
  background(50);
size(500,290);
}


void draw(){
  


PFont font = loadFont ("Futura-Bold-20.vlw");

for ( int i =5 ; i < 500; i = i+20) {
  for ( int j = 0; j < 500; j = j+30) {


    fill(random(mouseY),random(mouseX),random(mouseY),random(mouseX));
  
 
    textFont(font, 20);
    text("X", i,j,20,30);

  }
}
}




