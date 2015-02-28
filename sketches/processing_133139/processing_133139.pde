
// TODO: put all your variable declarations here

int a = 56;
int b = 46;
int c = 55;
int d = 55;

void setup() {

  // size() goes inside setup() here. Like this:
  size(260,260);      
}

void draw() {
    
  // TODO: assign each variable a random value here. For example:
  //    x = int(random(0,100));
  a = int(random(0,100));
  b = int(random(0, 100));
  c = int(random(0, 100));
  d = int(random(0, 100));
  // Do this for each variable.
  // see http://processing.org/reference/random_.html for more details

  // TODO: paste all your draw code here (ie, the code that uses those variables)  
ellipse(a, b, c, d);
fill(204, 102, 0, 10);
ellipse(a+30, b*2, c+12, d-12);
ellipse(a+2, b+40, c*2, d+8);
ellipse(a-15, b-10, c+20, d*3);
fill(100, 230, 0, 10);
ellipse(a, b, c, d);
ellipse(a, b, c, d);
ellipse(a, b, c, d);
fill(204, 102, 0, 10);
ellipse(a+b, b*2, c-5, d+15);

  // TODO: If you are using background(), remove it for now.

  // TODO: Add transparency to all your colors. For example, if you have:
  //   fill(255,0,0);
  // in your code, replace it with:
  //   fill(255,0,0,10);

  // TODO: run your sketch and see what happens!
  
  // The idea here is that if you do the above, you should hopefully
  // get something that looks like the Idris Khan image compositions.
  // Do you?
}


