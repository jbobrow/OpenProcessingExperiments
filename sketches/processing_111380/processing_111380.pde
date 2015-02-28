
//Code-Objects: For loops: Custom shape
//VIIRJ.COM, 2013

//how do i move this?!!
//how do I map coordinates efficiently?

void setup() {
  size(600, 600, P3D);
  noFill();
  smooth();
}

void draw() {
  float x;
  x=mouseY*2;
  float pen=map(x, 150, 100, 50, 30);
  float ran=random(20);

  strokeJoin(ROUND);
  //stroke(ran,pen,200);
  // strokeWeight(ran);
  strokeWeight(0.5);
  stroke(255);
  fill(60, ran, pen, 1); //controls color of shapes
  background(33);

  scale(0.35);

  float c1 = x; //spaces inbetween
  float c2 = c1+10;


  for (float i=180; i<=width*2+20; i+=15) {
    //  for (float j=180;j<=440;j+=5) {
    //drawing squares and shapes

    //quad(50,50,100,50,100,150,50,150);
    //rotate(45,45,0,0);

    translate(3, 2, 7);
    quad(mouseY, mouseY, mouseX, c1, mouseX+500, c1, c1, i);//spaces inbetween
    //quad(300,height*2,5,c1,i,mouseX,c1,500);//spaces inbetween

    // rotate(90);
    // rotate(90);
    // rect(i,c1,i,j,j);




    // quad(c1,c1,i-HALF_PI,c1,i-HALF_PI,i-HALF_PI,c1,i-HALF_PI);
  }
  //}
}



