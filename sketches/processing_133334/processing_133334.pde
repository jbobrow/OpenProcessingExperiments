
float x, y, t, f, a, o;
int q = 0;
boolean turn, stop = false;    
int where;

void setup() {
  //smooth();
  size(200, 400);
  background(255);
  where = 6* width/8-4;

  f = 100;
  a = 0;
  o = height/2;

  //println("Use UP/DOWN to affect amplitude. RIGHT/LEFT to affect frequency.");
  println("AMP: " + a + "\t\tFREQ: " + f + " q = " + q);
  //frameRate(30);
}


void draw() {
  if (x > width) {
    x = 0;
    q++;
    background(255);
  }
  wave();

  if ((q>=4 && x == width/8) || (q>=4)) {    // check when
    noFill();
    stroke(200);
    ellipse(where, height/2, 9, 9);
    //turn = true;
  }
  if (q==4) {
    turn = true;    //why this line doesn't work without else?
  }
  else {
    turn =false;
  }


  println("AMP: " + a + "\tFREQ: " + f + "   q = " +q
    +"\tturn =" +turn +  "   stop = " + stop);
}

void wave() {
  fill(100);
  noStroke();

 
  if ((q>= 5)&& (x>= where - 10)) {
    x = x; 
    stop = true;  
  } else if (stop == false){
    a=0;
    f = 100;
    x++;
  }
  
  if ((turn)&& (x>= where - 10)&&(x<= where + 10)) {
    //background(255);
    a=10;
    f=300;
  }
    t+=f/100;
    y = sin(t)*a + o;
    ellipse(x, y, 1, 1);
  
  
    
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
    t=0;
    break;
  }

  f = constrain(f, 0, 100000);
  a = constrain(a, 0, height/2);

  //println("AMP: " + a + "\t\tFREQ: " + f + " q = " + q);
}



