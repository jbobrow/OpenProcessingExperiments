
//Noriega Medellín Rodrigo Eduardo

float CerrandoPacMan = 0;

void setup()  

{
  size(800, 800);
  noFill();
  smooth();
  background(0);
  frameRate(30);  
}

void draw()  

{
  
  background(0);
  
//PacMan

  stroke(255, 255, 0);
  strokeWeight(0);
  fill(255, 255, 0);
  arc(mouseX, mouseY, 300, 300, 0.79 - CerrandoPacMan, 5.50 + CerrandoPacMan);

//CerrandoPacMan

  if(0.79 - CerrandoPacMan <= 0)
  
  CerrandoPacMan = 0;
  CerrandoPacMan = CerrandoPacMan + 0.04;
  
//Ojito PacMan

  fill(0, 0, 0);
  ellipse(mouseX - 45, mouseY - 45, 40, 40);

//Sombrerito PacMan

  fill(67, 10, 103);
  stroke(67, 10, 103);
  strokeWeight(5);
  
  ellipse(mouseX, mouseY - 160, 300, 50);
  rect(mouseX - 80, mouseY - 300, 160, 150);

//Moñito PacMan
  
  triangle(mouseX-100, mouseY+100, mouseX-100, mouseY+200, mouseX, mouseY+150);
  triangle(mouseX, mouseY+150, mouseX+100, mouseY+100, mouseX+100, mouseY+200);


}



