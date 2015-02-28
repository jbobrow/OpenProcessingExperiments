


int space = 1;
int count = 1;
void setup() {
  size(300,600);


  background(70,255,98);
  noFill();
  smooth();
}

void draw() {
  space = space + 5;
  stroke(2,167,28,random(50,100));
  strokeWeight(5);
  stroke(4,188,33,random(50,100));
  ellipse(150,200,space,space);
  strokeWeight(random(1,3));
  while (count < 30) {
    count = count + 1;
    stroke(191,255,205);
    line(150,200,0,random(0,600));
    line(150,200,random(0,300),0);
    line(150,200,300,random(0,600));
    line(150,200,random(0,300),600);
    line(150,200,300,random(0,600));
    line(150,200,0,random(0,600));
  }
  int w = 150 ;
  int e = 600;
  fill(0,90,8,230);
  ellipse(w,e,80,80);
  fill(36,160,15,100);
  triangle(120, 555, 150, 450, 180, 555);
  triangle(120, 645, 150, 750, 180, 645);
  triangle(105, 570, 0, 600, 105, 630);
  triangle(195, 570, 300, 600, 195, 630);
  noFill();
  fill(255,255,0,3);
  quad(150,150,200,200,150,250,100,200);
  fill(255,255,0,1);
  quad(150,150,100,100,150,50,200,100);
  quad(150,250,200,300,150,350,100,300);
  quad(250,150,300,200,250,250,200,200);
  quad(50,150,100,200,50,250,0,200);
  noFill();


}


