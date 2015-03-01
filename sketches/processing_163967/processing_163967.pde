

 
void setup() {  
  size(800, 500);
  background(255);  

  smooth();
}
 
void draw() {  //draw function loops
 frameRate(100); 
  if(mousePressed == true ) { //add some interaction
    fill(random(0,255), random(0,255), random(0,255));
   
    filter(ERODE);
    noStroke();
    ellipse(mouseX+random(0,100), mouseY+random(0,100), 50, 50);
    ellipse(mouseX-random(0,100), mouseY-random(0,100), 50, 50);
    ellipse(mouseX+random(0,100), mouseY-random(0,100), 50, 50);
    ellipse(mouseX-random(0,100), mouseY+random(0,100), 50, 50);  
  }
  else {
    
  }




}

void keyPressed(){
 
   if(key=='r'){
  background(255);
   }

  


  
}
