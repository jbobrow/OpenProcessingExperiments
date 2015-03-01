
void setup(){
    // Set the size of the window
    size (500,500);
    background(255);
    smooth();
    println("Hello World");
   
}

void draw() {
  
  
  
  // Set CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  // Set stoke
  stroke(0);
  strokeWeight(1);
  
  // Draw Snowy's Body  
  fill(255);
  ellipse(250,75,124,124);
  ellipse(250,200,174,174);
  ellipse(250,375,249,249);
  ellipse(mouseX,mouseY,30,30);
 
  // Draw Snowy's Eyes
  fill(20);
  rect(225,45,15,15);
  rect(275,45,15,15);
 
  // Draw Snowy's Nose
  triangle(250,55,235,70,265,70);

  // Draw Snowy's Mouth
  rect(220,85,15,15);
  rect(240,95,15,15);
  rect(260,95,15,15);
  rect(280,85,15,15);
  
  // Draw Snowy's Buttons
  rect(250,145,15,15);
  rect(250,185,15,15);
  rect(250,225,15,15);
 
  // Draw Snowy's Arms
  stroke(#5D3607);
  fill(#5D3607);
  rectMode(CORNER);
  rect(58,185,107,3);
  rect(335,185,107,3);

  // Draw Snowy's right hand
  strokeWeight(3);
  line(59,185,49,175);
  line(59,185,46,185);
  line(59,185,49,195);
  
  // Draw Snowy's left hand
  line(440,185,450,175);
  line(440,185,453,185);
  line(440,185,450,195);

}


