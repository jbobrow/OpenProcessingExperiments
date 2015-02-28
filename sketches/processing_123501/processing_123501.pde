
int count = 0;

void setup(){
  size(400, 400);
}

void draw(){
  
  loadPixels();
  for(int y = 0; y < height; y++){
    for(int x = 0; x < width; x++){
      int tx = x - width / 2;
      int ty = y - height / 2;
      
      int val = abs(tx) + abs(ty);
      //int val = abs(tx) + (int)(sin(radians(abs(ty))) * 10);
      color c;
      
      if((val + count) % 20 < 10)
      {
        c = color(255);
      } else {
        c = color(0);
      }
      
      pixels[y * width + x] = c;
      
    }
  }
  updatePixels();
  
  count++;
}

