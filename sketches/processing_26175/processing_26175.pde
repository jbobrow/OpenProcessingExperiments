
int x1 = 0;
int y1 = 0;
int x2 = 50;
int y2 = 0;
int x3 = 25;
int y3 = 50;

int x21 = -25;
int y21 = 50;
int x22 = 25;
int y22 = 50;
int x23 = 50;
int y23 = 0;

float color1 = random(255);
float color2 = random(255);

void setup(){
 size(500, 500);
 smooth();
}

void draw(){
 fill(mouseY/2, mouseX/2, 200);
rect(0, 0, width, height);
fill(mouseX/2, 40, mouseY/2);
for(int j = 0; j < 10; j++){
 for(int i = 0; i < 10; i++){
   triangle(x1+i*50, y1+j*50, x2+i*50, y2+j*50, x3+i*50, y3+j*50);
 } 
}

fill(100, mouseY/2, mouseX/2);
for(int j = 0; j < 10; j++){
 for(int i = 0; i < 10; i++){
   triangle(x21+i*50, y21+j*50, x22+i*50, y22+j*50, x23+i*50, y23+j*50);
 } 
}
}

