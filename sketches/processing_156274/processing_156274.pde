




void setup(){
  size(800,800);
 
  
}


  void draw()
{
 
 
  rect(0,0,width/2,height/2);
  noStroke();
  if(mouseX >0 && mouseX<width/2 && mouseY>0 && mouseY<height/2 )
  {fill(#FFADAE);
    }
    else {
    fill(#FFADF4);
      if(mousePressed==true)
  {fill(#A2FFF8);
    }
    else {
    fill(#ADEAFF);
  }
  }

  
    rect(width/2,0,width/2,height/2);
    noStroke();
  if(mouseX >width/2 && mouseX<width && mouseY>0 && mouseY<height/2 )
  {
    fill(#ADFFD8);
    }
    else {
    fill(#C1FFAD); if(mousePressed==true)
  {fill(#EFFFAF);
    }
    else {
    fill(#FFE9AF);
  }
  }
  rect(0,400,width/2,height/2);
  noStroke();
  if(mouseX >0 && mouseX<width/2 && mouseY>height/2 && mouseY<height)
  {
    fill(#FF28A2);
    }
    else {
    fill(#07B2AD);
     if(mousePressed==true)
  {fill(#EBFC36);
    }
    else {
    fill(#FC3696);
  }
  }
  rect(400,400,width/2,height/2);
  noStroke();
  if(mouseX >width/2 && mouseX<width && mouseY>height/2 && mouseY<height)
  {fill(#CD36FC);
    }
    else {
    fill(#3676FC);
     if(mousePressed==true)
  {fill(#36F4C9);
    }
    else {
    fill(#8EFC26);
  }
  }
} 


