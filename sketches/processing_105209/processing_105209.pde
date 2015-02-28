
int highlight = 0;
int q = 300;

void setup () {
  size(600, 600);
  background(0);
}

void draw () {
  


  //checkers
  
  fill(255);
  rect(0, 0, width/2, width/2);
  rect(width/2, width/2, width/2, width/2);
  fill(0);
  rect(0,width/2, width/2, width/2);
  rect(width/2, 0, width/2, width/2);
  
  //inner
  
  fill(100);
  
      if (mouseX <= q && mouseY <= q) {
fill(200);
}

  rect(width/4, width/4, width/4, width/4);
  
  fill(100);
  
      if (mouseX >= q && mouseY >= q) {
fill(200);
}

  rect(width/2, width/2, width/4, width/4);
  
  fill(100);
  
        if (mouseX >= q && mouseY >= q) {
fill(200);
}

  fill(100);
  
  if (mouseX >= q && mouseY <= q) {
fill(200);
}

  rect(300, 150, width/4, width/4);

  fill(100);
  
  if (mouseX <= q && mouseY >= q) {
fill(200);
}

  rect(150, 300, width/4, width/4);
}
