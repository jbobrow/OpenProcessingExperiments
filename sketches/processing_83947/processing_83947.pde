
void setup()
{
  size(500,500);
  background(255);
}

void draw()
{
  noStroke();
  fill(26,189,63);
  rect(30,75,60,60);
  
  noStroke();
  fill(26,189,63);
  rect(30,45,60,60); //vert 
  
  noStroke();
  fill(126,189,63,120);
  translate(40,0);
  rect(30,45,60,60); // vert clair
  
  noStroke();
  fill(255,236,0,120);
  translate(40,0);
  rect(30,45,60,60); // jaune
  
  noStroke();
  fill(255,186,0,120);
  rotate(PI/16);
  translate(40,0);
  rect(30,45,60,60); // orange
  
  noStroke();
  fill(255,86,58,120);
  rotate(PI/16);
  translate(30,0);
  rect(30,45,60,60); // rouge
  
  noStroke();
  fill(255,86,255,120);
  rotate(PI/16);
  translate(30,0);
  rect(30,45,60,60); // rose
  
  noStroke();
  fill(255,200,255,120);
  rotate(PI/16);
  translate(30,0);
  rect(30,45,60,60); // rose clair
  
  noStroke();
  fill(149,113,167,120);
  rotate(PI/16);
  translate(30,0);
  rect(30,45,60,60); // violet
  
  noStroke();
  fill(49,113,167,120);
  rotate(PI/16);
  translate(30,0);
  rect(30,45,65,65); // bleu
  
  noStroke();
  fill(25,71,239,120);
  rotate(PI/16);
  translate(30,0);
  rect(30,45,75,75); // bleu foncé
  
  noStroke();
  fill(25,158,239,120);
  rotate(PI/16);
  translate(30,0);
  rect(30,45,85,85); // bleu clair
  
  noStroke();
  fill(25,255,239,120);
  rotate(PI/16);
  translate(30,0);
  rect(30,45,85,85); // bleu très clair
  
  noStroke();
  fill(25,255,123,120);
  translate(40,0);
  rect(30,45,75,75); // vert clair
  
  noStroke();
  fill(25,199,123,120);
  translate(40,0);
  rect(30,45,65,65); // vert
  
  noStroke();
  fill(25,145,123,120);
  translate(40,0);
  rect(30,45,55,55); // vert foncé
  
  fill(0); 
  ellipse(145,65,60,60);
  
  //noLoop();
}




