
//Inspired b66y Interactive Abstract Tool Anson Ng

void setup(){
  size(600, 600);
  smooth();
  noFill();
  background(0);
}
  
void draw(){
  frameRate(15);
  rect( random(600), random(600), random(600), 50);
  stroke(random(0,255), random(0, 255), random(0,255), 30);
  strokeWeight(1.5);
  
  //Stroke Weight Control
 if(keyPressed){
   if(key == '1'){
     strokeWeight(0.5);
   }
 }
  
 if(keyPressed){
   if(key == '2'){
     strokeWeight(1);
   }
 }
  
 if(keyPressed){
   if(key == '3'){
     strokeWeight(5);
   }
 }
  
 if(keyPressed){
   if(key == '4'){
     strokeWeight(10);
   }
 }
  
 if(keyPressed){
   if(key == '5'){
     strokeWeight(20);
   }
 }
  
 if(keyPressed){
   if(key == '6'){
     strokeWeight(50); 
   }
 }
  
 //sqiugglylines
    bezier( random(0,500) , random(0,500) , random(0, height), random(0, height),
       random(0, height), random(0, height), random(0, height), random(0, height));
    
    bezier( random(0,500) , random(0,500) , random(0, height), random(0, height),
       random(0, height), random(0, height), random(0, height), random(0, height));
       
//squiggly loops
    bezier(mouseX , mouseY , random(0, height), random(0, height),
       random(0, height), random(0, height), mouseX, mouseY);
    
    line(mouseX, mouseY, random(0, height), random(0, height));
}
                                                                                
