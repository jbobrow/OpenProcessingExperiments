



void setup() {
  size(600,600);
  background(255);
}




void draw() {
  //background(#FF62F5);


  if (key == 'd') {
  
    beginShape();
  
  vertex(mouseX+random(300), mouseY+random(300));
  vertex(mouseX+random(100), mouseY+random(120));
vertex (mouseX+random(130), mouseY+random(120));
vertex (mouseX+random(135), mouseY+random(250));
vertex (mouseX+random(35), mouseY+random(85));
endShape(CLOSE);
stroke(mouseX,mouseY,random(255));

textSize(20);
  fill(250);
text("mundos invisibles pero no inexistentes", 300, 300);
  
  textAlign(CENTER, BOTTOM);
}
  
  if (key == 'b'){
  
  fill(random(255),30,30);
  rectMode(CENTER);
  noStroke();
  filter (BLUR);
  rect(mouseX,mouseY,40,40);
  rect(width-mouseX,height-mouseY,20,20);
  rect(height-mouseX,width-mouseY,10,10); 
  
  textSize(30);
  fill(255);
  text("una sombra que cambia", 300, 260);
  text("desde la mirada del otro", 300, 300);
  textAlign(CENTER, TOP);
}
  
  
  if (key == 'a') {
    //fill(random (052),50,50);
    fill(mouseX,mouseY,random(255));
    filter (BLUR);
    noStroke();
    ellipse (mouseX, mouseY,80,80);
    ellipse(width-mouseX,height-mouseY,20,20);
  ellipse(height-mouseX,width-mouseY,15,15);
textSize(30);
  fill(255);
  text("LA VIDA ES SOLO UN SUEÑO", 300, 300);
  textAlign(CENTER, TOP);
    
}



if (key == 'c'){
    background(255);
  }


}





