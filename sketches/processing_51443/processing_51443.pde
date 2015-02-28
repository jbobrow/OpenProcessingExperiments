
//Math, Programming & Art
//Feb. 7, 2012
//by Mariana Moreno- Gonzalez
//HW Wk4: Interactive Pattern

void setup (){
  background (44,126,255);
  size (900,500);
  smooth ();
  stroke (255);
}

void draw (){
  for (int i= 0; i < 2000; i +=200){
    for (int j= 0; j < height; j +=200){
      if (mouseX > i-200 && mouseX < i+2000 && mouseY > j && mouseY < j+height){
        stroke (200);
        fill (200);
      } else {
        stroke (255);
        fill (255);
      }       
      //off-centered clouds
      ellipse (i-160,j-105,35,35);
      ellipse (i-130,j-105,45,45);
      ellipse (i+100,j-105,70,70);
      ellipse (i+130,j-105,45,45);
      ellipse (i+160,j-105,35,35);
      //centered clouds
      ellipse (i-60,j,35,35);
      ellipse (i-30,j,45,45);
      ellipse (i,j,70,70);
      ellipse (i+30,j,45,45);
      ellipse (i+60,j,35,35);
    }
  }
}



