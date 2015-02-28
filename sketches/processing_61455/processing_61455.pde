
PImage imagen;
void setup(){
  size(1200,800);  
  imagen=loadImage("loomis.jpg");
  background(0);
  image(imagen,0,0);
 


}

void draw(){
  for(int x=0; x<width; x++){ //recorre horizontalmente
  for(int y=0; y<height; y++){ //recorre verticalmente 
  color este; // declara la varieble este de tipo color
  este=imagen.get(x+int(random(-40,40)), y+int(random(0,0))); //toma el color de un pixel con un nivel de desenfoque
  set(x+600,y,este); //fija el color del pixel tomado
 
  }
  }
}



