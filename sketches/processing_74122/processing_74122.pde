
 boolean eraser= false;
 boolean pen = false;
 
 void setup() {  
 size(600, 600);  
 noStroke();  
 rectMode(CENTER); 
 background(255); 
 }
 
 void draw() {   
 eraser(); 
 pen();
 }
 
 void eraser(){
 if (keyPressed) {  
   if (key == 'b' || key == 'B') {     
   eraser=true;     
 pen=false;   
 }  
 if (eraser) {  
 fill(255); 
 if (mousePressed){ 
   rect(mouseX,mouseY,100,100); 
 }
 }
 }
 } 
 
 void pen(){ 
   if (keyPressed) {    
   if (key == 'n' || key == 'n'){    
   eraser=false;   
   pen=true;  
 if (pen) {   
 fill(0);  
 if(mousePressed) {  
 ;    
 rect(mouseX,mouseY,5,5);}
 }
 }
 }
 }

