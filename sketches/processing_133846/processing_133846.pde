
// TODO: put all your variable declarations here

void setup() {
  size(600,600);   
}

void draw() {
  // TODO: assign each variable a random value here. For example:
  //    x = int(random(0,100));
  // Do this for each variable.
  // see http://processing.org/reference/random_.html for more details
 float w = (random(50,100));
 float h = (random(50,100));
 float c1 =(random(0,255));
 float c2 =(random(0,255));
 float c3 =(random(0,255));
 float c4 =(random(0,255));
  
 fill(mouseX,mouseY,mouseX+mouseY,7);
 rect (0,0,600,600);
 
 noStroke();
 fill(c1,c2,c3,c4); 
 ellipse (mouseX, mouseY, w, h); 
  
 noFill();
 stroke(0);
 ellipse(pmouseX, pmouseY, mouseX, mouseY); 
 ellipse(pmouseX, pmouseY, mouseX, mouseY); 
 
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



