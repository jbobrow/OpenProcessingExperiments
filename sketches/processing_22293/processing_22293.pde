
void setup() {
background(250,10,44);
size(300,300);
}

void draw() {
for (int i = 0; i < 300; i = i+5) 
  line(0, i, 300, i);
fill(0,0,3);
triangle(150,75,225,225,75,225);
}                               
