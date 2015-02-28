

//Name: Marina
//Date: 07/01/14
//Project: Traffic Light


void setup() {  //setup function called initially, only once
  size(250, 250);
 
}

void draw() {  //draw function loops 
 fill(50,50,50);           // color dark gray
 rect(75,10,100,240);      // box for traffic light
 
 fill(255,0,0);            // color red
 ellipse(125,50,50,50);    // first light
 
 fill(255,255,0);          // color yellow
 ellipse(125,125,50,50);   // second light
 
 fill(0,255,0);            // color green
 ellipse (125,200,50,50);  // third light
 
}
