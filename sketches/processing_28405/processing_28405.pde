

int b = 50;

void setup() {
size(400, 400);
background(0);
stroke(255);

}


void draw() {
  
  for(int y = 0; y <= height; y = y + 20 ){
    for(int x = 0; x <= width; x = x + 20){
      line (x, y, b*y,b*x);
     

}
  }
}


