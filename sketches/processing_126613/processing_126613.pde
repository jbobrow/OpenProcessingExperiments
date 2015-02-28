
color c;

void setup(){
  c = color(0);
  size(600,550);
  background(255);
  fill(255);//bianco
  rect(0,0,50,height/5);
  
  fill(255,80,206);//rosa
  rect(0,height/5,50,height/5);
  
  fill(219,153,219);//lilla
  rect(0,height/5*2,50,height/5);
  
  fill(131,17,118);//prugna
  rect(0,height/5*3,50,height/5);
  
  fill(0);//nero
  rect(0,height/5*4,50,height/5);
  
  strokeWeight(3);
}

void draw() {
  
  if(mousePressed && mouseX < 50 && mouseY < height/5){
      c = color(255);//pulsante bianco
      strokeWeight(10);
  }
  else if(mousePressed && mouseX < 50 && mouseY < height/5*2){
      c = color(255,80,206); //pulsante rosa
        strokeWeight(3);
  }
  else if(mousePressed && mouseX < 50 && mouseY < height/5*3){
      c = color(219,153,219); //pulsante lilla
        strokeWeight(3);
      
  }
  else if(mousePressed && mouseX < 50 && mouseY < height/5*4){
      c = color(131,17,118); //pulsante prugna
        strokeWeight(3);
  }    
  
  else if(mousePressed && mouseX < 50 && mouseY < height/5*5){
      c = color(0); //pulsante nero
        strokeWeight(3);
  }     
  else if(mousePressed && mouseX > 50 && pmouseX > 50){
      stroke(c);
      line(mouseX,mouseY,pmouseX,pmouseY);    
  }
  
}


