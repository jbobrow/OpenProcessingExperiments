
color c = color(0);
float x = 0;
float y = 100;
float speed = 1;

void setup() {
  size(400,400);
}

void draw() {
  background(255);
  
  triangle(0,113,400,400,400,113);

  line(0,110,400,110);
  
  for(int i= 20; i<width;i+=6){
    if(i%20 == 0){
      line(i,20,i,110);
      triangle(i,20,i-10,10,i+10,30);
    }}
  
  
  //
  
  for(int i=10; i<width; i+=10) {
  // If 'i' divides by 20 with no remainder draw the first line
  // else draw the second line
  if(i%10 == 0) {
    
    line(0, 113, i, width);
  }
}

//

  
  move();
  display();
}

void move() {
  x = x + speed;
  if (x > width+90) {
    x = -300;
  }
}

void display() {
  fill(c);
  rect(x-33,y,30,10);
  rect(x,y,30,10);
  rect(x+33,y,30,10);
}



