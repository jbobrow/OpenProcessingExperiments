
/*"The Radar"
por Bernardo Silva Cartilef. 
*/ 
float x = 0;//variabe a utilizar.
float a = 0.0;//tiempo. 
float rSize;//tamaño. 
 
void setup(){ 
  size(500, 500);//tamaño de sketch 
    rSize = width/2 ; // variable para medir(en este caso dividir) el ancho del objeto.  
  smooth();//suavizado. 
  loop();//ciclo.
 
} 
 
 
void draw(){ 

  pelota();//figura en el sketch.
 fill(0,7);//relleno y tranparencia del fondo.
  rect(0,0,width,height);//cuadrado de fondo.
   stroke(#00FF2C,100);//linea,color y su transparencia. 
  strokeWeight(2);// grosor de la linea .
   a += 0.003;// mide la velocidad y la separacion que hay entre las lineas.Incrementa a en 0.003 .
  if(a > TWO_PI) { //si a es mayor a 2 PI. 
    a = 0.0;  
  } 
  translate(width/2, height/2);// ubica la figura en el centro de del sketch .
    rotate(a*10.0);//variable que permite que gire el quad en "a,y se multiplique por 7.0" 
     quad(-rSize, -rSize, rSize*2, rSize*2,-rSize, -rSize, rSize*2, rSize*2); //dimensiones del "quad",basadas en el "float rSize".  
} 

void pelota (){
x += 0.4;// que "x" se incremente en uno.
  if (x > width) {//cuando "x" sea mayor que el ancho,retorna a 0.
    x = 1;
  }
noStroke();//no contorno
fill(0,9);//relleno(negro)y tranparencia.
ellipse(x,150,x,height/4);// ovni madre
ellipse((x+1)*2.5,40,12,12);//ovni
ellipse((300+x),100,60,35);//ovni
ellipse((x+0.05),450,30,30);//ovni
}

