
PImage imagen1;
void setup(){
size(950,350);

imagen1=loadImage("oso pardo.jpg");
 image(imagen1,0,0);
}

void draw(){
  for(int x=0;x<imagen1.width;x++){//recorre horizontalmente
  for(int y=0;y<imagen1.height;y++){//recorre verticalmenet
  color este; //declara la variable este tipo de color
  este=imagen1.get(x+int(random(-20,20)), y+int(random(-1000,20))
  );//toma el color de un pixel con un nivel de desenfoque
  set(x+470,y,este);//fija el color del pixel tomado
  }
  }
}

