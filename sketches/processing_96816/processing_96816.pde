



PVector v1, v2;
int figura=0;
int col;

void setup () {
 //frameRate(15);
  size(500, 500);
  background(0);
  v1 = new PVector(50, 50);
  v2 = new PVector(40, 40); 
// colorMode(HSB);
 stroke(random(255), random(0), random(155), 100);
 smooth();
// rectMode(CENTER);
  

}

void draw() { 
 
 //  imagen=loadImage("LILI.JPG");

   

 background(255);

  for (int i=0; i<=width; i+=20) {
    for (int j=0; j<=height; j+=20) {
      fill(255);
    pushMatrix();
      translate(i, j);

       textSize(10);

  float a = atan2(mouseY-height/2, mouseX-width/2); 
   
 
   text("HOLA", v1.x, v1.y);

  textSize(5);

  
 fill(random(255), random(0), random(155), 100);
   rotate(a);
    
     rect(i,j,v2.x, v2.y);
     
      fill(0);
     
  popMatrix();

   
    
  } 
    
    
  }
   
}






