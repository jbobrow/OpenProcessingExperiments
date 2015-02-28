
// Autor: Toni Cogolludo Abia.
void setup (){
  size (400,400);
  background (255);
  noStroke ();
}

void draw (){
  background (255);
  rectangles ();
  //inicializacion posicion
  int j = 20;
  int i = 20;
  noFill ();
  if (mouseX >= 0 && mouseX <= 20 && mouseY >= 20 && mouseY <= 400 || mouseX >= 380 && mouseX <= 400 && mouseY >= 0 && mouseY <= 380){
    horizontal ();
  }
  if (mouseX >= 0 && mouseX <= 380 && mouseY >= 0 && mouseY <= 20 || mouseX >= 20 && mouseX <= 400 && mouseY >= 380 && mouseY <= 400){
    vertical ();
  }
}
void rectangles (){
    //verde
  fill (0,255,0);
  rect (0,0,400,20);
  //rojo
  fill (255,0,0);
  rect (0,20,20,400);
  //azul
  fill (0,0,255);
  rect (380,0,20,400);
  //amarillo
  fill (255,255,0);
  rect (20,380,400,20);
}
  
void vertical (){
  int i = 20;
  while (i < 380){
    //verde
    if (mousePressed && mouseX >= 0 && mouseX <= 380 && mouseY >= 0 && mouseY <= 20){  
      fill(0,random(0,255),0);
    }
    //amarillo
    if (mousePressed && mouseX >= 20 && mouseX <= 400 && mouseY >= 380 && mouseY <= 400){  
      fill(random(200,255),random(200,255),0);    
    }
    rect (i,20,20,360);
    i += 20;
  }
}

void horizontal (){
  int j = 20;
  while (j < 380){  
    // rojo
    if (mousePressed && mouseX >= 0 && mouseX <= 20 && mouseY >= 20 && mouseY <= 400){  
      fill(random(0,255),0,0);
    }
    //azul
    if (mousePressed && mouseX >= 380 && mouseX <= 400 && mouseY >= 0 && mouseY <= 380){  
      fill(0,0,random(0,255));
    }    
    rect (20,j,360,20);
    j += 20;
  }
}


