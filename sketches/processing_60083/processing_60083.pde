
void setup(){
  size(400,400);
  smooth();
  
  noCursor();
  
  rectMode(CENTER);
background(255);  
}

void draw(){
  background(255);

if(mousePressed){
  fill(0);
    rect(30,200,20,20);
        rect(60,200,20,20);
        
            rect(340,200,20,20);
        rect(370,200,20,20);
        
             rect(185,30,20,20);
        rect(215,30,20,20);
        
               rect(185,370,20,20);
        rect(215,370,20,20);
   


}else{
  noStroke();
  fill(200);
  ellipse(mouseX,mouseY,20,20);
    ellipse(mouseX+30,mouseY,20,20);
    
      ellipse(mouseX+100,mouseY+60,20,20);
    ellipse(mouseX+70,mouseY+60,20,20);
    
          ellipse(mouseX-70,mouseY+60,20,20);
    ellipse(mouseX-40,mouseY+60,20,20);
    
              ellipse(mouseX,mouseY+120,20,20);
    ellipse(mouseX+30,mouseY+120,20,20);
}

}
