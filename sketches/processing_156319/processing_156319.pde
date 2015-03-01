
//FANCY CIRCLES by bryan ma
//bootcamp 2014 

float xpos = 300; 
float ypos = 300; 

void setup() { 
  size(600, 600);
  background(255);
  colorMode(HSB);   
  noCursor();
}

void draw() {
  background(255);
  //  fill(255,10); 
  //  noStroke(); 
  //  rect(0,0,width,height); 

  stroke(0);

  //  ellipse(xpos-50, ypos, 10, 10);
  //  ellipse(xpos-30, ypos, 10, 10);
  //  ellipse(xpos-10, ypos, 10, 10);
  //  ellipse(xpos+10, ypos, 10, 10);
  //  ellipse(xpos+30, ypos, 10, 10);
  //  ellipse(xpos+50, ypos, 10, 10);
  //  
  //  for ( int i = 0; i < 200; i += 25 ) {
  //    ellipse(xpos+i, ypos, 10, 10);
  //  }

  noSmooth(); 

  float pulse = sin(frameCount * 0.1) * 100; 

  noStroke();
  fill(100);
  for ( int i = 0; i < width; i += 30) {
    for ( int j = 0; j < height; j += 30) {

      float distance = dist(i, j, mouseX, mouseY);
      float hue = map(distance, 0, 300, 0, 255);
      float s = map(distance, 0, 300, 1, 50);
      //      float w = map(mouseX, 0, width, 1, 20);
      //      float h = map(mouseY, 0, height, 1, 20); 
      //     
      fill(hue + pulse, 255, 255); 
      ellipse(i, j, s, s);
    }
  }

  /*
  beginShape();
   vertex(xpos-10, ypos-10); 
   vertex(xpos-20, ypos);
   vertex(xpos, ypos+20); 
   vertex(xpos+20, ypos);
   vertex(xpos+10, ypos-20);
   endShape(CLOSE);
   */


  if (keyPressed == true) {
    if (key == 'w') {
      ypos -= 10; 
      //do something
    } 
    else if (key == 'a') {
      xpos -= 10;
      //do something else
    } 
    else if (key == 's') {
      ypos += 10; 
      //something else
    } 
    else if (key == 'd') {
      //something else 
      xpos += 10;
    } 
    else { 
      xpos = 300;
      ypos = 300;
    }
  }
}

//void mouseDragged() {
//  background(0); 
//  
//} 
//
//void keyReleased() { 
//   background(255);  
//}



