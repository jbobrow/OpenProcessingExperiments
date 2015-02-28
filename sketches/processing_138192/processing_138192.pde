
int cambio;

void setup() {
  size(800, 600);
  frameRate(24);
  background(0);
}

void draw() {

  float varColor = random(255); 
  
  if(varColor < 125){
  fill(random (0,255),0,random(0,20), varColor); 
  noStroke();
  float pos = random(800);  
  ellipse(pos, random(300,600), 20,20);  
  } else {
  fill(random(0,40),random(0,255),random(0,20), varColor); 
  noStroke();  
  ellipse(random(800), random(0,300), 20,20);  

    
  }
  
  }  
  
 


