
//Sun Kyung Park
//sunkyunp
//Homework7
//Copyright Sun Kyung Park 2012

float x, y, wd, ht, xSpeed, ySpeed;
float a, b, dia, aSpeed, bSpeed;
int n;
int t, s;

void setup () {
  noStroke ();
  smooth ();
  size (400, 400);

  wd = 50;
  ht=50;
  ySpeed = 2;
  xSpeed = 5;
  n = 0;
  a = 0;
  b = 5;
  dia = 50;
  aSpeed = 2;
  bSpeed = 2;
}


void draw () {
  background (255, 255, 255);
  bouncingTarget ();
  circle (x, y, wd, ht);

  updateTimer ();
  showText ();
  moveellipse ();

}


void circle (float x, float y, float wd, float ht) {
  fill (118, 216, 202);  
  ellipse (x, y, wd, ht);
}

void bouncingTarget () { 

  background (255, 255, 255);
  y = ySpeed+y;
  x = xSpeed+x;

  if (x > width) {
    xSpeed =- xSpeed;
    x=xSpeed+x;
  } 
  else if (x < 0) {
    xSpeed =- xSpeed;
    x=xSpeed+x;
  } 
  if (y > height) {
    ySpeed =- ySpeed;
    y=ySpeed+y;
  }
}

void moveellipse () {
  a=aSpeed+a;
  if (a > width) {
    a=0;
  } 
  else if (a > 0) {
    a=width;
  }

  b=bSpeed+b; 
  {
    if (b > height) {
      b=0;
    } 
    else if (b < 0) {
      b=height;
    }
  }


    fill (22, 34, 134);
    ellipse (a, b, dia, dia);


    if (mouseX > pmouseX) {
      aSpeed = aSpeed - 0.5;
    } 
    else if (mouseX < pmouseX) {
      aSpeed = aSpeed - 0.5;
    } 
    if (mouseY > pmouseY ) {
      bSpeed = bSpeed + 0.5;
    } 
    else if (mouseY < pmouseY) {
      bSpeed = bSpeed - 0.5;
    }


    //point count and collision check
      //copyright Michelle Guarino

    if ((a >= (x-20) && a <= (x+20)) && (b >= (y-20) && b <= (y+20) )){
      background ( 252, 214, 255);
      n=n+1;
      println (n);

      x= random (width);
      y= random (height);

      xSpeed = random (1, 10);
      ySpeed = random (1, 20);
    }

    //restart
    if (n==100) {
      n=0;
    }
  }

  void updateTimer () {
    if (s != second () ) {
      s = second ();
      t++;
    }
  }

  void showText () {

    fill (167, 167, 167);

    textSize (80);
    text (n, 20, height-200);

    textSize (15);
    text ("time:", 30, 30);
    text (t, 50, 50);
    text ("total points:", 30, 100);
  }






