
//code by Saarah Saghir 2014
void setup(){
  size(250,250);
  smooth();
}

void draw(){
//sky
  fill(#BCE1E6);
  noStroke();
    rect(0,0,252,252);
    
  if (mousePressed) { //night sky
    fill(#4C2D76);
    rect(0,0,252,252);
  }
        
//grass
  fill(#C7D296);
  noStroke();
  rect(0,136,250,250);
    
  if (mousePressed) { //dark grass
    fill(#657127);
    rect(0,136,250,250);
  }
      
//clouds
  fill(#FFFFFF);
  if (mousePressed) {
    ellipse(23+mouseY*.36, 21+mouseX*.1, 77, 77);
    fill(#4C2D76);
    ellipse(30+mouseY*.36, 15+mouseX*.1, 77, 77);
    fill(#ffffff);
    ellipse(100+mouseY*.4, 21+mouseX*.1, 5, 5);
    ellipse(30+mouseY*.2, 10+mouseX*.2, 5, 5);
    ellipse(150+mouseY*.3, 21+mouseX*.3, 10, 10);
    ellipse(80+mouseY*.1, 30+mouseX*.4, 10, 10);
  } else {
    ellipse(23+mouseY*.36, 21+mouseX*.1, 77, 77);
    ellipse(80+mouseY*.38, 12+mouseX*.08, 55, 55);
    ellipse(113+mouseY*.4, 27+mouseX*.05, 36, 36);
  }
    
  //tail
  fill(#E6E7E8);
  noStroke();
    beginShape();
      vertex(126, 142);
      vertex(132, 137);
      vertex(241, 175);
      vertex(180, 164);
      vertex(180, 164);
      vertex(183, 167);
      vertex(152, 156);
      vertex(154, 160);
    endShape(CLOSE);
        
//body
  ellipse(102, 131, 60, 60);
    
//wing dark
  fill(#BCBEC0);
  noStroke();
  ellipse(105, 133, 44, 44);
        
//wing light
  fill(#E6E7E8);
  noStroke();
  ellipse(109, 118, 30, 30);

//beak
  fill(#FABDB3);
  noStroke();
    translate(.1*mouseX, .09*mouseY);
    triangle(62,84,58,99,47,88);

//mouth
  fill(#D27C6F);
  line(47,88,58,104);

//head
  fill(#F1F2F2);
  ellipse(78, 95, 40, 40);

//eye
  fill(#803F39);
  ellipse(71, 100, 10, 10);
  if (mousePressed) {
    fill(#F1F2F2);
    ellipse(72,98,10,10);
  }

}


