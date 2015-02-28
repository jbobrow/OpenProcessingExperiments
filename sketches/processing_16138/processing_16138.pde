
void setup(){
  size(400,400);
}

void draw (){
 
  if(mouseX<200){
    fill(random(150),random(20),random(57),100);
    stroke(0);
    ellipse(mouseX,mouseY,80,80);
  
  }else{
    fill(random(180),random(50),random(100),100);
  noStroke();
    ellipse(mouseX,mouseY,80,80);
  
  }
  
}

                
                
