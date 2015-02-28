

int tamanyX = 10;
int tamanyY = 10;
 
void setup() {
  size(1000, 700);
  background(0);
    textSize(15);
  text("1.Pulsa n para borrar",20,50);
  text("2.Arrastra el raton con el boton derecho pulsado para dibujar una linea (verde es el standard)",20,70);
  text("3.Pulsa 'e' para dibujar elipses i 'v' para dibujar cuadrados de colorines)",20,90);
  text("4.Pulsa las iniciales de los colores basicos en ingles para que la linea cambie de color",20,110);
  text("5.Para dibujar elipses o cuadrados, puedes definir su tamaño de menor a mayor pulsando del 1-9 y luego la 'e' o la 'v' respecivamente",20,130);
  text("excepto el turquesa que es a 't'",20,150);


}
 
void draw() {

  if (mousePressed && (mouseButton == LEFT)) {
    stroke(0,255,0);
    line(mouseX, mouseY, pmouseX, pmouseY);
    if(key== 'r') {
    stroke(255,0,0);
    line(mouseX, mouseY, pmouseX, pmouseY);
    }
    if(key== 'g') {
    stroke(0,255,0);
    line(mouseX, mouseY, pmouseX, pmouseY);
    }
    if(key== 'b') {
    stroke(0,0,255);
    line(mouseX, mouseY, pmouseX, pmouseY);
    }
    if(key== 'p') {
    stroke(247, 76, 238);
    line(mouseX, mouseY, pmouseX, pmouseY);
    }
    if(key== 'w') {
    stroke(255,255,255);
    line(mouseX, mouseY, pmouseX, pmouseY);
    }
    if(key== 'o') {
    stroke(247, 164, 76);
    line(mouseX, mouseY, pmouseX, pmouseY);
    }
    if(key== 't') {
    stroke(76, 244, 247);
    line(mouseX, mouseY, pmouseX, pmouseY);
    }

  }else if (key == 'e') {
    fill(random(0,255),random(0,255),random(0,255));
    stroke(0);
    ellipse(mouseX,mouseY,tamanyX,tamanyY);   
  }else if (key == 'v') {
    fill(random(0,255),random(0,255),random(0,255));
    stroke(0);
    rect(mouseX,mouseY,tamanyX,tamanyY);
    
  }
  //Si apretem 'n', es posara el fons del mateix color inicial per tal d'aconseguir l'efecte de borrar 
   else if (keyPressed) {
    if (key == 'n') 
      background(0,0,0);
  }
    
    
    
    
    //per escollir el tamany de la rodona y del rectangle
       if (key == '1')  {
          tamanyX=20;
          tamanyY=20;
       }else if (key == '2'){
          tamanyX=30;
          tamanyY=30;
       }else if (key == '3'){
          tamanyX=40;
          tamanyY=40;
       }else if (key == '4'){
          tamanyX=50;
          tamanyY=50;
       }
         else if (key == '5'){
          tamanyX=60;
          tamanyY=60;
       
         }else if (key == '6'){
          tamanyX=70;
          tamanyY=70;
       
         }else if (key == '7'){
          tamanyX=80;
          tamanyY=80;
       
         }else if (key == '8'){
          tamanyX=90;
          tamanyY=90;
       
          }else if (key == '9'){
          tamanyX=100;
          tamanyY=100;
       }

  
 
 
   
   
   
   
   
}




