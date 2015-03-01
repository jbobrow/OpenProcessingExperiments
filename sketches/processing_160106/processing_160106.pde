


int x2 = 0;
int y2 = -100;

 int x1 = 0;
int y1 = 0;
 

 void draw() {
    if (x1 < width) {
      stroke(0, random(60,350), random(30,350), 70);
      x1+=1;
      line(x1, y1, random(0, height), width);
   } else { x1 = -100; }
}

void setup() {   
    background(255);
    size(600, 600);
    smooth();
    frameRate(130);
    strokeWeight(1);
}

}
