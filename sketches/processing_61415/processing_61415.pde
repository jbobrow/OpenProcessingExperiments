
PImage imagen;
void setup(){
  size(1200,900);
  imagen=loadImage("Mirko_Chibi_by_mirkochan copia.jpg");
image(imagen,0,0);
}

void draw(){
  for(int x=0;x<imagen.width;x++){//recorre horizonte
    for(int y=0;y<imagen.height;y++){//recorre vertical
    color este;
      este=imagen.get(x+int(random(-50,10)),y+int(random(-50,10)));
      set(x+450,y,este);//despliega el color del pixel
    }
  }
}

