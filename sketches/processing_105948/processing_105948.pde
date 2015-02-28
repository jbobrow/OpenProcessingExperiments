
//Courtesy of Anthony Marefat

Monster[] bob = new Monster[3];

void setup() {
  size(600, 400);
  for (int i=0;i<bob.length;i++) {  
    bob[i]=new Monster();
    bob[i].prime(i* width/bob.length, height/2);
  }
}

void draw() {
  background(255);

  int cols;
  int rows;

  int size;
  color c;
  
  size=20;
  
  cols = width/size;
  rows = height/size;
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i*size;
      int y = j*size;

      c=int(random(255));
      fill(c);
      stroke(0);
      rect(x, y, size, size);
    }
  }
  
  //mickey
  
  for (int i=0;i<bob.length;i++) {
    bob[i].animate();
  }
}

class Monster{

float x;
float y;

void prime(float a, float b){
x=a;
y=b;
}

void animate(){
//Body
fill(0);
ellipse(x, y, 100, 100);
ellipse(x+50, y-50, 50, 50);
ellipse(x-50, y-50, 50, 50);

//Eyes
fill(255);
ellipse(x-20, y-10, 20, 20);
ellipse(x+20, y-10, 20, 20);

x=x+5;

if (x>width) {
    x=-20;
  }


}
}



