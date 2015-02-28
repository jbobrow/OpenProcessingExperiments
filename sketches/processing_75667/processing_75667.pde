
void setup(){
  size(500,500);
}
  
void draw(){
  background(255);
   
  background(14, 200, 200);
  smooth();
   
  fill(200, 100, 20);
  noStroke();
  ellipse(250, 250, 400, 400);
   
  rect(50, 250, 400, 300); //cuerpo
   
  fill(202, 70, 35);
  rect(335, 250, 100, 500);
  ellipse(385, 250, 100, 220); //sombra oscura
 
  strokeWeight(20);
  stroke(50, 50, 50);
  strokeCap(ROUND);
  line(55, 200, 445, 200); //ropa
  

  line(60, 197, 440, 197);
 
  noStroke();
  fill(50);
  ellipse(180, 200, 120+Y, 120+Y);
  ellipse(320, 200, 120+Y, 120+Y); //ojos
   
  fill(255);
  ellipse(180, 200, 90+Y, 90+Y);
  ellipse(320, 200, 90+Y, 90+Y); //ojos
 
  fill(0);
  arc(250, 330, 150-Y, 70-Y, 0, PI); //voca
  
  fill(10,70, 147);
  rect(50, 440, 400, 300); //parte central ropa
 
  fill(21, 45, 95);
  rect(400, 440, 50, 80); //parte derecha ropa oscura
   
  fill(70, 138, 250);
  rect(50, 440, 50, 80); //ropa con reflejo luz
   
   //bolas negras
  fill(0);
  noStroke();
  ellipse(100, 470, 30, 30);
  ellipse(400, 470, 30, 30);
  ellipse(250, 483, 30, 30);
  
  //pelo
  stroke(0);
  line(240-Y, 20, 250, 50);
  line(260+Y, 20, 250, 50);
  line(250, 10, 250, 50);
  
  //pupilas  
  ellipse(180, 200, 40, 40);
  ellipse(320, 200, 40, 40);
  
  noStroke();
  fill (250);
  ellipse(180, 200, 40, 40);
  ellipse(320, 200, 40, 40);
  
  noStroke();
  fill (0);
  ellipse(180, 200, 20, 20);
  ellipse(320, 200, 20, 20);


   
}


