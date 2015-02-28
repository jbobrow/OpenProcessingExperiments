
int x;
int y;
target o1 = new target();
void setup(){
  size(500,500);
}

void draw(){
o1.display();
o1.move();
}
class target{
float xtar;
float ytar;
float a = random(0,255);
float b = random(0,120);
float c = random(0,255);

target(){
  //xtar = x;
 // ytar = y;
  }

void display(){
smooth();
fill(a,b,c);
rect(xtar, ytar, 60,60);
}

void move(){
  xtar = random(5,400);
  ytar = random(5,400);
  if(xtar < 450){
    xtar = xtar + 3;
  }
  if(ytar < 450){
    ytar = ytar + 3;
  }
}

}


