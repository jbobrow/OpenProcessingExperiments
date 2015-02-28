
int Mau5Y;
int Mau5X;
int richtingX;
int richtingY;
int count;
boolean test;

//*basic
void setup() {
  size(500, 500);
  Mau5Y = 450;
  Mau5X = 199;
  count = 0;
  test = false;
  richtingX = 3;
  richtingY = 4;
}


void draw() {
  background(255);

  if (test == false) {
    fill(24, 139, 236);
  }

  if (test == true) {
    fill(232, 35, 68);
  }

  text(count, 250, 486);
  textSize(18);


  //* Head
  stroke (255);
  
  ellipseMode(CENTER);
  ellipse (Mau5X, Mau5Y+-1, 101, 101);
  //* Ears
  //Right Ear
  ellipse (Mau5X+65, Mau5Y+-60, 73, 74);
  //Left Ear
  ellipse (Mau5X-65, Mau5Y-60, 73, 74);
  //* Eyes
fill(255);
  ellipseMode (CENTER);
  ellipse (Mau5X-20, Mau5Y+-1, 35, 20);
  ellipse (Mau5X+25, Mau5Y+-1, 35, 20);
  //* Eyemask
  stroke(200,40);
fill(200,40);  
  ellipse (Mau5X+0, Mau5Y+0, 100, 33);
  //* aureool
  stroke (255);
  fill (255, 255, 0, 50);
  ellipse (Mau5X+3, Mau5Y-123, 110, 21);
  //*mouth 
  stroke (255);
  fill (255);
  ellipse (Mau5X+2, Mau5Y+31, 45, 12);
 
  stroke(0);
  fill(0);



  Mau5X = Mau5X + richtingX;
  Mau5Y = Mau5Y + richtingY;

  if (Mau5X > 500 || Mau5X < 0) {
    richtingX = -richtingX;
    count = count+1;
  }

  if (Mau5Y >500 || Mau5Y < 0) {
    richtingY = -richtingY;
    count = count+1;
  }

  if (count == 10) {
    count = 0;
    test = !test;
  }

  println(test);
  println(count);
}

