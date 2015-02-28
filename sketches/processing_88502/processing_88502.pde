
float anchoP = 40; 
float altoP = 40; 

void setup()
{
  size(800,800);
  smooth();
}

void draw()
{
  background(255,238,46);
  fill(0,0,0);
  ellipse(200,400,100,300);
  ellipse(600,400,100,300);
  
   float pX = constrain(mouseX, 180,220);
  float p = pX + 400;
  float pY = constrain(mouseY, 275,535);
  
  anchoP = constrain(anchoP, 40, 100);
  altoP = constrain(altoP, 40, 100);
  fill(255,255,255);
  ellipse(pX, pY, anchoP,altoP);
  ellipse(p, pY, anchoP,altoP);
  
  if (mousePressed) {
   
   
   
   
    beginShape();
    vertex(200,500);
    vertex(200,600);
   endShape(CLOSE);
   beginShape();
    vertex(190,500);
    vertex(190,600);
       endShape(CLOSE);

    beginShape();
    vertex(210,500);
    vertex(210,600);
   endShape(CLOSE);
   beginShape();
    vertex(230,500);
    vertex(230,600);
       endShape(CLOSE);
       
       beginShape();
    vertex(220,500);
    vertex(220,600);
       endShape(CLOSE);
       
        beginShape();
    vertex(180,500);
    vertex(180,600);
       endShape(CLOSE);
       
        beginShape();
    vertex(170,500);
    vertex(170,600);
       endShape(CLOSE);

   fill(255,238,46);
   ellipse(200,400,100,300);
  }
  
}




