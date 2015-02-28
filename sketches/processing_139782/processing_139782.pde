
float x = 200;
float y = 200;
int radius = 100;
float rt = radians(45);
float rb = radians(315);
float mouth = radians(1);
float x1 = 100;
 float x2 = 200;
 float x3 = 300;
void setup() {
  size(800, 400);
}

void draw() {
  background(0);
 
 display(x1,100,color(255,255,0));
 display(x2,200,color(0,255,255));
 display(x3,300,color(255,0,255));
  x1 = move(x1);
  x2 = move(x2);
  x3 = move(x3);
  mouth();
  
}

void display(float x, float y, color c){
  fill(c);
  arc(x, y, radius, radius, rt, rb);
 
}

void mouth(){
 rt -= mouth;
  rb += mouth;
 
  if ( rt < 0 || rt >= radians(45)) {
    mouth *= -1;
  } 
}

float move(float x){
  x += 2;
   if (x > width + radius) {
    x= -radius;
    return x;
  }
  return x;
}
