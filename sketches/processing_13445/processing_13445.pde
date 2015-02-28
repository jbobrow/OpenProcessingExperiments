
void setup(){
  size(640,480);
  smooth();
}

void draw(){
  background(173,215,216);
  stroke(255);
  strokeWeight(.5);
  
  fill(170,232,213);
  ellipse(298,207,310,310);
  
  //background circles
  noFill();
  ellipse(298,207,400,400);
  ellipse(298,207,385,385);
  ellipse(298,207,380,380);
  ellipse(298,207,375,375);
  
  //main triangle shape
  fill(117,175,158);
  triangle(146,231,351,94,445,180);
  
  fill(133,216,192);
  triangle(146,231,445,180,294,325);
  
  fill(129,216,189);  
  triangle(385,287,445,180,294,325);
  
  fill(170,232,212);  
  triangle(186,342,191,260,314,249);

  fill(170,240,212);  
  triangle(186,342,314,249,294,325);
  //top
  fill(120,175,160);  
  triangle(342,158,200,86,209,191);
  
  fill(111,175,155);  
  triangle(342,158,320,118,200,86);
  
  fill(87,152,133);  
  triangle(146,231,209,191,200,86);
  
  fill(107,196,167);
  triangle(385,287,405,320,294,325);
  
  fill(255);
  ellipse(146,231,15,15);
  ellipse(200,86,10,10);
  ellipse(445,180,20,20);
  ellipse(351,94,5,5);
  ellipse(405,320,30,30);
  
println("x: " + mouseX + "y:" + mouseY);
}

