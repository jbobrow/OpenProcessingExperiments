
//Code-Objects: For loops: Ellipse shape2
//VIIRJ.COM, 2013

void setup() {
  size(600, 600);
  noFill();
  smooth();
}

void draw() {

  stroke(255);
  strokeWeight(1);
  background(0);
 

  float v;
  float y;
  // v = mouseX+80;
  //y = mouseY-200; //how much of the ellipses the mouse will effect

  for (float i=0; i<=width;i=i+5) {
    for (float j=height/2; j<=height/2;j=i+500) {
      float strokeVal=map(mouseX,0,255,0,255);
    //  stroke(2,245,239,strokeVal); //changes color of lines
      ellipseMode(CENTER);
      ellipse(i, j, mouseX, mouseY);//changes the size and location of ellipses
   ellipse(j, i, mouseY, mouseX );  
  }
  }
}

/*for (float i=55; i<=500; i=i+20) {//changes the spacing between the ellipses
 for (int j=55; j<=500; j=j+20) {//changes the spacing between the ellipses
 // float r = random(-20, 20);
 ellipse(50,50,i+2, mouseY);*/




