

// different effect at different time

// Weiyuh Li


int diam = 10;  
float centX, centY;
void setup() {    
  size(800, 500); 
  frameRate(12);  // 12 frames per second                                    
  smooth(); 
  background(10, 150, 200);  
  centX = width/2; 
  centY = height/2; 
  stroke(0); 
  strokeWeight(3); 
  fill(255, 50);
} 

void draw() {    


  if (diam <= 400) { 

    ellipse(centX, centY, diam, diam);  

    diam += 10;  // increases diameter for next loop


    stroke(200, 0, 0, 150);

    strokeWeight(1);     

    noFill(); 

    int tempdiam = diam-10; 


    // loop within loop


    while (tempdiam > 10) {                               


      ellipse(centX, centY, tempdiam, tempdiam); 

      tempdiam -= second()+5;//different per second
    }
  }
}
void mouseClicked() {
  float tcentX, tcentY;
  tcentX = mouseX; 
  tcentY = mouseY; 

  stroke((120-2*second()), 4*second(), 0);
  int tdiam=10;

  for (tdiam=10;tdiam<=150;tdiam += second()/2+5) { 

    ellipse(tcentX, tcentY, tdiam, tdiam);
  }
}


