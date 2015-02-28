
//import processing.pdf.*;

void setup () {
  noLoop();
  size (400,800);
  //beginRecord(PDF,"myFunPictureYay7.pdf");
  smooth();
  background(0);
  fill(0);  
  strokeWeight(4);
}
int space = 12;
int triangleTop=-60;
int triangleBottom= 140;
void draw() {
  stroke(255,0,0);
  triLoop();
  triangleTop=triangleTop+50;
  triangleBottom = triangleBottom+50;
  stroke(255,162,0);
  triLoop2();
  triangleTop=triangleTop+50;
  triangleBottom = triangleBottom+50;
  stroke(255,255,0);
  triLoop3();
  triangleTop=triangleTop+50;
  triangleBottom = triangleBottom+50;
  stroke(0,255,0);
  triLoop4();
  triangleTop=triangleTop+50;
  triangleBottom = triangleBottom+50;
  stroke(0,255,255);
  triLoop5();
  triangleTop=triangleTop+50;
  triangleBottom = triangleBottom+50;
  stroke(0,0,255);
  triLoop6();
  triangleTop=triangleTop+50;
  triangleBottom = triangleBottom+50;
  stroke(255,0,255);
  triLoop7();
  endRecord();



  // String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
  //  if(filePath != null) {
  // save(filePath + ".png");
}
//}

void triLoop() {
  while(triangleTop<5) {
    triangle(width/2,triangleTop,-180,triangleBottom,width+180,triangleBottom);
    triangleTop= triangleTop+space;
    triangleBottom = triangleBottom+space;
  }
}
void triLoop2() {
  while(triangleTop<130) {
    triangle(width/2,triangleTop,-180,triangleBottom,width+180,triangleBottom);
    triangleTop= triangleTop+space;
    triangleBottom = triangleBottom+space;
  }
}

void triLoop3() {
  while(triangleTop<260) {
    triangle(width/2,triangleTop,-180,triangleBottom,width+180,triangleBottom);
    triangleTop= triangleTop+space;
    triangleBottom = triangleBottom+space;
  }
}
void triLoop4() {
  while(triangleTop<390) {
    triangle(width/2,triangleTop,-180,triangleBottom,width+180,triangleBottom);
    triangleTop= triangleTop+space;
    triangleBottom = triangleBottom+space;
  }
}
void triLoop5() {
  while(triangleTop<520) {
    triangle(width/2,triangleTop,-180,triangleBottom,width+180,triangleBottom);
    triangleTop= triangleTop+space;
    triangleBottom = triangleBottom+space;
  }
}
void triLoop6() {
  while(triangleTop<650) {
    triangle(width/2,triangleTop,-180,triangleBottom,width+180,triangleBottom);
    triangleTop= triangleTop+space;
    triangleBottom = triangleBottom+space;
  }
}
void triLoop7() {
  while(triangleTop<780) {
    triangle(width/2,triangleTop,-180,triangleBottom,width+180,triangleBottom);
    triangleTop= triangleTop+space;
    triangleBottom = triangleBottom+space;
  }
}

void keyPressed() {
  //Takes PNG screenshots when you push S
  //Careful - doesn't prompt when overwriting files!
  if(key == 's' || key == 'S') {
    //endRecord();
  }
}


