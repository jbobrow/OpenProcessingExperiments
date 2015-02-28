
float randomDiameter=0;
float strokeGray=0;

void setup() {
size(1200,600);
background(0);
}
void draw() {

 
 smooth();

  stroke(mouseY,mouseY,mouseX);
  strokeWeight(mouseX);                                                                                                                                                                                              
  fill(mouseX,mouseY,mouseX);
  
 // randomDiameter=random(10,49);
 if(randomDiameter<100){
   randomDiameter++;
 }
 else{randomDiameter=0;}
   
ellipse(mouseX,mouseY,randomDiameter,randomDiameter);


}
void mouseClicked() {
  if(strokeGray==0){
     strokeGray=255;
  }
  else{strokeGray=0;}
}
void keyPressed(){
  if(key=='s'){
    save("CHANG.png");
  }
}
