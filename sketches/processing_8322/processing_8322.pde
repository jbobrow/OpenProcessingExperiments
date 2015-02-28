
void endPage(){
  image(lose, -width/2, 0);
  
  if(mousePressed == true){
    stage = 0;
    reset();
  }
 
}

