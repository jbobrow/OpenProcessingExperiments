
//Code-Objects: For loops: Custom shape3 
//VIIRJ.COM, 2013


void setup() {
  size(600, 600);
  noFill();
  smooth();
}

void draw() {
  float x;
  x=mouseY*2;
  // float pen=map(x, 150, 100, 50, 30);
  // float ran=random(20);

  strokeJoin(ROUND);
  //stroke(ran,pen,200);
  // strokeWeight(ran);
  strokeWeight(1.3);
  stroke(255);
  //  fill(60, ran, pen, 100); //controls color of shapes
  background(33);

  scale(0.5);

  float c1 = x; //spaces inbetween
  float c2 = c1+10;


  for (float i=180; i<=width*2; i+=9) {
    //  for (float j=180;j<=440;j+=5) {
    //drawing squares and shapes

    //quad(50,50,100,50,100,150,50,150);
    //rotate(45,45,0,0);
    quad(300, height*2, 5, c1, mouseX*2, c1, c1, i);//spaces inbetween
    quad(300, height*2, 5, c1, i, mouseX, c1, 500);//spaces inbetween

    // rotate(90);
    // rotate(90);
    // rect(i,c1,i,j,j);




    // quad(c1,c1,i-HALF_PI,c1,i-HALF_PI,i-HALF_PI,c1,i-HALF_PI);
  }
  //}
}



