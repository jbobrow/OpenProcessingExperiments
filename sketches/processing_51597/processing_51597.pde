
int size= 50;

void setup() {
size(400,400);
smooth();
}


void draw() {

for (int y=0; y <= height; y+= size){
for (int i=0; i <= width; i+= size){


if( (i+y) % 20 ==0) {

fill(211,228,255);
}

else {
fill(0, 0, 0); 
}
rect( y, i, 50, 50);
}
}
}
void keyPressed() {
  saveFrame("PS1_05image.jpeg");
}

