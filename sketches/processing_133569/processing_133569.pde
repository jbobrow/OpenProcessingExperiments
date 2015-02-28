
/**
Yingying Yang
Creative Computing Section B
Wk 2 Assignment #5 - Layering
*/

// TODO: put all your variable declarations here

void setup() {

  // size() goes inside setup() here. Like this:
  size(600,600); 
  smooth();  
}

void draw() {
  
  // TODO: assign each variable a random value here. For example:
  //    x = int(random(0,100));
  // Do this for each variable.
  // see http://processing.org/reference/random_.html for more details

  // TODO: paste all your draw code here (ie, the code that uses those variables)  

  // TODO: If you are using background(), remove it for now.

  // TODO: Add transparency to all your colors. For example, if you have:
  //   fill(255,0,0);
  // in your code, replace it with:
  //   fill(255,0,0,10);

  // TODO: run your sketch and see what happens!
  
  // The idea here is that if you do the above, you should hopefully
  // get something that looks like the Idris Khan image compositions.
  // Do you?
   
  int c1 = int(random(0,255));
  int c2 = int(random(0,255));
  int c3 = int(random(0,255));
  int s = int(random(0,1000));
  int t = int(random(0,100));
  
  fill(255,255,255,50);
  noStroke();
  rect(0,0,600,600);
  fill(c1,c2,c3,t);
  ellipse(mouseX,mouseY,s,s);

}


