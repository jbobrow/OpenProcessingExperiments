
/*  @author Jackson Westeen
    http://jacksonwesteen.com
    
    Psychedelic Simulator [Neon Tree Edition]
    Runs in Java & Processing.js, no porting necessary ;)
    
    Controls:
      UP - Add Tree
      DOWN - Remove Tree
      RETURN - Clear & Toggle Alpha Blending
 */

int numTrees, maxTrees, trunkSize, reach, fade; 
float leftDecay, rightDecay;

void keyPressed() {
  switch(keyCode) {
     case UP: {
       numTrees = (++numTrees <= maxTrees ? numTrees : maxTrees);
       break; 
     }
     case DOWN: {
       numTrees = (--numTrees > 0 ? numTrees : 1);
       break; 
     }
     case ENTER:  // x-platform, x-language
     case RETURN: {
       background(0);
       fade = (fade > 0 ? 0 : 25);
       break;
     }
  } 
}

void setup() {
 size(600,600);
 background(0);
 colorMode(HSB,360,100,100);
 smooth();
 
 // compile-time: default # of trees to plant.
 // run-time: current # of living trees.
 numTrees = 5;
 
 // global max # of trees.
 maxTrees = 9;
 
 // base tree height.
 trunkSize = this.height/4;
 
 // branching factor: upper (technically, lower) bound on the number of recursive drawTree calls.
 // (lower value -> greater complexity) 
 reach = 10;
 
 // blending factor: duration of motion blur, in % fade-out per frame.
 // (higher value -> shorter duration)
 fade = 15; 
 
 // recursive branch decay: skew the tree's appearance by adjusting these parameters.
 // (higher value -> increased displacement, fewer branches)
 leftDecay = 1.25;
 rightDecay = 2.5;
}

void draw() {
  // simple motion blur
  noStroke();
  fill(0, fade);
  rect(0, 0, width, height);
  strokeWeight(2);
  
  // throw some statistics up top
  String stats = numTrees + (numTrees > 1 ? " trees" : " tree") + " // " 
      + floor(100 * (frameCount % 360) / 360.0) + "% cycle // "
      + floor(frameRate) + " fps // "
      + frameCount + " // frames";
   
  if (this.frame != null) { // Java
    this.frame.setTitle(stats);
  } else {  // JavaScript
    //document.title = stats;
  }
  
  // evenly distribute trees, planted near the bottom of screen,
  // with height proportionate trunkSize size, in an upright orientation.
  drawTree(width/numTrees, height, trunkSize, 90);
}

// l-system fractal implementation
void drawTree(float x0, float y0, float len, float angle) {
  if (len > reach) {
    float x1 = x0 + len*cos(radians(angle));
    float y1 = y0 - len*sin(radians(angle));
    
    // clone trees by copying & translating the first,
    // saves THOUSANDS of recursive calls.
    for (int i=0; i<numTrees; i++) {
      stroke(i*(360/numTrees), 100, 100);
      line(x0+(i*(width/numTrees))-(width/(2*numTrees)), y0, x1+(i*(width/numTrees))-(width/(2*numTrees)), y1); 
    }
    
    // left branch
    drawTree(x1, y1, len/leftDecay, angle-(frameCount % 360));
    
    // right branch
    drawTree(x1, y1, len/rightDecay, angle+(frameCount % 360));
  }
}


