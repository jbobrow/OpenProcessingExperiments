
// Lecture 3.3.1
// Allison Etheredge
// 7 September 2011

// This simple code is testing the toggle between turning 
// a button on and off by simply waiving your mouse
// clicking your mouse reveals a scene 

void setup() {
  size(300, 300);
  background(0);
}


void draw() { 

  if (mousePressed) {

    // background
    background(80, 149, 232); 
    strokeWeight(1); 
    fill(69, 175, 73); 
    rect(0, height/3, width, height);
    line(0, height/2 + 70, width, height/2 + 70); 

    // yellow ball 
    fill(250, 240, 43); 
    ellipse(mouseX, height/2 + 45, 50, 50); 

    // yellow creature
    ellipse(width/2 + 50, height/2 + 25, 80, 90); 
    fill(255); 
    // eyes and nose
    ellipse(width/2 + 38, height/2 + 8, 30, 40); 
    ellipse(width/2 + 62, height/2 + 8, 30, 40); 
    strokeWeight(3); 
    point(width/2 + 42, height/2); 
    point(width/2 + 62, height/2); 
    strokeWeight(1); 
    fill(147, 144, 89); 
    ellipse(width/2 + 50, height/2 + 27, 20, 4);
  } 


  else { 
    background(0); 

    if (mouseX < width/2) {

      // Button turns OFF
      smooth(); 
      strokeWeight(4); 
      fill(200); 
      ellipse(width/2, height/2, width/3+25, height/3+25); // gray edge
      fill(134, 0, 0); 
      ellipse(width/2, height/2, width/3, height/3); // red button
      strokeWeight(8); 
      noFill(); 
      ellipse(width/2, height/2, width/6, height/6); // black color
      line(width/2, height/2-32, width/2, height/2-10);
    } 

    else { 

      // Button turns ON
      smooth(); 
      strokeWeight(4); 
      fill(211, 205, 205); 
      ellipse(width/2, height/2, width/3+25, height/3+25); // gray edge
      fill(255, 0, 0); 
      ellipse(width/2, height/2, width/3, height/3); // red button
      strokeWeight(8); 
      noFill(); 
      ellipse(width/2, height/2, width/6, height/6); // black color
      line(width/2, height/2-32, width/2, height/2-10);
    }
  }
} 


