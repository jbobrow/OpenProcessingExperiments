
// GLOBAL VARIABLE


int myrotation;
void setup() {
  
  size(600,600);
  myrotation = 0;
}

void draw() {
  
background(150);


  myrotation+=2;
  
  float rad = radians(myrotation);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(rad);
  rect(-50,-50,100,100);
popMatrix();

  pushMatrix();
  translate(200,200);
  rotate(rad);
  rect(-50,-50,100,100);
 popMatrix();
  
  
  pushMatrix();
  translate(400,400);
  rotate(rad);
  rect(-50,-50,100,100);
 popMatrix();
 
 
  pushMatrix();
  translate(500,500);
  rotate(rad);
  rect(-50,-50,100,100);
 popMatrix();
  
  
  pushMatrix();
  translate(100,100);
  rotate(rad);
  rect(-50,-50,100,100);
 popMatrix();
 
 
 if(mousePressed== true){
 myrotation+=2;
 
} else {
  
 myrotation=0 ;
}


//COLOR
  float d = dist(width/2, height/2, mouseX, mouseY);
  float maxDist = dist(0, 0, width/2, height/2);
  float gray = map(d, 0, maxDist, 0, 255);
  fill(gray);
  





}


