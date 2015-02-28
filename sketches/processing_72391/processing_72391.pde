
int counter;
//Rebecca Liu
//Introduction to Digital Media Fall 2012
//Section A

void setup(){

  size(1200,600);
  background(221,160,221);
 
}

void draw(){
  
}
void mouseClicked(){
  
   
   
   stroke(153,50,204);
   strokeWeight(2);
   line(mouseX,mouseY,1100,400);
   
   stroke(255,0,0);
   strokeWeight(1);
   line(mouseX,mouseY,600,574);
   
   stroke(0,0,128);
   strokeWeight(3);
   line(mouseX,mouseY,400,399);
   
 stroke(255,21,147);
 fill(0,191,255);
bezier(mouseX, mouseY, 40, 90, 170, 390, 415, 280);
   

}
  

void keyPressed(){
  if(key == 's'){
   save("rebeccaLiuWithAileena.png"); 
  }
  
}
