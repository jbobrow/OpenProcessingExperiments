
int counter;
int[][] map;

void setup() {  //setup function called initially, only once

  colorMode(RGB, 255);
  
  map = new int[250][250];
  for(int i = 0; i < map.length; i++) {
      map[i] = new int[250];
      for (int j=0; j< map[i].length; j++) {
          map[i][j] = 255;
      }
  }

  noStroke();
  size(250, 250);
  background(255);  //set background white
  counter = 0;
  
}

void draw() {  //draw function loops 
  counter++;
  
  for(int q=0; q< 5000; q++) {
    
  int x = (int) random(0,249);
  int y = (int) random(0,249);
  
  int v = map[x][y];
  color c = color(nextValue(v),nextValue(v),nextValue(v));
  map[x][y] = nextValue(v) ;

  stroke(c);
  fill(c);
  ellipse(x,y,5,5);
  }
}

int nextValue(int value) {
    return value/1.5;
}
