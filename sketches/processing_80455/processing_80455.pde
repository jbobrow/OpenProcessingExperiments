
void setup(){
  size(2000, 900); //width, height
  background(220, 230, 230);
  frameRate(2.3);
  
}

void draw(){
  

  
  strokeWeight(1.85);
  
  
  stroke(random(40), random(40), random(40), 103);
  line(-200, 450, mouseX, mouseY);
  
  
   stroke(220, 230, 230);
  line(0, 450, mouseX, mouseY);
  
  
  stroke(random(40), random(40), random(40), 103);
  line(200, 450, mouseX, mouseY);
  
  
  
   stroke(220, 230, 230);
  line(400, 450, mouseX, mouseY);
   
   
    stroke(random(40), random(40), random(40), 103);   
  line(600, 450, mouseX, mouseY);
  
  
   stroke(220, 230, 230);
  line(800, 450, mouseX, mouseY); 
  
  
  stroke(random(39), random(39), random(39), 103);
  line(1000, 450, mouseX, mouseY);
  
  
   stroke(220, 230, 230);
  line(1200, 450, mouseX, mouseY);
  
  
   stroke(random(40), random(40), random(40), 103);
  line(1400, 450, mouseX, mouseY);
  
  
  stroke(220, 230, 230);
  line(1600, 450, mouseX, mouseY);
  
  
  stroke(random(40), random(40), random(40), 103);
  line(1800, 450, mouseX, mouseY);
  
  
  stroke(220, 230, 230);
  line(2000, 450, mouseX, mouseY);
  
  
  stroke(random(40), random(40), random(40), 103);
  line(2200, 450, mouseX,mouseY); 

}

void mousePressed(){
  saveFrame("img###.jpg");
  
}
