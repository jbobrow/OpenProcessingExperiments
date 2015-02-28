
void chara(int a, int b) {
  pushMatrix() ;

  translate(mouseX-50, mouseY-50)  ;


  fill(255, 250, mouseY);
  ellipse(50, 50, 55, 20); 

  //kuchi
  line(60, 40, 50, 60);
  line(40, 40, 50, 60);
  line(40, 40, 28, 55);
  line(60, 40, 73, 55);

  //me
  fill(255, 255, 255);
  ellipse(40, 35, 15, 15); 
  ellipse(60, 35, 15, 15);
  fill(200, 50, 0);
  ellipse(40, 35, 5, 5); 
  ellipse(60, 35, 5, 5);

  popMatrix();
} 


