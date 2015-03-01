
int logo=0;

void setup() {
  size (600, 600);
  background(255);
  } 
void draw() {
  logo++;
  if (logo<width/3) {

    noStroke();
    fill(0, 210, 30);
    ellipse(150, logo, 70, 70);
 
    fill(230);
    ellipse(300, logo, 40, 40);

    fill(18, 162, 161);
    ellipse(450, logo, 70, 70);
    
    fill(0);
    ellipse(logo, width/3, 70, 70);
  
    fill(90);
    ellipse(logo, width/3*2, 70, 70);
    

  }
  if (logo<width/3*2) {

    fill(6, 103, 5);
    ellipse(150, logo, 70, 70);
    
    fill(95);
    ellipse(300, logo, 40, 40);
    
    fill(13, 95, 95);
    ellipse(450, logo, 70, 70);     
    
    fill(100);
    ellipse(logo, width/3, 70, 70);
  
    fill(200);
    ellipse(logo, width/3*2, 70, 70);
} 
else {
  
  fill(11, 209, 8);
  ellipse(150, logo, 70, 70);

  fill (170);
  ellipse (300, logo, 40, 40);

  fill (15, 200, 250);
  ellipse (450, logo, 70, 70);
  
  fill(170);
  ellipse(logo, width/3, 70, 70);
  
  fill(70);
  ellipse(logo, width/3*2, 70, 70);
    
}
  
}
