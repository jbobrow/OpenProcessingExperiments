
int x=0;

void setup(){
  size(1200,450);
 
}
 void draw(){
background(0);
  noStroke();
  fill(#ff0557);
  if (mouseX<75 && mouseY<height){
    rect(0,0,75,height);
  }else if(mouseX<150 && mouseX>75 && mouseY<height){
    fill(#ff05b1);
    rect(75,0,75,height);
  }else if(mouseX<225 && mouseX>150 && mouseY<height){
    fill(#ec05ff);
    rect(150,0,75,height);
  }else if(mouseX<300 && mouseX>225 && mouseY<height){
    fill(#b405ff);
    rect(225,0,75,height);
    }else if(mouseX<375 && mouseX>300 && mouseY<height){
    fill(#5705ff);
    rect(300,0,75,height);
    }else if(mouseX<450 && mouseX>300 && mouseY<height){
    fill(#050eff);
   rect(375,0,75,height);
  }else if(mouseX<525 && mouseX>375 && mouseY<height){
   fill(#0562ff);
    rect(450,0,75,height);
   }else if(mouseX<600 && mouseX>375 && mouseY<height){
   fill(#05abff);
   rect(525,0,75,height);
    }else if(mouseX<675 && mouseX>450 && mouseY<height){
   fill(#05f4ff);
   rect(600,0,75,height);
    }else if(mouseX<750 && mouseX>525 && mouseY<height){
   fill(#05ffc9);
   rect(675,0,75,height);
   }else if(mouseX<825 && mouseX>600 && mouseY<height){
   fill(#05ff6e);
   rect(750,0,75,height);
    }else if(mouseX<900 && mouseX>675 && mouseY<height){
   fill(#05ff23);
   rect(825,0,75,height);
   }else if(mouseX<975 && mouseX>750 && mouseY<height){
   fill(#61ff05);
   rect(900,0,75,height);
    }else if(mouseX<1050 && mouseX>825 && mouseY<height){
   fill(#a9ff05);
   rect(975,0,75,height);
    }else if(mouseX<1125 && mouseX>900 && mouseY<height){
   fill(#fcff05);
   rect(1050,0,75,height);
   }else if(mouseX<1200 && mouseX>975 && mouseY<height){
   fill(#ffce05);
   rect(1125,0,75,height);
    
    
  
  } 
  }



