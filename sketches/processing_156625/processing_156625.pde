

color[] blue = {#D9C6B0, #314650, #2D4761, #45718C, #B6E1F2,#C1CDCD,#00CDCD};
color[] palette = blue;

color[] red = {#ff0000, #e50000, #cc0000, #b20000, #990000, #7f0000, #660000};
color[] palette1 = red; //new function//

int s = 30;

void setup(){
  size(1000, 1000);
  background(palette[0]);
  smooth();
  noStroke();
  frameRate(15);

    
  for(int x = 0; x < width; x += s){ //new function//
    for(int y = 0; y < height; y += s) {
      fill(palette[int(random(1, 5))]);
      rect(50, 50, s, s);
    }
  }
}

void draw(){
  fill(palette[int(random(1, 7))]);
  int x = int(random(width/s))*s;
  int y = int(random(height/s))*s;
  rect(x, y, s, s);
  
  
  fill(palette1[int(random(1,7))]);
  ellipse(mouseX,mouseY,10,10);
}




