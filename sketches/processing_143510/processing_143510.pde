
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: CHAE Seorin
 // ID: 201420120

float a=600;
float angle;

float xW = 50; 
float direction = 1; 

void setup(){
size (600, 600);
smooth();
 }

void draw(){
   noStroke();
  fill(90, 56, 200);
  rectMode(LEFT); // draws the rect from the center
  rect(0, 0, width, height);
  
  float a= random(width);
  
  stroke(a);
  strokeWeight(70);
  noFill();
  ellipseMode(CENTER); // draws the rect from the center
  ellipse(width/2, height/2, a, a);


noStroke(); 
  fill(#325A7D, 100); // adds more transparency 
  rect(0,0,width,height);  
  // grid filled with ellipses 
  for (int i = 75; i < width-30; i = i + 60) { 
    for (int j = 75; j < height-30; j = j + 60) { 
      stroke(0); 
      strokeWeight(xW/30); 
      noFill(); 
      rectMode(CENTER);
      rect(i,j,xW,xW); 


     } 


  }  


   
  xW = xW + direction; 
  if (xW > 100){ 
      direction = direction * -1; 


  } 


  if (xW < 1){ 
      direction = direction * -1; 


  }  
  
} 




