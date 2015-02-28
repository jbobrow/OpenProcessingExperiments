
//THEGRID
//MILTON SUKHABUT, 8x8 grid, PS1_4

void setup(){
  size(401,401);
  smooth();
  strokeWeight(3);
}

void draw(){
  for(int x = 0; x < height; x += 50){
  for(int y = 0; y < width; y +=50){
    rect (x, y, 50, 50);
    fill(0,132,0,250);
  }
  }
  }

