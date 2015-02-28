
//Júlia Fort Muñoz
//P2_b)Dibuix que es mou amb el ratolí

//mouseX i mouseY (500,500)--> el centre del quadrat
void setup(){
  size (1000, 1000);
}

void draw(){
  
  //fons
  background(94,240,231);
  
  //cos principal
  noStroke();
  fill(255,247,8);
  ellipse(mouseX, mouseY+250, 600, 800);
  
  //orelles
  noStroke();
  fill(255,247,8);
  ellipse(mouseX-47, mouseY-220, 100, 200);
  ellipse(mouseX-47+94, mouseY-220, 100, 200);
  rect(mouseX-50, mouseY-200, 100,100);
  
  //eliminacio de mig cos
  fill(94,240,231);
  rect(mouseX-500, mouseY+250, 1000, 400);
  fill(255,247,8);
  
  //cames
  stroke(0);
  strokeWeight(5);
  line(mouseX-100, mouseY+260, mouseX-100, mouseY+600);
  line(mouseX+100, mouseY+260, mouseX+100, mouseY+600);
  
  //dits
  line(mouseX-100, mouseY+550, mouseX-80, mouseY+600);
  line(mouseX+100, mouseY+550, mouseX+120, mouseY+600);
  line(mouseX-100, mouseY+550, mouseX-120, mouseY+600);
  line(mouseX+100, mouseY+550, mouseX+80, mouseY+600);
  
  //la meitat del cos
  noStroke();
  ellipse(mouseX, mouseY+260, 600,430);
  
  //les circumferencies mes grans dels ulls
  stroke(0);
  strokeWeight(10);
  fill(197,197,197);
  stroke(20);
  ellipse(mouseX+167, mouseY, 200, 200);
  ellipse(mouseX-167, mouseY, 200, 200);
   
  //les ellipses de dins els ulls NEGRES
  ellipse(mouseX-167, mouseY+20, 15, 80);
  ellipse(mouseX+167, mouseY+20, 15, 80);
  
  //les ellipses de dins els ulls BLANQUES
  fill(255);
  noStroke();
  ellipse(mouseX-167, mouseY+20, 20, 80);
  ellipse(mouseX+167, mouseY+20, 20, 80);
  
  //la rodona del nas BLANCA
  stroke(0);
  strokeWeight(4);
  fill(255);
  ellipse(mouseX-1, mouseY+250, 200, 300);
  
  //per fer el pic amb 2 rodones GROGUES
  noStroke();
  fill(255, 247, 8);
  ellipse(mouseX-90, mouseY+250, 200, 200);
  ellipse(mouseX+90, mouseY+250, 200, 200);
  
  // per eliminar la meitat del nas
  rect(mouseX-80, mouseY+220, 200, 200);
  
  //les lineeas de dins el nas
  stroke(0);
  line(mouseX, mouseY+201, mouseX, mouseY+100);
  triangle(mouseX-10, mouseY+180, mouseX-10, mouseY+120, mouseX-10-10, mouseY+120 );
  triangle(mouseX+10, mouseY+180, mouseX+10, mouseY+120, mouseX-10+30, mouseY+120 );
  noCursor();
}


