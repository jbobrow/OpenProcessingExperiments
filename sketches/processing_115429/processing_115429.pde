
void setup(){
  size(400,400);
  
}

void draw(){
  
  
  if(mousePressed==true){
    if(mouseX<width/2&&mouseY<height/2){
      fill(255,0,0);
      rect(0,0,width/2,height/2);
    }
     else if(mouseX>width/2&&mouseY<height/2){
      fill(20,0,255);
      rect(width/2,0,width/2,height/2);
    }
       else if(mouseX>width/2&&mouseY>height/2){
      fill(0,255,14);
      rect(width/2,height/2,width/2,height/2);
    }
      else if(mouseX<width/2&&mouseY>height/2){
      fill(255,247,0);
      rect(0,height/2,width/2,height/2);
    }
  }
    else{
      background(192);
      line(width/2,0,width/2,height);
      line(0,height/2,width,height/2);
    }
  
}


