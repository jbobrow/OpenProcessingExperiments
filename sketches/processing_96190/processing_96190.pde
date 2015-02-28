
float medida=80;
float colors=20;
void setup(){
  size(400,400);
  background(0,255,0);
}
  void draw(){
    
    noCursor();
    medida=mouseX+1-width/2;
    background(0,mouseX,180);
    fill(255);
    strokeWeight(2);
    stroke(49,165,32);
    
    //lineas_centrales
    line(mouseX,mouseY,mouseX+70,mouseY+70);
    line(mouseX,mouseY,mouseX-70,mouseY-70);
    line(mouseX,mouseY,mouseX+70,mouseY-70);
    line(mouseX,mouseY,mouseX-70,mouseY+70);
    line(mouseX,mouseY,mouseX,mouseY-70);
    line(mouseX,mouseY,mouseX,mouseY+70);
    line(mouseX,mouseY,mouseX+70,mouseY);
    line(mouseX,mouseY,mouseX-70,mouseY);
    
    //lineas_centrales2
    line(mouseX,mouseY,mouseX-60,mouseY+130);
    line(mouseX,mouseY,mouseX+60,mouseY+130);
    
    line(mouseX,mouseY,mouseX-60,mouseY-130);
    line(mouseX,mouseY,mouseX+60,mouseY-130);
    
    
    
    
    //elipses_centrales
    stroke(mouseY+70,0,0);
    fill(mouseY,0,0);
    strokeWeight(5);
    ellipse(mouseX+70,mouseY-70,medida,medida);
    ellipse(mouseX-70,mouseY+70,medida,medida);
    ellipse(mouseX+70,mouseY+70,medida,medida);
    ellipse(mouseX-70,mouseY-70,medida,medida);
    ellipse(mouseX,mouseY-70,medida,medida);
    ellipse(mouseX,mouseY+70,medida,medida);
    ellipse(mouseX+70,mouseY,medida,medida);
    ellipse(mouseX-70,mouseY,medida,medida);
    
    //elipses_ojos
    stroke(0);
    fill(255);
    strokeWeight(5);
    ellipse(mouseX+70,mouseY-70,medida+40,medida);
    ellipse(mouseX-70,mouseY+70,medida+40,medida);
    ellipse(mouseX+70,mouseY+70,medida+40,medida);
    ellipse(mouseX-70,mouseY-70,medida+40,medida);
    ellipse(mouseX,mouseY-70,medida+40,medida);
    ellipse(mouseX,mouseY+70,medida+40,medida);
    ellipse(mouseX+70,mouseY,medida+40,medida);
    ellipse(mouseX-70,mouseY,medida+40,medida);
    
    
    
    
    
    //elipses_centrales2
    stroke(0,0,mouseY+70);
    fill(0,0,mouseY);
    strokeWeight(5);
    ellipse(mouseX-60,mouseY+130,medida,medida);
    ellipse(mouseX+60,mouseY+130,medida,medida);
    
    ellipse(mouseX+60,mouseY-130,medida,medida);
    ellipse(mouseX-60,mouseY-130,medida,medida);
    
    //elipses_ojos2
    stroke(0);
    fill(255);
    strokeWeight(5);
    ellipse(mouseX-60,mouseY+130,medida+40,medida);
    ellipse(mouseX+60,mouseY+130,medida+40,medida);
    
    ellipse(mouseX+60,mouseY-130,medida+40,medida);
    ellipse(mouseX-60,mouseY-130,medida+40,medida);
    
    fill(255,167,3);
    ellipse(mouseX,mouseY,70,70);
    
    
    //ojo_central
    fill(250+mouseY,255,0);
    ellipse(mouseX,mouseY,medida/2,medida/2);
    fill(236,255,162);
    ellipse(mouseX,mouseY,medida/4,medida/4);
    
   
    
  }


