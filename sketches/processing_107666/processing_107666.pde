
int value=0;
float vel=0;


void setup(){
 
  size(500,500);
 
  smooth();
  
  
}
void draw(){
  fill(0,20);
  rect(0, 0, width, height);
  noCursor();

  noStroke();
  
   
  vel=dist(mouseX, mouseY, pmouseX, pmouseY);
  //println(vel);
  
  if(vel>0){
    fill(89, 15, 11);
    rect(250, 480, 20, 20);
    
    fill(106, 125, 17);
    rect(230, 460, 20, 40);
    
    fill(44, 86, 15);
    rect(270, 430, 20, 70);
  }
  
    if(vel>=5){
      fill(89, 15, 11);
    rect(250, 450, 20, 50);
      
      fill(106, 125, 17);
    rect(230, 430, 20, 70);
    
    fill(44, 86, 15);
    rect(270, 400, 20, 100);
  }
  
    if(vel>=10){
      fill(89, 15, 11);
       rect(250, 430, 20, 70);
       
       fill(106, 125, 17);
    rect(230, 400, 20, 100);
    
    fill(44, 86, 15);
    rect(270, 380, 20, 120);
  }
    if(vel>=15){
      fill(89, 15, 11);
       rect(250, 410, 20, 90);
       
        fill(106, 125, 17);
    rect(230, 385, 20, 115);
    
    fill(44, 86, 15);
    rect(270, 344, 20, 156);
  }
    if(vel>=20){
      fill(89, 15, 11);
    rect(250, 380, 20, 120);
    
    fill(106, 125, 17);
    rect(230, 350, 20, 150);
    
    fill(44, 86, 15);
    rect(270, 315, 20, 185);
  }
  
    if(vel>=25){
      fill(89, 15, 11);
    rect(250, 340, 20, 160);
    
    fill(106, 125, 17);
    rect(230, 325, 20, 175);
    
    fill(44, 86, 15);
    rect(270, 300, 20, 200);
  }
  
    if(vel>=30){
      fill(89, 15, 11);
       rect(250, 300, 20, 200);
       
       fill(106, 125, 17);
    rect(230, 305, 20, 195);
    
    fill(44, 86, 15);
    rect(270, 270, 20, 330);
  }
    if(vel>=35){
      fill(89, 15, 11);
       rect(250, 250, 20, 250);
       
        fill(106, 125, 17);
    rect(230, 260, 20, 340);
    
    fill(44, 86, 15);
    rect(270, 250, 20, 350);
  }
}
