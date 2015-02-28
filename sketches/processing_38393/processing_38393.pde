
// Allison Etheredge
// Project 01 
// September 20, 2011


void setup() { 
  size(500, 500); 
  smooth(); 
  background(0);
} 

void draw() {
}


void mousePressed() { // start the sketch

  background(0); // draw the background 

  // Sets variables for the color grid 
  for (int x=0; x<width; x+=50) { 
    for (int y=0; y<height; y+=50) { 

      // This series of code draws the colors in the grid set to random transparency
      // The only aspect of the code that changes is the color and location along the y axis

      // Top Red color
      if (random(100)>20) { 
        if (y < height/2-150) { 
          noStroke(); 
          fill(255, 0, 0, random(100)); 
          rect(x, y, 50, 50);
        }
      }

      // Top Grey color 
      if (random(100)>20) { 
        if (y < height/2-50 && y > height/2-200) { 
          noStroke(); 
          fill(200, random(100)); 
          rect(x, y, 50, 50);
        }
      }

      // Middle Red color 
      if (random(100)>20) { 
        if (y < height/2+50 && y > height/2-100) { 
          noStroke(); 
          fill(255, 0, 0, random(100)); 
          rect(x, y, 50, 50);
        }
      }

      // Bottom Grey color
      if (random(100)>20) { 
        if (y < height/2+150 && y > height/2) { 
          noStroke(); 
          fill(200, random(100)); 
          rect(x, y, 50, 50);
        }
      }

      // Bottom Red color 
      if (random(100)>20) { 
        if (y < height && y > height-150) { 
          noStroke(); 
          fill(255, 0, 0, random(100)); 
          rect(x, y, 50, 50);
        }
      }

      // This series draws the grid dividing the color blocks 
      // giving order to the composition

      for (int i=0; i<width; i+=50) { 
        for (int j=0; j<height; j+=100) { 

          // grey underlying grid
          stroke(50); 
          strokeWeight(0.5);
          line (i, 0, i, height);
          line (0, j+50, width, j+50);

          // white underlying grid
          stroke(255, 80); 
          strokeWeight(1); 
          line (0, j, width, j);
          line (j, 0, j, height);
        }
      }
    }
  }
}


