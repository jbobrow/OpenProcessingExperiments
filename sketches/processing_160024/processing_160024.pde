
//loopie loops

//color[] dessert = {#9F9694, #791F33, #BA3D49, #F1E6D4, #E2E1DC};
//color[] palette = dessert;

color[] pastel    = {#E8B5FF, #B3AFE8, #CEE8FF, #AFE8E0, #C1FFCF};
color[] palette   = pastel;

int s = 50;

void setup(){
  size(600, 200);
  background(palette[0]);
  smooth();
  noStroke();
  
  for(int x = 0; x < width; x+= s){
    for(int y = 0; y < height; y +=s){
      fill(palette[int(random(1, 5))]);
      ellipseMode(CORNER);
      ellipse(x, y, s, s);
      noStroke();
    }
  }
}

void draw(){
  fill(palette[int(random(1, 5))]);
  int x = int(random(width/s))*s;
  int y = int(random(height/s))*s;
  ellipseMode(CORNER);
  ellipse(x, y, s, s);
  noStroke();
}


