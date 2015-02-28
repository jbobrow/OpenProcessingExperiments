
void setup(){
  size(400, 400);
  noStroke();
   fill(200, random(255), 255);
  }
  
    int i=0;

void draw(){
    background(5, 79, 99);
    
     for (i=0; i<900; i=i+50){
       fill(255, 255, 255, 30);
       noStroke();
    ellipse(i, mouseX-50, 20, 20);
  ellipse(mouseX-50, i, 20+i/10, 20+i/10);}
    
    strokeWeight(10);
    
    stroke(200, random(255), 255, random(100, 200));
    fill(200, 255, 255, random(100, 200));
triangle(mouseX/2, mouseX/2, mouseX/2, mouseY/2, mouseY/2, mouseY/2);

    stroke(200, random(255), 255, random(100, 200));
fill(255, 200, 255, random(100, 200));
triangle(mouseX*2, mouseY*2, mouseX, mouseY, mouseY, mouseY);

noStroke();
fill(255, 255, 200);
ellipse(mouseY+10, mouseX+10, mouseX/2, mouseX/2);

}


