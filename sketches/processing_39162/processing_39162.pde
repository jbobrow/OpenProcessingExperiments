
//Nathan Aaronson
//Making a forest of identical trees

void setup() {
  size(400, 400);
  background(255);
  smooth();
  noFill();
}

void draw() {
  for (int a=0;a<width+100; a+=40) {
    for (int b=0;b<height+100;b+=40) {
        TreeSections (a, b);
      }
    }
    }



void TreeSections(float x, float y) {
  pushMatrix();
  translate(x, y);
  fill(0,100,0,100);
  ellipse(0, 0, 50, 50);
  strokeWeight(1);
  //branch 1
  line(0, 0, 10, 12);
  line(10,12,18,15);
  line(10,12,0,25);
  //branch 2
  line(0,0,-23,-5);
  line(-18,-5,-15,-20);
  //branch 3
  line(0,0,10,-23);
  //branch 4
  line(0,0,-7,9);
  
 
  popMatrix();
   
}


