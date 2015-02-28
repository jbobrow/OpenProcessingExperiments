
void setup(){
  size(400,400);
}

void draw(){
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
  
  if(mousePressed ==true){
    if(mouseX <width/2 && mouseY <height/2){
      fill(255,21,21);
      rect(0,0,width/2,height/2);
    }
    else{if (mouseX >width/2 && mouseY < height/2){
      fill(254,255,0);
      rect(width/2,0,width/2,height/2);
    }
    else{if(mouseX <width/2 && mouseY >height/2){
      fill(0,23,255);
      rect(0,height/2,width/2,height/2);
    }
    else{if(mouseX>width/2 && mouseY> height/2)
      fill(51,255,49);
      rect(width/2,height/2,width/2,height/2);
    }
    }
    }
  }else{ 
  background(0,0,0);

}

}


