
PImage imagen;
void setup(){
  
size(900,250);
imagen=loadImage("imagesCAUFOPFR.jpg");
background(0);
image(imagen,0,0);

}


void draw(){
  for(int x=0; x<width;x++){// recorre horizontalmente
  for(int y=0; y<height;y++){// recorre verticalmentetalmente
  color este; // declara la variable este de tipo color
  este=imagen.get(x+int(random(-5,5)), y+int(random(-5,30))); //toma el color del pixeltomado
  set(x+600,y,este);//fija el color de pixel tomando
  }
  }
}

