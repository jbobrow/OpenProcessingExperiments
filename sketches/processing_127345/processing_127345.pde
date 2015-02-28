
/*to create interaction or animation, we need to separate
 the code into 2 blocks - code that runs only once,
 in the beginning (setup) and code that runs constantly (draw)
 setup and draw are functions. to create functions,
 we need to specify what the function returns
 (usually it returns nothing, so it is "void")
 and we need to specify if the function has parameters
 (parameters go between "()"). Then we list all the
 instructions within the function between "{}"
 */
void setup() {
  size(500, 500);
  background(255);
  //frame Rate is the times per second that draw runs (default is 60)
  frameRate(30);
  smooth();
}

void draw() {
  println(frameRate);
  //random calculates random numbers between a min and a max value
  // If no min is specified, 0 will be used: randon(min,max)
  stroke(random(255),0,255);
  strokeWeight(0.1);
  line(250, 250, random(500), random(500));
}



