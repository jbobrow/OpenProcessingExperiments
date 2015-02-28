
float x, y, t, f, a, o;
int q = 0;
boolean sup = false;    //tomato sup
int when = 2800;

void setup() {
  size(900, 400);
  background(255);
  f = 100;
  //a = height/4;
  a = 170;
  o = height/2;

  //println("Use UP/DOWN to affect amplitude. RIGHT/LEFT to affect frequency.");
  println("AMP: " + a + "\t\tFREQ: " + f + " q = " + q);
}


void draw() {
  if (x > width) {
    x = 0;
    f+=200;
    //background(255);
  }
  wave();
  q++;
  
  if(q>=when){
   sup = true;
  }
  
  println("AMP: " + a + "\tFREQ: " + f + "\tq = " +q
  +"\tsup =" +sup);
}

void wave() {
  fill(100);
  noStroke();
  if (sup) {
    //background(255);
    a=0;
  }

 
    x++;
    t+=f/100;
    y = sin(t)*a + o;
    ellipse(x, y, 2, 2);
  
}

void keyPressed() {
  switch(keyCode) {
  case UP:
    a+=10;
    break;
  case DOWN:
    a-=10;
    break;
  case RIGHT:
    f+=100;
    break;
  case LEFT:
    f-=100;
    break;
  case ENTER:
    a = 0;
    break;
  case BACKSPACE:
  background(255);
    a=0;
    break;

  }

  f = constrain(f, 0, 100000);
  a = constrain(a, 0, height/2);

  //println("AMP: " + a + "\t\tFREQ: " + f + " q = " + q);
}



