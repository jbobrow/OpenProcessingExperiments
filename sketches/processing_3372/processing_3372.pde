
 
void setup(){ 
  size(500,500); 
  background(235);
  noFill(); 
      
} 
 
void draw(){ 
     
  float tam = random(0, 30); 
      fill(10, random(0, 250), random(180, 250), 30);
      noStroke();
    ellipse(random(width), random(height), tam, tam);
}

void mousePressed(){

    background(235);

}

