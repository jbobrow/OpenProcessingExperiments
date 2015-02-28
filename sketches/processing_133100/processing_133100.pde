
float object1w;
float object1h;
float object2w;
float object2h;
float object3w;
float object3h;
float stroke1;
float stroke2;
float stroke3;
float object1x;
float object1y;
float object2x;
float object2y;
float object3x;
float object3y;
// TODO: put all your variable declarations here

void setup() {

  // size() goes inside setup() here. Like this:
  size(600,800);      
}

void draw() {
    
object1w = random(50,600);
object1h = random(50,600);
object2w = random(50,600);
object2h = random(50,600);
object3w = random(50,600);
object3h = random(50,600);
stroke1 = random(1,10);
stroke2 = random(1,30);
stroke3 = random(1,50);

  // TODO: assign each variable a random value here. For example:
  //    x = int(random(0,100));
  // Do this for each variable.
  // see http://processing.org/reference/random_.html for more details
strokeWeight(stroke1); 
fill(227,158,158,20);
rect(100,100,object1w,object1h,20);

strokeWeight(stroke2+stroke1);
fill(216,184,211,20);
rect(100+object1w,100,object2w,object2h,20);


strokeWeight(stroke3+stroke1+stroke2);
fill(158,227,226,20);
rect(100+object1w+object2w,100,object3w,object3h,20); 
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
}


