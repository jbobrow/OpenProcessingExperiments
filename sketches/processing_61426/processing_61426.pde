
PImage imagen;
void setup(){
  size (800,400);
  imagen=loadImage("20071129090337-pocoyo1.jpg");
  //background(0);
  image(imagen,0,0);
}

void draw(){
  for(int x=0; x <imagen.width; x++) { //recorre horizonte
    for(int y=0; y <imagen.height; y ++){ //recorre verical

    color este; //declara la variable este de ti
    este= imagen.get(x+int(random(-10,10)),y+int(random(-10,10)));
    set(x+450,y,este); //despliega el color del pixel tomado
    
    }
  }
}
 

