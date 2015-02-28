
void setup(){ 
   size(500,500); 
   noStroke();
   smooth();
  
} 

void draw(){ 
  background(204); // must have it here to keep circle from duplicate 
  fill(0);
  noStroke();
  ellipse(mouseX + 100, mouseY +220, 250, 50);
  stroke(174, 158, 188); 
  strokeWeight(5);  
  arc(mouseX + 60, mouseY + 220, 40, 40, PI, TWO_PI);
  arc(mouseX + 140, mouseY + 220, 40, 40, PI, TWO_PI);
  line(mouseX + 150, mouseY, mouseX + 170, mouseY - 50);
  line(mouseX + 50, mouseY, mouseX + 30, mouseY - 50);
  stroke(174, 158, 188); 
  strokeWeight(10);
  fill(254, 236, 248);
  rect(mouseX + 60, mouseY + 150, 80,60);
  noStroke();
  fill(232, 194, 219);
  rect(mouseX + 65, mouseY + 150, 72, 15);
  stroke(174, 158, 188);
  fill(254, 236, 248);
  strokeWeight(10);
  rect(mouseX, mouseY, 200,150);
  strokeWeight(2);
  noFill();
  rect(mouseX + 13, mouseY + 13, 175,125); 
  strokeWeight(5);
  stroke(0);
  line(mouseX + 30, mouseY + 85, mouseX + 50, mouseY + 100);
  line(mouseX + 150, mouseY + 100, mouseX + 170, mouseY + 85);
  stroke(174, 158, 188); 
  line(mouseX + 60, mouseY +190, mouseX +140, mouseY + 190);
  fill(255);
  ellipse(mouseX + 100, mouseY + 185, 40, 40);
  fill(255, 0,0);
  ellipse(mouseX + 100, mouseY + 185, 20, 20);
  fill(0);
  noStroke();
  ellipse(mouseX + 50, mouseY + 100, 30, 30); 
  ellipse(mouseX + 150, mouseY + 100, 30, 30);
  fill(255);
  ellipse(mouseX + 45, mouseY + 95, 10, 10); 
  ellipse(mouseX + 145, mouseY + 95, 10, 10); 
  ellipse(mouseX + 55, mouseY + 105, 5, 5); 
  ellipse(mouseX + 155, mouseY + 105, 5, 5); 
  fill(255);
  ellipse(mouseX + 150, mouseY + 20, 10, 10);
  rect(mouseX +150, mouseY + 15, 25, 10);
  rect(mouseX +175, mouseY + 15, 10, 25);
  ellipse(mouseX + 180, mouseY + 40, 10, 10);
  stroke(174, 158, 188); 
  fill(0);
  stroke(0);
  strokeWeight(2);
  triangle(mouseX + 120, mouseY +130, mouseX + 80,mouseY + 130,mouseX + 100, mouseY + 110);
  fill(254, 236, 248);
  stroke(174, 158, 188); 
  strokeWeight(8);
  arc(mouseX + 60, mouseY + 220, 40, 40, PI, TWO_PI);
  arc(mouseX + 140, mouseY + 220, 40, 40, PI, TWO_PI);
  noStroke();
  stroke(174, 158, 188);
  strokeWeight(5);
  rect(mouseX + 38, mouseY + 220, 43,5);
  rect(mouseX + 119, mouseY + 220, 43,5);
  stroke(174, 158, 188); 
  strokeWeight(8);
  
  
  if(mousePressed){
      fill(255, 0, 0);
      noStroke();
      ellipse(mouseX + 50, mouseY + 100, 30, 30); 
      ellipse(mouseX + 150, mouseY + 100, 30, 30);
      fill(255);
      ellipse(mouseX + 45, mouseY + 95, 10, 10); 
      ellipse(mouseX + 145, mouseY + 95, 10, 10); 
      ellipse(mouseX + 55, mouseY + 105, 5, 5); 
      ellipse(mouseX + 155, mouseY + 105, 5, 5); 
 
  } else if(key == 'b'){
      fill(100, 149, 237);
      ellipse(mouseX + 100, mouseY + 185, 20, 20);
  } else if(key == 'r'){
      fill(255, 0, 0);
      ellipse(mouseX + 100, mouseY + 185, 20, 20); 

  }
     fill(255, 0,0);
}

