
int lineLength = 1000;


int[] x = new int[lineLength];
int[] y = new int[lineLength];


color []c= new color[lineLength];
int []s= new color[lineLength];
//same number as dots


int counter = 0;


void setup() {
  size(600, 600);
  background (0, 30, 222);
  smooth();
}

int currentstroke =3;
void draw() {

  //stroke(50, 50, 150);
  noStroke();
  fill(150, 150, 255);

  if (keyPressed) {
    background(random(0, 255), random(0, 255), random(0, 255));
    if (key == 'z') {
      currentstroke = currentstroke +2;
    }
  }

  int i=0;

  while ( i < x.length ) {
    fill(c[i]);
    //strokeWeight(s[i]);
    //ellipse(x[i], y[i], 10, 10);
    ellipse(x[i], y[i], s, s);
    i=i +1;
  }

  if (mousePressed) {
    if (counter>=x.length) {
      x=expand(x);
      y=expand(y);
      c=expand (c);
      s=expand(s);
    }

    x[counter]=mouseX;
    y[counter] = mouseY;
    c[counter] = mouseY; 
    s[counter] = currentstroke;
    //add something here....

    /*if (key == 'z') {
      c[counter] = color (0, 0, 255);
    }*/


    counter = counter+1;
  }
}



