
//Mariana Moreno
//February 28, 2012
//Math, Programming & Art:
//MIDTERM
int x;
int y;
int colorValue;
float ellSize = 0;

void setup (){
  size (600,600);
  smooth ();
  background (0);
  noFill ();
  strokeWeight (1.5);
  colorValue=0;
}

void draw (){
  colorValue++; 
  float ellSize = 0;
  for (int x = 0; x < width; x+=10){
    for (int y = 0; y < height; y+=10){
      pushMatrix();
      fill (5,2,214);
      stroke (27,3,113);
      ellSize = sin (x*y) * 5;
      ellipse (x,y,random(ellSize+4),random(ellSize+4));
      popMatrix();
    }
  }
  if (mousePressed){
   colorValue++;
   pushMatrix ();
    noFill ();
    stroke (45,39,255);
    ellipse (mouseX,mouseY,colorValue++,colorValue++);
    ellipse (mouseX+15,mouseY+20,colorValue++,colorValue++);
    ellipse (mouseX-15,mouseY+20,colorValue++,colorValue++);
   popMatrix ();
  } 
   
}

void mouseReleased (){
  colorValue++;
  pushMatrix ();
  noFill ();
  stroke (255);
  popMatrix ();
  ellipse (mouseX,mouseY,colorValue,colorValue);
  ellipse (mouseX+15,mouseY+20,colorValue,colorValue);
  ellipse (mouseX-15,mouseY+20,colorValue,colorValue);
}

void mouseClicked(){
 colorValue = 0;
}





