
PImage backg;

void setup(){
  size(600,650);
  smooth();
  background(backg= loadImage("backg.png"));
  
}
  
void draw(){
  buttonShapes();
 
  Levels(); 
  
  Instructions();
  
  buttonHover();
  
  
}

void buttonShapes(){

  
  fill(55);
  strokeWeight(5);
  stroke(255);
  rect(300, 140, 200, 40);
  rect(300, 190, 200, 40);
  rect(300, 240, 200, 40);
  
  noStroke();
  fill(0);
  rect(190,380,380,210);
}
   
void Levels(){
  fill(255);
  textFont(createFont("Verdana-48", 20));
  text("Easy", 380, 168);
  text("Intermediate", 350, 218);
  text("Hard", 380, 268);  
     

}

void Instructions(){

  text("Instructions:", 200, 400);
  
  textFont(createFont("MaiandraGD-Regular-48", 16));
}

void buttonHover(){
  textFont(createFont("MonotypeCorsiva-48", 20));
  
  stroke(0);
  fill(255);
  
 
  //easy button
  if (mouseX > 300 && mouseX < 500 && mouseY > 140 && mouseY < 180) {
    rect(300, 140, 200, 40);
    fill(0);
    text("PLAY!", 375, 168);


}
    
   //intermediate button
    if (mouseX > 300 && mouseX < 500 && mouseY > 190 && mouseY < 230) {
    rect(300, 190, 200, 40);
    fill(0);
    text("PLAY!", 375, 218);
    }
    
    //hard button
    if (mouseX > 300 && mouseX < 500 && mouseY > 240 && mouseY < 280) {
    rect(300, 240, 200, 40); 
    fill(0);
    text("PLAY!", 375, 268 );
    
  }
}

