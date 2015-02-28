
void setup() {
  size(300, 300);
}

void draw() {
  background(255);

  int n = 5;
  int spacing = width/n;

  for (int i=0; i < n; i++) {
    line(i*spacing, 0, 0, i*spacing);
    line(i*spacing, width, height, i*spacing);
  
  
   strokeWeight(5);
  fill(0);
int counter = 10;
while(counter < height) {
rect(width/5.9, counter, 200, 30);

counter = counter +50; 
}
}
}


                
                
