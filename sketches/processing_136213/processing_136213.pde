

// TODO: put all your variable declarations here
 
int x;
int y;
int h;
int w;
color chrome;
color chrome2;
 
void setup() {
 
  // size() goes inside setup() here. Like this:
  size(800, 800);
   background(50,50,50); 
}
 
void draw() {
     
  // TODO: assign each variable a random value here. For example:
  //    x = int(random(0,100));
  x = round( random(5,500) );
  y = round( random(30,600) );
  h = round( random(100,500) );
  w = round( random(40,600) );
  chrome = color(x*4,255/x+y,y/2,10);
  chrome2 = color(x*2,255/y,255, 15);
  // Do this for each variable.
  // see http://processing.org/reference/random_.html for more details
 
  // TODO: paste all your draw code here (ie, the code that uses those variables) 
fill(chrome);
noStroke();
rect(x,y,h,w);
ellipse(x+330,y+30,w,w);
beginShape();
vertex(x+310, y*2);
vertex(x+600, y+340);
vertex(x+310, y+340);
vertex(x+400, y*5);
endShape();

fill(chrome2);
translate(width/4, height/4);
rotate(PI/x*y/2);
rect(x, y, x*0.8, y*3);
 
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


