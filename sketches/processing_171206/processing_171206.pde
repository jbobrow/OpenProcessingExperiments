
boolean clicked = false;
boolean rainbow = false;
int value = 1;
int red = 0;
int green = 0;
int blue = 0;

void setup(){
size (950,650);
background(255);
}

void draw () {

  // dibujamos la linea de color negro
  if(clicked == true){
        strokeWeight(value);
        stroke(red,green,blue);
        line(mouseX,mouseY,pmouseX,pmouseY);
   
  }
  //pintamos el rainbow segun donde este situado el raton
  if(rainbow == true){
   noStroke();
   fill(mouseX,mouseY,128);
   ellipse(mouseX, mouseY,40,40);
  
  }
}

void mousePressed(){
  clicked = true;
  
}

void mouseReleased(){
  clicked = false;
}

void keyPressed(){
  //Pulsar para la gama de colores rainbow
  if (key == '9'){
   rainbow = true;
  }
  if (key == '0'){
   rainbow = false;
  }
  // pulsar para limpiar la pantalla
  if (key == '1'){
    background (255);
  }
  if(key == '+'){
    value = value + 1;
  }
  else if (key == '-'){
    value = value - 1;
  }
  if (key == '2'){
   red = 255;
   green=0;
   blue=0;
  }
  if (key == '3'){
   red=0;
   green = 255;
   blue=0;
  }
  if (key == '4'){
    red=0;
    green=0;
    blue = 255;
  }
  if (key == '5'){
   red = 0;
   green =0;
   blue = 0;
  }
}

  





