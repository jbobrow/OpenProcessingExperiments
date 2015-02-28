
void setup(){
 size(250, 250);
smooth(); 
background(255);
noFill();
strokeWeight(.5);
}

void draw(){
 if(mousePressed){
 
     stroke(30,random(0, 150),random(0, 255), 140);
   triangle(mouseX, mouseY, 
          random(0, 250), random(0, 250),
          random(0, 250), random(0, 250));
   
 }  

 
 if(keyPressed){
   if (key == 's'){
   background(0);
   }
 }  
 
 
  
 if(keyPressed){
   if (key == 'c'){
   background(255);
   }
 }  
 
}

