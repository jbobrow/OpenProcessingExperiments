


//Grundlegende Funktionen, ein Mal aufgerufen
void setup(){
  size(800,500);
  smooth();
  noCursor();
  background(200);
}


//Interaktion, wiederholt aufgerufen (60 fps)
void draw(){
  
if(mousePressed){
  
  //Mut
  fill(50);
  noStroke();
  rectMode(CENTER);
  rect(mouseX, mouseY, random(10,100),random(50,250));
  
}
 else{
  
   
  //angst
  fill(255);
  stroke(255,255,255,100);
  frameRate(15);
  line(mouseX, mouseY, mouseX, height);
  
  ellipse(mouseX, mouseY, 3,3);
}
}
