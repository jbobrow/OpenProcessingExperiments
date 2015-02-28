
//Code-Objects: For loops: Quad shape2
//VIIRJ.COM, 2013

void setup() {
  size(600, 600);
  noFill();
  smooth();
}

void draw() {
  float x;
  x=mouseY;
  float pen=map(x, 0, 255, 80, 180);
  float ran=random(5);

  strokeJoin(ROUND);
  //stroke(ran,pen,200);
  // strokeWeight(ran);
  strokeWeight(1.3);
  stroke(255);
  fill(ran, 200, pen, 200); //controls color of shapes
  background(33);

  scale(0.58);

  float c1 = x; //spaces inbetween
  float c2 = c1+10;

  for (float i=180; i<=550; i+=10) {
    for (float j=180;j<=440;j+=6) {
      //drawing squares and shapes

      //quad(50,50,100,50,100,150,50,150);
      //  rotate(45);
      //  quad(j,i,i,c1,i,i,c1,i);//spaces inbetween
      // rotate(90);
  //    rotate(90);
      quad(mouseX+400, c1+400, i, c1+15, i, i, c1, i);

      quad(i,i,i,c1-30,i,200,i,i);

      i++;
    //  j++;
      // quad(c1,c1,i-HALF_PI,c1,i-HALF_PI,i-HALF_PI,c1,i-HALF_PI);
    }
  }
}



