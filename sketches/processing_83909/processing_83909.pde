
int variable1=10;
//para definir la posicion 1
int variable2=10;
//para definir la posicion 2
float color1=random(255);
//para definir el color
float color2=0;
//para definir el color
int velocidad=5;
//sirve para aumentar la velocidad por segundo


void setup(){
  size(400,400);
  background(0,0,0);
  //Aqui ponemos lo que se ejecutara 1 vez unicamente
}
 
void draw(){
  //aqui ponemos lo que se ejecutara todo el rato, es ya en si mismo un bucle
  //por lo tanto no necesitamos utilizar while para lo que queremos hacer.
  
frameRate(velocidad);
//esta funcion frameRate es la velocidad a la que ira nuestro programa

fill(0,random(255),0);
ellipse(variable2,variable1,20,20);
variable2=variable2+25;

if(variable2>400){
  variable1=variable1+25;
  variable2=0;
}
if(variable1>=400){
  variable1=0;
  variable2=0;
}

if(keyPressed){
    if (key=='+'){
       velocidad=velocidad+10;
    }
    if (key=='-'){
       velocidad=velocidad-10;
    }
    if (key=='a'){
        background(0,0,0);
    }
}
} 



