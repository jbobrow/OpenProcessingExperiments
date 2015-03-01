
boolean llansador = false;
int x = 0;
 
void setup(){
  size (1000, 650);
  background (255, 255, 255);
}
 
void draw(){
  if (mousePressed){
    line (mouseX, mouseY, pmouseX, pmouseY);
    }
    //negre
  if (keyPressed){ 
    if (key == 'n'){
      stroke (0);
    }
    //molts colors
    if (key == 'm'){ 
      stroke (random(0, 255),random(0, 255),random(0, 255));
      fill (random(0, 255),random(0, 255),random(0, 255));
      ellipse (mouseX, mouseY, 10, 10);
    }
    //goma
    if (key == 'e'){ //Para borrar
      noStroke();
      fill (255);
      rect (mouseX, mouseY, 25, 25);
    }
        //Vermell
    if (key == 'r'){ 
      stroke (255, 0, 0);
    }
    //net
    if (key == ' '){
      background (255);
    }
    //verd
    if (key == 'g'){ 
      stroke (0, 255, 0);
    }
    //blau
    if (key == 'b'){ 
      stroke (0, 0, 255);
    }
    //augmentar
    if (key == '+'){ 
    strokeWeight (x++);
    }
    //disminuir
    if (key == '-'){ 
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
