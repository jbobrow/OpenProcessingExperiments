
int tamany=10;
int posicion=0;
void setup(){
 size(400, 400);
 background(190);
}
void draw(){
// el "a" disminuye las 5 redondas y la "w" limpia y agranda las redondas que se mueven por el raton
// dando a la 'e' nos cambiara de imagen, y para volver, le damos a la 'w'.
 ellipse(posicion,posicion,posicion,100);
 posicion=(posicion+4)%500; 
 ellipse(100,posicion,posicion,posicion);
 posicion=(posicion+4)%500;
 ellipse(posicion,100,posicion,posicion);
 posicion=(posicion-4)%500;

 if(key =='e') {
   background(random(0,255));
 }
 
 fill(int(random(255)), int(random(255)), int(random(255)));
 ellipse(mouseX, mouseY,int(random(50)), tamany);
 ellipse(350 -mouseX,350 -mouseY,int(random(50)), tamany);
 ellipse(350 -mouseX,400 -mouseY,int(random(50)), tamany);
 ellipse(400 -mouseX,350 -mouseY,int(random(50)), tamany);
  ellipse(400 -mouseX,400 -mouseY,int(random(50)), tamany);
  
}
void keyPressed(){
  if(key =='a'){
    tamany=tamany+2;
  } else {
    tamany=tamany-2;
  }
  if(key == 'w'){
    if(mousePressed == true);
    background(#0F17DB);
  }
}

