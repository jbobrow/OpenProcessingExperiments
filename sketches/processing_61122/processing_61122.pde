
void setup() {
  size(300,300);
  smooth();
}

void draw() {
  background (0);
  
for(int i = 10; i < height; i = i+ 20) { 
    for(int j = 10; j < width; j = j + 20){
      fill(300-i);
      ellipse(j,i,5,5);
    }
  }
}
