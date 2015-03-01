
int columns = 12;      
int rows = 22;         
int diameter=30;        
float rotation=.23;     
float rotationvalue=0;  
float randomvalue;    
 
void setup() { 
  size(5+(columns*diameter),5+(rows*diameter)); 
  background(255);   
  fill(255,0,0,155);
  noStroke();               
  rectMode(CENTER); 
  noLoop();          
}
 
void draw() {
  for (int y=1; y < rows; y=y+1){
    rotationvalue = rotationvalue + (y*rotation);
    for (int x=1; x < columns; x=x+1) {
      pushMatrix();
      randomvalue = random(-rotationvalue,rotationvalue);
      translate((x * diameter)+(randomvalue*.23),
         (y * diameter)+(randomvalue*.23));
      rotate(radians(randomvalue));
      rect(0,0,diameter,diameter);
      popMatrix();
      println(randomvalue);
}
}
}


