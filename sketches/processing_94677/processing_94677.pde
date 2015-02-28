
void setup(){
  size(800,800);
  f =createFont("Helvetica", 14, true);
  //background (155);
  //noLoop();
  
}
void draw(){
  background(0);
  textAlign(CENTER);
  textFont(f, 14);
  fill(255);
   
  text("use mouse ", 400, 200);
  noFill();

  strokeWeight(2);
  smooth();
  fill(255);
  for (int i = 0; i<mouseX;i += 20) {
      stroke(255);

    line(i,0,i,mouseY);
  }
  
  for (int u = 0; u<mouseY; u += 20) {
      stroke(255);

     line(0,u,mouseX,u); 
  }
  
    
  
}

