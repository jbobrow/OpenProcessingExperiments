
/*AUTOR: Pablo Carrasco Toledo
*/



/** 
<h1><STRONG>LUMUS CORE GENERATOR<STRONG/><h1/>
<br/><h3><h3/>Este es mi proyecto el cual se basa en un sketch llamado LUMUS el cual hice hace un tiempo.
<br/>Este es un generador de "LUMUS", el cual genera una gran cantidad de energia desde su nucleo
<br/>y para no desencadenar una reaccion mayor, tiene particulas girando alrrededor de su nucleo las cuales
<br/>absorben la energia en forma de temperatura y la traspasan a las particulas mayores
<br/>las que a su vez estan comunicadas con la corteza exterior, la cual varia su tamaño para adecuarse 
<br/>al medio, y a la energia interna para asi liberar la energiagenerada haciendo esto de una forma perpetua
<br/>.....ENERGIA PERPETUA!.
<br/>
<br/>------------------------------------------------------------------------------------
<br/><h1><h1/>Instrucciones
<br/><h3><h3>1-.Para acercar o alejar la camara se usan las teclas direccionales arriba y abajo.
<br/>
<br/>2-.Para mover la camara se utiliza el mouse.
*/



float t,n,N,T,na,Na,r,R,c,C;/*Aca defino todos los float de letras que voy a ocupar....
 como lo hago siempre*/
float metaScale,difScale,Scale;/*Aca defini mi grupo de floats para generar ese 
 acercamiento y alejamiento gradual*/
void setup(){
  n=0;/*Letra que siempre uso para generar una variable para mi noise*/
  na=0;/*La uso para generar otro tipo de noise, en este caso uno mas brusco*/
  t=10;/*Variable en la que se ve aumentado "T"*/
  r=1;/*Variable en la que aumenta "R"*/
  Scale=0.5;/*Una de las 3 variables para generar ese  sutil movimiento de cerca/lejos, 
   a esta variable le llega el resultado final de la operacion entre las 3.*/
  c=10;/*Variable en la que se ve aumentado "C"*/
  metaScale=0.6;/*Variable la cual aumenta y disminuye por mis condicionales en el "void keyPressed"*/
  size(500,500,P3D);
  noCursor();//^^ uno de los comandos q siempre uso XD
  noStroke();

}






void draw(){
  translate(width/2,height/2);/*Translado el "0,0" al centro de la pantalla, lo cual me sirve
   al trabajar tanto con tantas esferas concentricas*/


  if(T>=7000||T<=-7000){/*Aca limito el rango de valores que alcanza "T" antes de ejecutar la condicional*/
    t=-t;/*Y esta es mi condicional en donde le digo que en el momento que "T" sobrepase
     el rango de valores que le impuse se active generando asi un circulo vicioso donde cuando
     "T" es mayor que 7000 "t" se convierte en "-t" asi empieza a invertir el movimiento hasta estabilizarse
     y pasar a un movimiento inverso(negativo), y en el momento en que "T" sobrepase los -7000
     "t" que en esos momentos es "-t" se volvera a operar por "-t" volviendose asi positivo otra vez (t).*/
  }
  if(C>=7000||C<0){/*Esta es una variable que genere para crear una concordancia entre la velocidad conque iva 
   aumentado la "inestabilidad" del nucleo y la "temperatura"(color rojo) que va adquiriendo y no le puse
   rango negativo porque el RGB no funcionario porlotanto la "temperatura" */
    c=-c;//tiene la misma funcion que "t"
  }


  scale(Scale); /*Escala el conjunto de elementos que hay en el sketch dando el efecto cerca/lejos*/

  R+=r;//Declaro que "R" (mi variable usada en la rotacion) se va aumentando en "r" el cual es = a 1
  na+=0.0087;//Especifico que "na"(mi variable para mi otro noise) va siendo aumentada en 0.0075
  n+=0.01;//Variable para mi noise principal la cual se aumenta en 0.01
  T+=t;//Aca especifique "T" aumentaba en "t" para asi generar  el circulo vicioso del giro en el nucleo
  N=noise(n)*2; /*Y aca esta mi noise,la forma en que yo uso el noise es insertar dentro de el una variable
   que vaya aumentando, osea que no sea estatica ya que el noise no funciona valores estaticos
   como ponerle: "noise(0.01);", encambio si se usa una variable progresiva, ya sea decir
   x=0; y que x+=0.1(va aumentando en 0.1) en ese momento activas noise)*/
  Na=noise(na)*2.3;//Otro noise XD
  C+=c;//Especifico en cuanto aumenta "C" para crear el otro circulo vicioso, pero ese va definido al color


  background(0);
  rotateX(mouseY/(PI*30));//Para rotar la "camara" entorno al eje X
  rotateY(mouseX/(PI*30));//Para rotar la "camara" entorno al eje Y

  lights();/*Aca defino las luces...sinceramente me costo encontrar una diferencia, experimente bastante y
   aun asi todavia no logro diferenciar ni manejarlas muy bien*/
  ambientLight(0, 0, 0);
  directionalLight(50, 50, 50, -500, -500*(N*2), -500);
  pointLight(50,50,50,-500, -500, -500);
  lightFalloff(250, 250, -250);

  calc();//Nombro los "void que voy a utilizar
  lumus();
  particulas();
  particulas_zona2();

}

void keyPressed(){/*Esta es pieza clave del la interacion en el sketch, estas condicionales 
 son para lograr el acercamiento y alejamiento con las teclas direccionales*/
  if (key == CODED) { 
    if (keyCode == UP) { 
      metaScale += 0.07; 
    }
    if (keyCode == DOWN) { 
      metaScale -= 0.07; 
    }

  }
}


void calc(){/*Y aca esta especificada toda la operacion para zoom/out*/
  difScale = metaScale - Scale;
  Scale += difScale * 0.1;
}



void lumus(){/*En este void tengo especificado los rayos de energia, el nucleo del lumus y ademas 
la cortezaexterior*/
  pushMatrix();//los meto dentro de push y pop matrix para arles "su propio mundo" XD
  strokeWeight(0.8);
  sphereDetail(37);
  rotateY(R/(PI*55));
  rotateX(R/(PI*85)); 
  stroke(90,190,90,120);
  fill(30,130,30,194);
  sphere((width*4.3)*Na);
  popMatrix();  


  pushMatrix();

  sphereDetail(20);
  scale(0.5);

  rotateY((T/5)*Na/(PI*35));
  rotateX(T/(PI*35)); 
  stroke(90+(C/50),190-(C/70),90,120);
  fill(30+(C/50),130-(C/50),30,194);
  sphere(width/2);

  rotateY(T/(PI*35));
  rotateX(T*N/(PI*35));
  stroke(40,140,40,100);
  fill(50,200,40,194);
  sphere(width/4.5);

  rotateY(T/(PI*35));
  rotateX(t/(PI*35));
  noStroke();  
  fill(255,255,255,254);
  sphere(width/9.5);

  stroke(255-(C/190),255-(C/100),255-(C/100),110+(C/100));
  line(0,0,0,random(-100,130+(C/17)),random(-100,130+(C/17)),random(-100,130+(C/17)));
  line(0,0,0,random(-100,130+(C/17)),random(-100,130+(C/17)),random(-100,130+(C/17)));
  line(0,0,0,random(-100,130+(C/17)),random(-100,130+(C/17)),random(-100,130+(C/17)));

  line(0,0,0,random(-130-(C/17),100),random(-130-(C/17),100),random(-130-(C/17),100));
  line(0,0,0,random(-130-(C/17),100),random(-130-(C/17),100),random(-130-(C/17),100));
  line(0,0,0,random(-130-(C/17),100),random(-130-(C/17),100),random(-130-(C/17),100));
  popMatrix(); 

}


void particulas(){/*Aca estan determinadas las particulas mas cercanas al nucleo que 
tienen una trayectoria y coordenadas de rotacion*/
  noStroke();
  //serie 1
  //---------------------  
  pushMatrix(); 
  rotateZ((R/(PI*9.5)));
  rotateX(R/(PI));
  translate(0,300);
  fill(50+(C/50),200-(C/90),40,220);
  sphere(10);
  fill(50+(C/50),200-(C/90),40,100);
  sphere(2*(N*15));
  fill(255,255,255);
  sphere(3);
  popMatrix();


  pushMatrix(); 
  rotateZ((R/(PI*9.5)));
  rotateY(R/(PI));
  translate(-300,0);
  fill(50+(C/50),200-(C/90),40,220);
  sphere(10);
  fill(50+(C/50),200-(C/90),40,100);
  sphere(2*(N*15));
  fill(255,255,255);
  sphere(3);
  popMatrix();



  pushMatrix(); 
  rotateZ((R/(PI*9.5)));
  rotateY(R/(PI));
  translate(300,0);
  fill(50+(C/50),200-(C/90),40,220);
  sphere(10);
  fill(50+(C/50),200-(C/90),40,100);
  sphere(2*(N*15));
  fill(255,255,255);
  sphere(3);
  popMatrix();



  pushMatrix(); 
  rotateZ((R/(PI*9.5)));
  rotateX(R/(PI));
  translate(0,-300);
  fill(50+(C/50),200-(C/90),40,220);
  sphere(10);
  fill(50+(C/50),200-(C/90),40,100);
  sphere(2*(N*15));
  fill(255,255,255);
  sphere(3);
  popMatrix();
  //--------------------------  


  //serie 2 (en negativo)
  //-------------------------- 
  rotateZ(0.6);
  pushMatrix(); 
  rotateZ(-(R/(PI*8.7)));
  rotateX(-(R/(PI)));
  translate(0,300);
  fill(50+(C/50),200-(C/90),40,220);
  sphere(10);
  fill(50+(C/50),200-(C/90),40,100);
  sphere(2*(N*15));
  fill(255,255,255);
  sphere(3);
  popMatrix();


  pushMatrix(); 
  rotateZ(-(R/(PI*8.7)));
  rotateY(-(R/(PI)));
  translate(-300,0);
  fill(50+(C/50),200-(C/90),40,220);
  sphere(10);
  fill(50+(C/50),200-(C/90),40,100);
  sphere(2*(N*15));
  fill(255,255,255);
  sphere(3);
  popMatrix();


  pushMatrix(); 
  rotateZ(-(R/(PI*8.7)));
  rotateY(-(R/(PI)));
  translate(300,0);
  fill(50+(C/50),200-(C/90),40,220);
  sphere(10);
  fill(50+(C/50),200-(C/90),40,100);
  sphere(2*(N*15));

  fill(255,255,255);
  sphere(3);
  popMatrix();

  pushMatrix(); 
  rotateZ((-R/(PI*8.7)));
  rotateX(-(R/(PI)));
  translate(0,-300);
  fill(50+(C/50),200-(C/90),40,220);
  sphere(10);
  fill(50+(C/50),200-(C/90),40,100);
  sphere(2*(N*15));
  fill(255,255,255);
  sphere(3);
  popMatrix();
  //-------------------------

  //serie 3
  //-----------------------
  pushMatrix();
  rotateZ(-(R/(PI*5.3)));
  rotateX(-(R/(PI/1.3)));
  translate(0,-400);
  fill(50+(C/50),200-(C/90),40,220);
  sphere(10);
  fill(50+(C/50),200-(C/90),40,100);
  sphere(2*(N*15));
  fill(255,255,255);
  sphere(3);
  popMatrix();



  pushMatrix();
  rotateZ(-3.5);
  rotateZ((R/(PI*5.3)));
  rotateX(-(R/(PI/1.3)));
  translate(0,-400);
  fill(50+(C/50),200-(C/90),40,220);
  sphere(10);
  fill(50+(C/50),200-(C/90),40,100);
  sphere(2*(N*15));
  fill(255,255,255);
  sphere(3);
  popMatrix();
  //------------------------------


  //serie 3.1
  //------------------------------
  rotateZ(0.5);
  pushMatrix();
  rotateZ((R/(PI*5.3)));
  rotateX((R/(PI/1.3)));
  translate(0,-400);
  fill(50+(C/50),200-(C/90),40,220);
  sphere(10);
  fill(50+(C/50),200-(C/90),40,100);
  sphere(2*(N*15));
  fill(255,255,255);
  sphere(3);
  popMatrix();


  rotateZ(0.5);
  pushMatrix();
  rotateZ(-3.5);
  rotateZ(-(R/(PI*5.3)));
  rotateX((R/(PI/1.3)));
  translate(0,-400);
  fill(50+(C/50),200-(C/90),40,220);
  sphere(10);
  fill(50+(C/50),200-(C/90),40,100);
  sphere(2*(N*15));
  fill(255,255,255);
  sphere(3);
  popMatrix();


}





void particulas_zona2(){/*En este void van las particulas en la zona intermedia, tienen una
poscicion variable gracias al noise*/

  pushMatrix();
  rotateZ(R/(PI/0.5));
  translate(0,-800*N);
  fill(50+(C/45),200*N,40,220);
  sphere(70);
  fill((50+(C/45)),(200-(C/140))*N,40,100);
  sphere(50);
  fill(255,255,255);
  sphere(30);
  popMatrix();


  pushMatrix(); 
  rotateZ(R/(PI/0.5));
  translate(0,800*N);
  fill(50+(C/45),200*N,40,220);
  sphere(70);
  fill((50+(C/45)),(200-(C/140))*N,40,100);
  sphere(50);
  fill(255,255,255);
  sphere(30);
  popMatrix();


  pushMatrix();

  rotateY(R/(PI/0.5));
  translate(800*N,0);
  fill(50+(C/45),200*N,40,220);
  sphere(70);
  fill((50+(C/45)),(200-(C/140))*N,40,100);
  sphere(50);
  fill(255,255,255);
  sphere(30);
  popMatrix();


  pushMatrix();

  rotateY(R/(PI/0.5));
  translate(-800*N,0);
  fill(50+(C/45),200*N,40,220);
  sphere(70);
  fill((50+(C/45)),(200-(C/140))*N,40,100);
  sphere(50);
  fill(255,255,255);
  sphere(30);
  popMatrix();

  pushMatrix();

  rotateX(R/(PI/0.5));
  translate(0,800*N);
  fill(50+(C/45),200*N,40,220);
  sphere(70);
  fill((50+(C/45)),(200-(C/140))*N,40,100);
  sphere(50);
  fill(255,255,255);
  sphere(30);
  popMatrix();

  pushMatrix();

  rotateX(R/(PI/0.5));
  translate(0,-800*N);
  fill(50+(C/45),200*N,40,220);
  sphere(70);
  fill((50+(C/45)),(200-(C/140))*N,40,100);
  sphere(50);
  fill(255,255,255);
  sphere(30);
  popMatrix();

}














