
// M_4_1_01.pde
// Node.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/**
 * some moving nodes
 *
 * KEYS
 * r             : re-initialize velocity vectors of the nodes
 * s             : save png
 */

PFont font;
//string (dataset="word")
String word = "Appear & Vanish";
//definining a variable s
 int s;
int nodeCount = 20;

// myNodes array 
Node[] myNodes = new Node[nodeCount];


// image output
boolean saveOneFrame = false;



void setup() {
  size(600,350); 
  colorMode(RGB, 255, 255, 255, 100);
  smooth();
  background(255); 
  noStroke();
  fill(0);
  //creating the font arial on float
  font = createFont("arial",50);
  
  // setup myNodes
  for (int i = 0; i < nodeCount; i++) {
    myNodes[i] = new Node(random(width), random(height));
    myNodes[i].velocity.x = random(-3, 3);
    myNodes[i].velocity.y = random(-3, 3);
    myNodes[i].damping = 0.01;
  }
}

void draw() {
    s = s + 1;
   // (rotate line variable s)
rotate(radians(s-1));
//line -x -y -x -y for all height
line(-height, -height, height, height);
 
  fill(255, 5);
  rect(0, 0, width, height);


  for (int i = 0; i < myNodes.length; i++) {
    myNodes[i].update();

    // draw node
    fill(0, 100);
    ellipse(myNodes[i].x, myNodes[i].y, 10, 10);
  }


  // image output
  if(saveOneFrame == true) {
    saveFrame("_M_4_1_01_"+timestamp()+".png");
    saveOneFrame = false;
  }
}



void keyPressed(){
  if(key=='r' || key=='R') {
    for (int i = 0; i < nodeCount; i++) {
      myNodes[i].velocity.x = random(-5, 5);
      myNodes[i].velocity.y = random(-5, 5);
    }
  }

  if(key=='s' || key=='S') {
    saveOneFrame = true; 
  }
}


String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}



 
  //when mouse is pressed
void mousePressed(){
  //text font @ size that appear
  textFont(font,50);
  //fill on click (random colors)
  fill( random(255), random(255), random(255), random(255));
  //smoothing
  smooth();
  //the string value popup word "appear"
  text(word,random(350),random(350));
   
}




// M_4_1_01.pde
// Node.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

class Node extends PVector {

  // velocity
  PVector velocity = new PVector();

  // minimum and maximum posiions
  float minX=5, minY=5, maxX=width-5, maxY=height-5;

  // damping of the velocity (0 = no damping, 1 = full damping)
  float damping = 0.1;


  Node(float theX, float theY) {
    x = theX;
    y = theY;
  }

  // ------ calculate new position of the node ------
  void update() {
    x += velocity.x;
    y += velocity.y;

    if (x < minX) {
      x = minX - (x - minX);
      velocity.x = -velocity.x;
    }
    if (x > maxX) {
      x = maxX - (x - maxX);
      velocity.x = -velocity.x;
    }

    if (y < minY) {
      y = minY - (y - minY);
      velocity.y = -velocity.y;
    }
    if (y > maxY) {
      y = maxY - (y - maxY);
      velocity.y = -velocity.y;
    }

    velocity.x *= (1-damping);
    velocity.y *= (1-damping);
  }
}





