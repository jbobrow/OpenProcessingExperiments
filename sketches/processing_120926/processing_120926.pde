
boolean llansador = false;
int x = 0;

void setup(){
  size (600,600);
  background (255,255,255);
}

void draw(){
  if (mousePressed){
    line (mouseX, mouseY, pmouseX, pmouseY);
    }
  if (keyPressed){ //Color negro
    if (key == 'q'){
      stroke (0);
    }
    if (key == 'e'){ //Para borrar
      noStroke();
      fill (255);
      rect (mouseX, mouseY, 25,25);
    }
    if (key == ' '){ //Para limpiar el screen
      background (255);
    }
    if (key == 'r'){ //Color rojo
      stroke (255,0,0);
    }
    if (key == 'g'){ //Color verde
      stroke (0,255,0);
    }
    if (key == 'b'){ //Color azul
      stroke (0,0,255);
    }
    if (key == 'x'){ //Multicolor
      stroke (random(0,255),random(0,255),random(0,255));
      fill (random(0,255),random(0,255),random(0,255));
      ellipse (mouseX, mouseY, 10, 10);
    }
    if (key == '+'){ //Para agrandar tamaño
    strokeWeight (x++);
    }
    if (key == '-'){ //Para disminuir tamaño
    strokeWeight (x--);
    }
}
}
void mousePressed(){
  llansador = true;
}
void mouseReleased(){
  llansador = false;
}


