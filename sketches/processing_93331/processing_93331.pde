
void setup (){
  size(200,200);
  background(255);
}

void draw(){
  noStroke();
  if(mouseX<100 && mouseX>0 && mouseY<100 && mouseY>0){
   fill(#EAC5D7);
  rect(0,0,width/2,height/2);
  }
  else {
    fill(255);
    rect(0,0,width/2,height/2);
  }
  if(mouseX>100 && mouseX<200 && mouseY>0 && mouseY<100){
    fill(#EA80B3);
    rect(100,00,width/2,height/2);
  }
  else{
     fill(255);
    rect(100,0,width/2,height/2);
  }
  if(mouseX>0 && mouseX<100 && mouseY>100 && mouseY<200){
    fill(#DE1D7A);
    rect(0,100,width/2,height/2);
     }
     else{
       fill(255);
       rect(0,100,width/2,height/2);
     }
     if(mouseX>100 && mouseX<200 && mouseY>100 && mouseY<200){
       fill(#9D0E54);
       rect(100,100,width/2,height/2);
     }
     else{
       fill(255);
       rect(100,100,width/2,height/2);
     }
    
  
  
  }



