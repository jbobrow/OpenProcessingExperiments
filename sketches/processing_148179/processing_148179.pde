
void setup(){
  size (950,780);
  background(0,20);
  smooth();
  PFont fontA = loadFont("Arial");
textFont(fontA, 12);
}
void draw(){
     stroke (300,mouseX,mouseY);
  smooth();
  rect(-20,-20,width+44,height+44);
    fill(0,4);
  translate (500,415);
  for (int i = 0; i < 28; i++){
    strokeWeight(.2);
    rotate(PI/12);
    line(0,mouseY,135,0);
    int x = 30;






  }


  stroke (300,mouseY,mouseX);
  smooth();
 // rect(-2,-2,width+4,height+4);
 //   fill(0,4);
  translate (0, 0);
  for (int i = 0; i < 28; i++){
    strokeWeight(.1);
    rotate(PI/12);
    line(0,mouseX,155,0);
    int x = 60;

    }
    

  stroke (100,mouseY,mouseY);
  smooth();
 // rect(-2,-2,width+4,height+4);
  //  fill(0,4);
  translate (0, 0);
  for (int i = 0; i < 28; i++){
    strokeWeight(.1);
    rotate(PI/12);
    line(0,mouseY,100,0);
    int x = 60;

    }
    
  stroke (300,mouseY,mouseX);
  smooth();
 // rect(-2,-2,width+4,height+4);
   // fill(0,4);
  translate (0, 0);
  for (int i = 0; i < 28; i++){
    strokeWeight(mouseY/190);
    rotate(PI/12);
    line(0,mouseY,170,0);
    int x = 60;

    }
    
}



