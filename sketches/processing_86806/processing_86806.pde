
int x=50;
int x1=0;
int x2=600;
int x3=600;
int x4=0;
int d=100;
int d1=100;
int d2=100;
float d4 =200;
int y;
color c1= color(random(255), random(255), random(255));
color c2= color(random(255), random(255), random(255));
color c3= color(random(255), random(255), random(255));
color c4= color(random(255), random(255), random(255));

//dynamic making things MOVE!!!
void setup() {
  size(600, 200);
  noStroke();

  float randomFloat = random(10);
  println ("randomFloat =" +randomFloat);

  int randomInt = int (random(22));
  println ("randomInt =" +randomInt);

  int randomDie = int (random(6));
  println ("randomDie =" +randomDie);
}

void draw() {
  background(0);

  fill(c1);
  ellipse(x1, height*1/5, d, d);
  x1++;
  x1= constrain(x1, 0, 550);

  //fill(c2);
  //ellipse(x2, height*2/5, d, d);
  //x2-=2;

  fill(c3);
  ellipse(x3, height*3/5, d1, d1);
  x3--;
  d1++;
  d1=constrain(d1, 0, 250);
  x3=constrain(x3, 300, 500);


  fill(c4);
  d4 -= .3;
  ellipse(x4, height*4/5, d4, d4);
  x4+=2;
  d4=constrain(d4, 30, 500);
  x4 = constrain(x4, 0, 75);
  
   fill(c2);
  ellipse(x2, height*2/5, d, d);
  x2-=2;
}
