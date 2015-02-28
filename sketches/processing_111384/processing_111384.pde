
//Code-Objects: For loops: Quad shape 
//VIIRJ.COM, 2013

void setup() {
  size(600, 600);
  noFill();
  smooth();
}

void draw() {
  float x;
  x=mouseY;
  float pen=map(x, 150, 100, 50, 30);
  float ran=random(20);

  strokeJoin(ROUND);
  //stroke(ran,pen,200);
  // strokeWeight(ran);
  strokeWeight(2);
  stroke(255);
  fill(60, ran, pen, 100); //controls color of shapes
  background(33);

  scale(0.3);

  float c1 = x; //spaces inbetween
  float c2 = c1+10;

  for (float i=213; i<=555; i+=3) {
    for (float j=213;j<=300;j+=5) {
      //drawing squares and shapes

      //quad(50,50,100,50,100,150,50,150);
      //  rotate(45);
      //  quad(j,i,i,c1,i,i,c1,i);//spaces inbetween
      // rotate(90);
   rotate(90);
      quad(c1+800, c1+800, i, c1, i, i, c1, i);

     // quad(i,i,i,c1-30,i,200,i,i);

      i++;
    j++;
      // quad(c1,c1,i-HALF_PI,c1,i-HALF_PI,i-HALF_PI,c1,i-HALF_PI);
    }
  }
}



