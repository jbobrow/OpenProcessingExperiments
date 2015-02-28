
float i = 0;
float x = 50;
float y = 50;

void setup() {
  size(800, 800);
    background(250, 200, 180);
}

void draw() {
 //facial guides
 smooth();
 strokeWeight(3);
 point(200,500);
 point(250, 300);
 point(400, 220);
 point(560, 220);
 
 point(370, 340);
 
 
 //SKIN SHADES
 noStroke();
  
   //SKIN SHADES
 fill(230, 150, 150);
 triangle(0,0, 0, 400, 700, 0);
 fill(210, 120, 120);
 triangle(0,0, 0, 200, 500, 0);
 fill(100, 205, 140);
 triangle(0, 200, 100, 220, 200, 200);
 
 pushMatrix();
 translate(400, 350);
 fill(230, 120, 120); //skin shading
 rect(0, 0, 100, 100);
 popMatrix();
 
 
 //EYES
 fill(255);
 quad(560, 220, 550, 324, 200, 500, 280, 276);
 beginShape();
 vertex(200, 500);
 vertex(250, 500);
 vertex(346, 458);
 vertex(500, 325);
 endShape();
 triangle(400, 430, 505, 360, 550, 280);
 fill(200);
 triangle(200, 500, 250, 300, 300, 280);
 triangle(400, 220, 360, 250, 560, 220);
 triangle(360, 250, 560, 220, 560, 240);
 
 stroke(0);
 strokeWeight(2);
 fill(mouseX, mouseY, 100);
 ellipse(370, 340, 200, 200);
 fill(240);
  noStroke();
  ellipse(270, 350, 70, 50);
  point(370, 340);
  
  stroke(0);
  fill(50);
  if(mouseX+ 0 + mouseY+ 0 <=300){
    ellipse(370, 340, mouseX+ 0, mouseY+ 0);
    
  }
  if(mouseX + mouseY > 300){
  ellipse(370, 340, 150, 150);
  }//If it goes beyond 150, 150, an ellipse will remain on screen
  
  strokeWeight(5);
  curve(240, 500, 200, 500, 250, 300, 245, 400);
 line(200, 500, 250, 300);
 curve(275, 330, 250, 300, 400, 220, 355, 307);
  curve(275, 330, 250, 300, 400, 220, 340, 302);
 line(250, 300, 400, 220);
 line(400, 220, 560, 220);
 line(560, 220, 560, 260);
 
 noFill();
 line(240, 500, 360, 450);
 line(360, 450, 450, 400);
 curve(380, 400, 360, 450, 450, 400, 400, 360);
 line(450, 400, 550, 320);
 
 //brows
 fill(60, 20, 20);
triangle(200, 300, 400, 150, 220, 250);

  //Hair
  fill(150, 62, 0);
  noStroke();
  curve(0,200, 200, -100, 400, 200, 0, 0);
  
  curve(0,-200, 0, 20, 200, 200, 200, 150);
  fill(150, 120, 0);
  curve(0,-200, 0, 50, 200, 200, 200, 150);
  fill(140, 60, 0);
  curve(-200, 100, 50, 0, 200, 200, 200, 150);
  
  fill( 120, 56, 12);
  curve(-200, -300, 0, -300, 250, 200, 120, 200);
  
  fill(150, 100, 0);
  triangle(400, 0, 800, 300, 800, 0);
  
  //hair
  fill(180, 110, 5);
  curve(-300, -200, 600, -200, 800, 500, 800, 1000);
  
  
  beginShape();
  fill(190, 120, 120);
  vertex(200, 700);
  vertex(400, 550);
  vertex(600, 450);
  endShape();
  
  beginShape();
  fill(120, 230, 200);
  vertex(600, 200);
  vertex(630, 260);
  vertex(635, 220);
  vertex(650, 215);
  vertex(650, 234);
  vertex( 700, 250);
  endShape();
  
   fill(200, 0, 0);
ellipse(300, 650, 200, 100);
  
  fill(120, 0, 0);
  ellipse(250, 700, 40, 40);
  
 
 
}

