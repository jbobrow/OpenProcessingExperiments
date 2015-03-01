

void setup()
{
  
 size(500,500);
 background(255);
 smooth();
}
void draw()
{
strokeWeight(3);
if (mousePressed)
{

line(pmouseX,pmouseY,mouseX,mouseY);
}

if (keyPressed)
{
  if (key=='q'){ 
  stroke(#FFF303);
 }
  
if (key=='w'){
    stroke(#FF0000);
     }
  
  if (key=='e'){
    stroke(#B600FF);
  }
  
 if (key=='r'){
    stroke(#FFA400);
  }
  
  if (key=='t'){
    stroke(#00FF15);
   }
  
  if (key=='y'){
    stroke(#F569FF);
  }
  
  if (key=='u'){
    stroke(#0009FF);
  }
  
  if (key=='i'){
    stroke(#653300);
   
  }
  
  if (key=='o'){
    stroke(#00FBFF);
  }
  
  if (key=='p'){
    stroke(#00FFAB);
  }
  
}

}
