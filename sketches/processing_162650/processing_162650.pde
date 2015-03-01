
int r;                 //I was having trouble with for loops
int g;                 //I ended up having coding more, oops
int b;                 //So I sat down and did this extra credit thing
int butX = 0;          //"google and yahoo suck. there i said it" - bing
int butY = 0;          //"credit thing" is hard to find a rhyme for
int butX2 = 75;        //so is the end of that last line, bologna
int butY2 = 25;


void setup() {
  size(300, 300);
  background(0);
}


void draw() {
  r = (int) random(200);
  g =(int) random(200);
  b = (int)random(200);

  stroke(r, g, b);

  for (int i = 0; i < 300; i = i+5) {
    line(0, i, 300, i);
 
  }
}

