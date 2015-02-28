
int num = 100;
int numStrings = 25;
float complexity = .25;
Strin[] myString = new Strin[numStrings];
void setup(){
  size(500, 500, P2D);
  background(0);
  strokeWeight(15);
  for(int i = 0; i < numStrings; i++){
    myString[i] = new Strin((float).2*i);
  }
    for(int i = 0; i < numStrings; i++){
    myString[i].make();
  }
      noisy+= increment;
}

float noisy;
float increment = .03;

void draw(){
  background(0);
  for(int i = 0; i < numStrings; i++){
    myString[i].make();
  }
      noisy+= increment;
}
class Strin{
float siz;
float pX;
float pY;
  Strin(float siz_){
    siz = siz_;
  }
  void make(){
    for (int i = 0; i < num; i++){
      float radius = noise(1+sin((float)i/num*TWO_PI)*siz*complexity, 1+cos((float)i/num*TWO_PI)*siz*complexity, noisy);
      float x = 250+siz*100*radius*cos((float)i/num*TWO_PI);
      float y = 250+siz*100*radius*sin((float)i/num*TWO_PI);
      stroke(255-radius*200, radius*255, 127+127*sin((float)i/num*TWO_PI), 50);
      line(x, y, pX, pY);
      pX = x;
      pY = y;
    }
  }
}

