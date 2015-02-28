
float xpos=0;
float ypos=0;

float circleRadius = 0;

float opacity = 75; 

void setup(){
  size(400,400);
  background(183, 222, 245);
  smooth();
 
 for(int k = 50; k < 300; k = k+50){
    
    circleRadius = k;
    
    fill(241, 245, 183, opacity);
    noStroke();
    ellipse(200, 200, circleRadius, circleRadius);
  } 
  
   
  
  
}



void draw(){
  
  opacity = random(75,255);

  for( int j = 0; j < 400; j = j+60){
      
      ypos = j;
      
    for(int i = 0; i < 400; i = i+60){
      xpos = i;  
      noStroke();
      fill(222,183,245, opacity);
      triangle(xpos+20, ypos+25, xpos+20, ypos+62, xpos+48, ypos+62);
      
      noStroke();
      fill(244, 183, 245, opacity);
      triangle(xpos+20, ypos+25, xpos+62, ypos+40, xpos+48, ypos+62);
      
      noStroke();
      fill(201, 183, 245, opacity);
      triangle(xpos+20, ypos+62, xpos+48, ypos+62, xpos+57, ypos+94);
      
      noStroke();
      fill(183, 184, 245, opacity);
      triangle(xpos+48, ypos+62, xpos+62, ypos+40, xpos+57, ypos+94);
    }
  }
 
}

