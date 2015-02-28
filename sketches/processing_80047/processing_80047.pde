

int x= 300; //variable llamada x que es data de un numero entero.
            //interget= numero entero.
            //float= floating point, para numeros decimales.

int y=13;
int b=100;


void setup (){
background (0); 
size(900,900);


}

  

void draw(){

 
smooth();
stroke (70);
fill(random (210,250), random (180,255), random (120,55));
ellipse(mouseX,x,b,mouseY);



smooth();
stroke (70);
fill(15,150,0,0);
rect(random (900), random (900),random (120), random (140));
 

smooth();
stroke (255);
fill(255,250,0,8);
ellipse(mouseY,mouseX,b,b);

}


