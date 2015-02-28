
/*Snow Webs - by Robbie Lillquist,

Based upon:

'Cherry Blossom' by Mark Brand, licensed under Creative Commons Attribution-Share Alike 3.0 license.
Work: http://openprocessing.org/visuals/?visualID=2235
License: http://creativecommons.org/licenses/by-sa/3.0/

Instructions:
Click around to make patterns, and press any key to reset.
*/

class Tree { 
  float x, y; 
  float h; 
  float steps; 

  Tree() { 
    x = 0; 
    y = 0; 
    h = 0; 
    steps = 0; 
  } 

  Tree(int x_, int y_, int h_, int s_) { 
    x = x_; 
    y = y_; 
    h = map(h_, 0, height, 0, 160); 
    steps = s_; 
  } 

  void render() { 
    stroke(32); 
    branch(x, y, -HALF_PI, h); 
  } 

  void branch(float x_, float y_, float a_, float s_) { 
    strokeWeight(s_/random(6,30)); 
    float a = random(-PI, PI)+a_; 
    float nx = cos(a)*s_+x_; 
    float ny = sin(a)*s_+y_; 
    stroke(random(100,200),random(100,200),255,60); 
    line(x_, y_, nx, ny); 
    if (s_>10) { 
      branch(nx, ny, a_-random(PI*2), s_*random(0.2, 0.6)); 
      branch(nx, ny, a_, s_*random(0.6, 0.8)); 
      branch(nx, ny, a_+random(PI/4), s_*random(0.2, 1.0)); 
    } 
    else { 
      float w = random(220, 255); 
      stroke(255, w, w, random(32, 50)); 
      strokeWeight(random(0, 8)); 

    } 
  } 
} 

Tree tree = new Tree(); 

void setup() { 
  size(800, 600); 
  colorMode(RGB, 255); 
  background(0,0,0);
  smooth(); 
} 

void draw() { 
} 

void keyReleased() { 
  background(0); 
} 

void mouseReleased() { 
  tree = new Tree(mouseX, mouseY, height, 15); 
  tree.render(); 
  tree.render();
  tree.render();
  tree.render();
  tree.render();
  tree.render();
  tree.render();
  tree.render();
  tree.render();
  tree.render();
  tree.render();
  tree.render();
  tree.render();
  tree.render();
  tree.render();    
} 






