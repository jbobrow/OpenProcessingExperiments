
//loops
//pattern10
void setup() {
size(800, 800);
frameRate(30);

int x;
int y;

PFont comic;

// The font "Meta-Bold.ttf" must be located in the 

// current sketch's "data" directory to load successfully

comic = loadFont("Comic-Sans.ttf");

textFont(comic); 


}

void draw() {
  fill(mouseX, mouseY, random(255));
  textSize(random(10,40));
  for (int x=0; x<mouseX; x++)
  for (int y= 0; y<mouseY; y++)
  
    
    text("fuck",x*random(50), y*random(10));
    //

    
    //random(-10., 10.), 10);
    
}



