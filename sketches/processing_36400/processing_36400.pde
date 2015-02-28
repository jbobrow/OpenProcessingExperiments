

void setup(){
  size(300,300);
}

void draw(){
  
  //white background with small black box
  if(mouseY < height/2){ 
    background(255);
    fill(0);
    rect(mouseX,mouseY,50,50);
    
    //blue background with large orange box
  }else{
    background(29,38,242);
    fill(250,159,13);
    rect(mouseX,mouseY,100,100);
  }
}

