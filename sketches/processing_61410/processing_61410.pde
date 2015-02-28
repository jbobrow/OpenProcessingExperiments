


PImage imagen; 

void setup(){
  size (1000,500);
  imagen= loadImage ("raton.jpg");
  background (0);
 
}

void draw (){
  
  if (mousePressed){
    image (imagen,0,0);
  }
    
  for (int x=0; x<imagen.width ;x++){//recorre horizontalmente 
  for (int y=0; y<imagen.height; y++){//recorre verticalmente 
  
  color este; //declara la variable este de tipo de color 
  este= imagen.get (x+int(random (-10,10)), y+int(random(-10,10))
  ); //toma el color de un pixel como un nivel de desenforque 
  
  set(x+450, y, este); //fija el color del pixel tomado.
  }
  }
}


