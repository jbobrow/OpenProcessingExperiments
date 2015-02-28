
PImage w;

int position = 1;
float[] a;

void setup() {
  size(400, 400);

  fill(0, 0, 0,10);
    w = loadImage("w.jpg");


  noStroke();


  a = new float[10];
  int i = 0;
  while ( i <= 9 ) {
    a[i] = 200;
    i = i + 1;
  }
}

void keyPressed() {
  fill(0,0,0,40);
  ellipse(mouseX,mouseY,100,100);
}

void mousePressed() {
      image(w,20,0);


}

void draw() {
  background(255);
  int i = 0;
  while ( i <= 9 ) {

    ellipse(i*50, a[i], 50, 50);
    ellipse(a[i], mouseX, 50, 50);
        ellipse(mouseX, a[i], 50, 50);




   
    if ( mouseX > i*50 && mouseY< i*50+10 ) {
      a[i] = a[i] + random(-5, 5);
    }
    i = i + 1;
  }
}


