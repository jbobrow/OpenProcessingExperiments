
void setup() {
  size (800, 800);
  frameRate(30); //perquè el moviment sigui fluïd

}

  
void draw(){
  background(0); //fons negre
  
//definició del fons amb el color aleatori i de diferents combinacions
 //he aconseguit que les ellipses no se solapessin separant-les el seu diàmetre   
 for (float i = 25; i<width+25; i = i +50){
    fill(255, random(250), mouseY-50);
    strokeWeight(8);
    stroke(255, 171, 3);
    ellipse(i, 775, 50, 50);} 
  
 for (float i = 25; i<width+25; i = i +50){
    fill(255, mouseX+300, mouseY-50);
    strokeWeight(7.5);
    stroke(255, 171, 3);
    ellipse(i, 725, 50, 50);}

 for (float i = 25; i<width+25; i = i +50){
    fill(255, mouseX+300, random(200));
    strokeWeight(7);
    stroke(255, 171, 3);
    ellipse(i, 675, 50, 50);}
 
 for (float i = 25; i<width+25; i = i +50){
    fill(255, random(250), mouseY-50);
    strokeWeight(6.5);
    stroke(255, 171, 3);
    ellipse(i, 625, 50, 50);}
 
 for (float i = 25; i<width+25; i = i +50){
    fill(255, mouseX+300, mouseY-50);
    strokeWeight(6);
    stroke(255, 171, 3);
    ellipse(i, 575, 50, 50);}
 
 for (float i = 25; i<width+25; i = i +50){
    fill(255, mouseX+300, random(200));
    strokeWeight(5.5);
    stroke(255, 171, 3);
    ellipse(i, 525, 50, 50);}
  
 
 for (float i = 25; i<width+25; i = i +50){
    fill(255, random(250), mouseY-50);
    strokeWeight(5);
    stroke(255, 171, 3);
    ellipse(i, 475, 50, 50);}
 
 
 for (float i = 25; i<width+25; i = i +50){
    fill(255, mouseX+300, mouseY-50);
    strokeWeight(4.5);
    stroke(255, 171, 3);
    ellipse(i, 425, 50, 50);}


 for (float i = 25; i<width+25; i = i +50){
    fill(255, mouseX+300, random(200));
    strokeWeight(4);
    stroke(255, 171, 3);
    ellipse(i, 375, 50, 50);}
 
 
  for (float i = 25; i<width+25; i = i +50){
    fill(255, random(250), mouseY-50);
    strokeWeight(3.5);
    stroke(255, 171, 3);
    ellipse(i, 325, 50, 50);}
  
  
  for (float i = 25; i<width+25; i = i +50){
    fill(255, mouseX+300, mouseY-50);
    strokeWeight(3);
    stroke(255, 171, 3);
    ellipse(i, 275, 50, 50);}
  
  
   for (float i = 25; i<width+25; i = i +50){
    fill(255, mouseX+300, random(200));
    strokeWeight(2.5);
    stroke(255, 171, 3);
    ellipse(i, 225, 50, 50);}
   
   for (float i = 25; i<width+25; i = i +50){
    fill(255, random(250), mouseY-50);
    strokeWeight(2);
    stroke(255, 171, 3);
    ellipse(i, 175, 50, 50);}
  
  
  for (float i = 25; i<width+25; i = i +50){
    fill(255, mouseX+300, mouseY-50);
    strokeWeight(1.5);
    stroke(255, 171, 3);
    ellipse(i, 125, 50, 50);}
  
   for (float i = 25; i<width+25; i = i+50 ){
    fill(255, mouseX+300, random(200));
    strokeWeight(1);
    stroke(255, 171, 3);
    ellipse(i, 75, 50, 50);}

    
  for (float i = 25; i<width+25; i = i+50){
    fill(255, random(250), mouseY-50);
    strokeWeight(0.5);
    stroke(255, 171, 3);
    ellipse(i, 25, 50, 50);}
    
    //aparició dels rectangles en posicions a l'atzar, amb mida aleatòria i color aleatòria
    
    for(int i=0; i<width; i++){
    float posX = random(width);
    float posY = random(height);
    float tamano = random (35);
    fill(255, random(10), random(200));
    rect(posY,posX,tamano,tamano);
  }
    
  
  
    
  }




