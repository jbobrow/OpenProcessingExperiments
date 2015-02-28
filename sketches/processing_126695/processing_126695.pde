
// A small program to explain 
// the difference between random() & noise()
// For the Processing Workshop at @nid_b
// Created by @rasagy | http://rasagy.in

// Use the mouse (X) to control the graphs generated.
// Random: changes max value / Noise: changes noise scale.
// Mouse press toggles between random() & noise()
// Press any key to save the frame as image.

boolean useRandom=true;
float mouseScale;

void setup() {
  size(400, 700);
  background(255);
  frameRate(4);
  println("Use the mouse (X) to control the graphs generated.\nRandom: changes max value / Noise: changes noise scale. \nMouse press toggles between random() & noise().\nPress any key to save the frame as image.");
}

void draw() {
  makeGraph();
}

void makeGraph() {
  float con=random(20);
  float val;  
  background(255);  
  strokeWeight(5);
  stroke(0);  
  mouseScale=(float)(mouseX-10)/width;
  mouseScale=(mouseX<10)? 10/width : (float)(mouseX-10)/width;

  for (int i=1; i<50; i++) {
    if (useRandom)
      val=random(mouseScale);
    else
      val=noise(con+(float)mouseScale*i/10);
    line(10, i*(height/50)+5, val*(width-20)+10, i*(height/50)+5);
  }
}

void mousePressed() {
  useRandom=(useRandom)? false:true;
//  println("Switched to "+((useRandom)?"Random":"Noise")+" graph." );
}

void keyPressed() {  
  if (key==' ' && useRandom) {
    saveFrame("Random ("+mouseScale+") ####.png");
//    println("Saved Random graph");
  }  
  else if(key==' ') {    
    saveFrame("Noise ("+mouseScale+") ####.png");
//    println("Saved Noise ("+mouseScale+")");
  }
}
