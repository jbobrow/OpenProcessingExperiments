
int naranja=#FF4500;
int verde=#008000;
int rojo=#FF0000;
int azul=#00FFFF;
int marron=#D2691E;
int borrar=255;

void setup(){
  size(500,500);
  background(255);
}

void draw (){
  noStroke();

  ellipse(mouseX,mouseY,30,30);
if (mousePressed){
    noStroke();
    
    fill(random (0,255),random(0,255),random(0,255));
    }
if (keyPressed){
  //borrar
if (key == 'b'){
      fill(borrar);
      ellipse(mouseX,mouseY,100,100);
    }
if (key == 'n'){
      fill(naranja);
      ellipse(mouseX,mouseY,30,30);
    }
if (key == 'r'){
      fill(rojo);
      ellipse(mouseX,mouseY,30,30);
    }
if (key == 'v'){
      fill(verde);
      ellipse(mouseX,mouseY,30,30);
    }
if (key == 'a'){
      fill(azul);
      ellipse(mouseX,mouseY,30,30);
    }
if (key == 'm'){
      fill(marron);
      ellipse(mouseX,mouseY,30,30);
    }
    
}
}


