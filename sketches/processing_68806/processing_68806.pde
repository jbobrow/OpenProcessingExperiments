
int counter;
int d;
int rate;
int a;

void setup () {

  size(500, 500);
  background (0);
  smooth();
  noStroke();
  counter=0;
  d=3;
  rate=2;
}

void draw() {
  fill(155);
  rect(0, 0, width, height);

 
  
   for (a=0; a <= counter; a++){
      fill(255,255,0,5);
      ellipse ( 250, 250, d+(counter-a)*rate, d+(counter-a)*rate);
}

 noStroke();
    counter++ ;
  }
   


