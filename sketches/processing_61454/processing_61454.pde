

PImage imagen1;
void setup(){
  size(1200,500);  
  imagen1=loadImage("bee-gees21.jpeg");
  background(0);
  image(imagen1,0,0);
 


}

void draw(){
  

  for(int x=0; x<width; x++){ //recorre horizontalmente
  for(int y=0; y<height; y++){ //recorre verticalmente 
  color este; // declara la varieble este de tipo color
  este=imagen1.get(x+int(random(-20,20)), y+int(random(-40,5))); //toma el color de un pixel con un nivel de desenfoque
  set(x+600,y,este); //fija el color del pixel tomado
 
  }
  }
}

