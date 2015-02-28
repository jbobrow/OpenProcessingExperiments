

int option = 1;

void setup() {

size(400, 300);//tamaño

smooth();

noFill();

}



void draw() {

background (255);//color de fondo



if (option == 1) {

// Option 1

background(115,85,98,54);// color de fondo

smooth (); // suaviza los bordes


for (int i=0;//se declara la variable y se le asigna valor 0
         i< width; //si i es menor que el ancho
         i+=12) { //se le suma a la variable 12
 
  for (int j=0; //declara j=0
           j< width; //si j es menor que el ancho
           j+=50) { //suma a la variable 50
             
             
    fill (i,j,0);//color
    rect (i,j+12,25,25);//posicion rectangulo
  }
}

} 

else if (option == 2) {

// Option 2


  background(0);
for (int i =0; //se declara variable
 i < width; //si i es menor que el ancho
 i +=20) { //suma 20 a i
 
 for (int j=20; //declara j=0
           j< height; //cuenta hasta que se transforme en el alto
        j+=36){
 

  
   fill(99, i,230,205); // se ira cambiando el color 
 ellipse (i,150,89,200);// se ira cambiando la posicion del cuadrado

} 
}
}

else if (option == 3) {

// Option 3

background (128,85,112,147);//color de fondo

for (int x = 50; x <= width-50; x +=25) {// se declara variable x

for (int y = 50; y <= height-50; y+=25) {// se declara variable y

strokeWeight(20);// ancho del borde

stroke (0);// Color de la línea

fill(78,123,198); //rellena objetos

rect(25,25,250,250); //posicion del rectangulo

}

}

} 

else if (option == 4) {


int semiTransparencia;// definicion de variable semitransparencia

semiTransparencia= 280; //se le asigna un valor de transparencia

noStroke();// sin borde

background (58,69,74,123);// color de fondo

fill (58, 200,89, semiTransparencia);//color

ellipse (width/2,40,100,100); //Posicion inicial de la elipse, alto y ancho

fill (125, 85, 50,semiTransparencia);//color

ellipse (width/8,120,200,280); //Posicion inicial de la elipse, alto y ancho

fill (125, 45,80,150);//color

ellipse (width/2,80,500,semiTransparencia); //Posicion inicial de la elipse, alto y ancho

}



else if (option == 5) {
  
  
for (int x = 20; x <= width; x += 30) {// se declara variable x
 
for (int y = 20; y <= height; y+=30) {// se declara variable y
 
fill (y,x,100); // color
   
ellipse(x, y, 90, 10); //posicion ellipse
 
}
 
}
}

else if (option == 6) 
for (int i=0; // se declara la variable, con valor 0
    i< width;
    i+=25) { // se le suma a la variable 25
     
    for (int j=0;
    j<height; //cuenta hasta que se tranforme en el alto
    j+=25) {
     
    fill (114,i,100); // color
    rect (i,j,60,60); // posicion rectangulo
     
    }
 }
 
}



void mousePressed() {

option++;

if (option > 6) option = 1;

}
