
int howManyCircles = 10;
int circleCount = 0;

int[] circlesX = new int[howManyCircles];
int[] circlesY = new int[howManyCircles]; 
int[] distances = new int[howManyCircles];
int[] diameters = new int[howManyCircles];
color[] palette = new color[howManyCircles];
int [] xSpeed = new int [howManyCircles];
int [] ySpeed = new int [howManyCircles];

/////////////////

void setup(){
  
  background (0);
  
  size (400, 400);
  
  smooth();
  
  for (int i = 0; i < howManyCircles; i = i+1) {
    circlesX[i] = int(random (width));
    circlesY[i] = int(random (height));
    diameters[i] = int(random(20, 100));
    palette[i] = color(random(255), random(255), random(255));
    xSpeed [i] = 0;
    ySpeed [i] = 0;
  }

}

/////////

void draw(){
  
background (0);

for (int i = 0; i < howManyCircles; i = i+1) {

    circlesX [i] += xSpeed [i];
    circlesY [i] += ySpeed [i];
    
        if (circlesX[i] + diameters[i]/2 > width) {
      
      circlesX[i] = width - diameters[i]/2;
      xSpeed[i] = -xSpeed[i];      
    }
    
        if (circlesX[i] - diameters[i]/2 < 0) {
      
      circlesX[i] = 0 + diameters[i]/2;    
      xSpeed[i] = -xSpeed[i];      
    }
    
        if (circlesY[i] + diameters[i]/2 > height) {
      
      circlesY[i] = height - diameters[i]/2;  
      ySpeed[i] = -ySpeed[i];        
    }
    
        if (circlesY[i] - diameters[i]/2 < 0) {
      
      circlesY[i] = 0 + diameters[i]/2;
      ySpeed[i] = -ySpeed[i];      
    }
    
}
  
  if (mousePressed == false) {
    
    for (int i = 0; i < howManyCircles; i = i+1) {
    
    distances[i] = int (dist(circlesX[i], circlesY[i], mouseX, mouseY));  
    fill (palette[i]);   
    ellipse (circlesX[i], circlesY[i], diameters[i], diameters[i]);
        
      if (distances[i] <= diameters[i]/2){
        
        for (int j = 0; j < i; j = j+1) {
        
          fill (palette[j]);
          ellipse (circlesX[j], circlesY[j], diameters[j], diameters[j]);       
        }
          
      fill (palette[i]); 
      ellipse (circlesX[i], circlesY[i], diameters[i], diameters[i]);        
      fill (255, 255, 255, 100); 
      ellipse (circlesX[i], circlesY[i], diameters[i], diameters[i]);
        
        for (int j = i+1; j < howManyCircles; j = j+1) {
        
          fill (palette[j]);
          ellipse (circlesX[j], circlesY[j], diameters[j], diameters[j]);
        
        }        
      }    
    }
    
  } else {
    
    for (int i = 0; i < howManyCircles; i = i+1) {
    
    fill (palette[i]);
    ellipse (circlesX[i], circlesY[i], diameters[i], diameters[i]);
        
      if (distances[i] <= diameters[i]/2){
        
        for (int j = 0; j < i; j = j+1) {
        
          fill (palette[j]);
          ellipse (circlesX[j], circlesY[j], diameters[j], diameters[j]);       
        }
          
      fill (palette[i]); 
      ellipse (circlesX[i], circlesY[i], diameters[i], diameters[i]);        
      fill (0, 0, 0, 150); 
      ellipse (circlesX[i], circlesY[i], diameters[i], diameters[i]);
        
        for (int j = i+1; j < howManyCircles; j = j+1) {
        
          fill (palette[j]);
          ellipse (circlesX[j], circlesY[j], diameters[j], diameters[j]);
        
        }        
      }    
    }
  }
  
  println (howManyCircles);
  println (circleCount);
  
}

void mousePressed(){
  
  for (int i = howManyCircles-1; i > -1; i = i-1) {

    if (distances[i] <= diameters[i]/2){
     
     xSpeed [i] = 0;
     ySpeed [i] = 0;
     
     i = -1;
     
 
    } else { circleCount +=1; } }
    
    if (circleCount >= howManyCircles) {
     
     circlesX = append (circlesX, mouseX);
     circlesY = append (circlesY, mouseY);
     diameters = append (diameters, int(random(20, 100)));
     palette = append (palette, color(random(255), random(255), random(255)));
     xSpeed = append (xSpeed, 0);
     ySpeed = append (ySpeed, 0);
     distances = append (distances, 0);
     
     howManyCircles = howManyCircles + 1;
      
    }
    
   circleCount = 0;
}


void mouseDragged() {
   
  for (int i = howManyCircles-1; i > -1; i = i-1) {

    if (distances[i] <= diameters[i]/2){            

     circlesX[i] += mouseX - pmouseX;
     circlesY[i] += mouseY - pmouseY; 
     
     xSpeed [i] = 0;
     ySpeed [i] = 0;
     
     i = -1;
     
     
 
    }
  }
}

void mouseReleased() {
  
  for (int i = howManyCircles - 1; i > -1; i = i-1) {

    if (distances[i] <= diameters[i]/2){
  
     xSpeed [i] = mouseX - pmouseX;
     ySpeed [i] = mouseY - pmouseY;
     
     i = -1;
     
    }
    
  }
  
}
  
  

