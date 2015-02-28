

// part 4 of the HW ...

// TODO: put all your variable declarations here

int stroke1;
int stroke2;
int stroke3;
int x;
int y;
int colour;
int colour1;
int colour2;

void setup() {

  // size() goes inside setup() here. Like this:
  size(600, 600);
  
  frameRate(5);
}

void draw() {

  // TODO: assign each variable a random value here. For example:
  //    x = int(random(0,100));
  // Do this for each variable.
  // see http://processing.org/reference/random_.html for more details
stroke1 = int(random(30, 125));
stroke2 = int(random(30,115));

x= int(random(00,400));
y=int(random(00,300));
colour=int(random(0,255));
colour1=int(random(0,255));
colour2=int(random(0,255));

  // TODO: paste all your draw code here (ie, the code that uses those variables)  
 fill(colour, colour1, colour2, 200);
rect(x, y, 300, stroke1,10, 0, 0, 0);


fill(colour, colour1, colour2, 200);
rect(x, stroke1+y, 100, stroke2,0, 0, 0, 0);

fill(colour, colour1, colour2, 200);
rect(x+200, stroke1+y, 100, stroke2);

fill(colour, colour1, colour2, 200);
rect(x, stroke1+stroke2+y, 300, stroke1,0, 0, 30, 0);

fill(colour, colour1, colour2, 200);
rect(x, stroke1+stroke1+stroke2+y, 100, stroke2,0, 0, 0, 0);

fill(colour, colour1, colour2, 200);
rect(x+200, stroke1+stroke1+stroke2+y, 100, stroke2,0, 70, 0, 0);

fill(colour, colour1, colour2, 200);
rect(x, +stroke1+stroke1+stroke2+stroke2+y, 120, stroke1,0, 0, 12, 18);

fill(colour, colour1, colour2, 200);
rect(x+200, +stroke1+stroke1+stroke2+stroke2+y, 120, stroke1,0, 0, 12, 18);



  
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


