

int screenW = 1200;

int size = 30;
float distance = 0.0;
float randomness = 0.0;

void setup() {
  size(1200, 50);
  background(255);
  noFill(); 
}

void draw() {
  
  if(mousePressed) background(255); // clear image
  
  stroke (50, 100);
  
  int i = 0;
  int x = 0;
  int y = 0;
 
  while(x < screenW)
  {
        x = 10 + i * 40;
        y = 10;
        
        // __________find this square's distance from mouse
        //...feel free to ignore this...
        distance = abs(mouseX - x); // how far from mouse?
        distance = distance / screenW; // put in range 0. to 1.
        distance = 1.0 - distance; // flip range, so it's higher number for closer
        // a weird math trick to effect closer areas more than far
        distance =  distance * distance * distance * distance * distance  * distance * distance * distance;
        
        // ___________add in some randomness
        randomness = random(30.) - 15.0;
        x += distance * randomness;
        randomness = random(30.) - 15.0;
        y += distance * randomness;
        
        rect(x, y, size, size);
        i++; // increment counter
  }
  
}

