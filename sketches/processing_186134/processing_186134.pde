
void setup(){
size(960,580);
stroke(225,240,150);

 background(230,198,40);
}

void draw (){
 line(width/3,0,width/3,height);

line(width/3*2,0,width/3*2,height);

line(0,height/3,width,height/3);

line(0,height/3*2,width,height/3*2);
  //1
  
  
  if (mouseX<width/3){
    if(mouseY<height/3){
       fill(255,255,255);
      rect(0,0,mouseX,mouseY);
      //ellipse(width/2 + 100, height/2 + 100, 30, 30);
     //ellipse(mouseX,mouseY,40,40);
    // rect(width/2,height/2,40,50);
}
  }
//2
  if (mouseX>width/3){
    if (mouseX<width/3*2){
    if(mouseY<height/3){
     fill(163,139,200);
    
     ellipse(mouseX, mouseY, 50, 50);
      //ellipse(width/3 + 150, height/3 - 50, mouseX, mouseY);
      //height/3 - 100
      //rect(1,height/2,mouseX,mouseY);
    }
    }
  }
  //3
   if (mouseX>width/3*2){
    if(mouseY<height/3){
      fill(255,255,255);
      triangle(width/3*2+100, height/3-100, mouseX, mouseY, width/3*2+300, height/3-300);
      //triangle(width/3*2+100, height/3-100, width/3*2+200, height/3-50, width/3*2+300, height/3-300);
      //ellipse(width/2 + 100, height/2 + 100, 30, 30);
    //  rect(width/2,1,mouseX,mouseY);
    }
  }
  //4
   if (mouseX<width/3){
     if(mouseY>height/3){
    if(mouseY<height/3*2){
     fill(163,139,200);
      ellipse(mouseX,mouseY, mouseX, 30);
     // rect(1,1,mouseX,mouseY);
    }
  }
   }
  //5
   if (mouseX>width/3){
     if (mouseX<width/3*2){
    if(mouseY>height/3){
      if(mouseY<height/3*2){
        fill(255,255,255);
         ellipse(mouseX,mouseY,2,50);
      //ellipse(width/2 + 100, height/2 + 100, 30, 30);
     // rect(1,1,mouseX,mouseY);
    }
  }
     }
  //6
   if (mouseX>width/3*2){
     if(mouseY>height/3){
    if(mouseY<height/3*2){
      fill(163,139,200);
      //ellipse(width/2 + 100, height/2 + 100, 30, 30);
      rect(mouseX,height/3,width/3*2,height/3);
    }
  }
   }

   //7
   if (mouseX<width/3){
     
    if(mouseY>height/3*2){
      
      rect(10,500,200,700);
     // rect(mouseX,mouseY,1,height/3*2);
     // rect(1,1,mouseX,mouseY);
    }
  }
   }
  //8
   if (mouseX>width/3){
     if (mouseX<width/3*2){
    
      if(mouseY>height/3*2){
        fill(255,255,255);
        
         ellipse(440,450,mouseY,100);
      //ellipse(width/2 + 100, height/2 + 100, 30, 30);
     // rect(1,1,mouseX,mouseY);
    }
  }
     }
  //9
   if (mouseX>width/3*2){
     if(mouseY>height/3){
    if(mouseY<height/3*2){
      fill(163,139,200);
      //ellipse(width/2 + 100, height/2 + 100, 30, 30);
      rect(mouseX,height/3,width/3*2,height/3);
    }
  }
   

   }
}

