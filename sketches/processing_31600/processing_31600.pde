


int transparency = int (80);

color neonColor = color (0, 250, 126);

int maxDistance = int(300);

float diameter;

void setup() {
  
  size(600,600,P3D);
  frameRate (10);
  
}

void draw() {
  
  background(255);
  smooth();
  
  fill(neonColor,80);
  
  int neon = int(random(5));
  if (neon == 0) { neonColor = color (0,250,126); //green
   } else if (neon == 1) { neonColor = color (2,0,223); //purple
   } else if (neon == 2) { neonColor = color (225,238,136); //yellow
   } else if (neon == 3) { neonColor = color (250,66,94); //red
   } else if (neon == 4) { neonColor = color (157,188,252); //blue
   }
  stroke (255); 
  
   strokeWeight(0);
  
  for (int gridY = 0; gridY < 600; gridY = gridY + 25){
    
    for (int gridX = 0; gridX < 600; gridX = gridX + 25){
      
    
      
      PVector mousePos = new PVector (mouseX,mouseY);
      
      PVector shapePos = new PVector (gridX, gridY );  
      
      diameter = shapePos.dist(mousePos); 
      
      diameter = diameter/maxDistance;
      diameter = diameter*20;
          
      pushMatrix();
      
      translate(gridX,gridY,diameter/5);
      
      rotate(PI/4);

      
      rect (0,0,diameter,diameter);
      
      popMatrix ();
      
      
    }
  
  }

}

