
void setup(){
  size(250, 250);
  smooth();
  noFill(); 
  background(255);
}

void draw(){
  frameRate(60);
  stroke(random(0, 255), random(0, 255), random(0, 255), 100);
 
 //Stroke Weight Control
 if(keyPressed){
   if(key == '1'){
     strokeWeight(0.1);
   }
 }
 
 if(keyPressed){
   if(key == '2'){
     strokeWeight(0.5);
   }
 }
 
 if(keyPressed){
   if(key == '3'){
     strokeWeight(1);
   }
 }
 
 if(keyPressed){
   if(key == '4'){
     strokeWeight(5);
   }
 }
 
 if(keyPressed){
   if(key == '5'){
     strokeWeight(10);
   }
 }
 
 if(keyPressed){
   if(key == '6'){
     strokeWeight(20);
   }
 }
 //
 
 
 //sqiugglylines
 if(keyPressed) {
   if (key == 'q'){
    bezier(mouseX, mouseY, random(0, height), random(0, height), 
       random(0, height), random(0, height), random(0, height), random(0, height)); 
   }
 }
 //random lines 
 if(keyPressed) {
   if (key == 'e'){
    line(mouseX, mouseY, random(0, height), random(0, height)); 
   }
 }
 //sqiuggly loops
 if(keyPressed) {
   if (key == 'w'){
    bezier(mouseX, mouseY, random(0, height), random(0, height), 
       random(0, height), random(0, height), mouseX, mouseY); 
   }
 }
 //change background white
 if(keyPressed) {
   if (key == 'a'){
    background(255);
 }
 }
 //change background
 if(keyPressed) {
   if (key == 's'){
    background(0);
 }
 }
 //randomize background
 if(keyPressed) {
   if (key == 'd'){
    background(random(255), random(255), random(255), 100);
 }
 
 }
 
  
}

