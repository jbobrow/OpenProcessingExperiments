
/**h1 <strong> "UNA IMAGEN ,CINCO MIRADAS" </strong> 
 *Proyecto Final de II Trimestre de 2009. LCO. Processing 
 *Entrega: Martes 25 de Agosto. 
 *Por Christopher Fattori. 
 *Basado en ejemplo de la clase 5 de Herber Spencer "obj01_Polar2" 
 * 
 *h2<strong>Descripción</strong> 
 * 
 *Sketch interactivo:
 *En el inicio es posible ver la imagen inicial
 * al apretar el mouse que hará aparecer la foto.
 * Luego apretando las teclas 'a','s','d','f','g',
 * será posible ver la imagen de distintos colores y maneras de aparecer:
 * a = Pintura luminosa que escurre de arriba hacia abajo.
 * s = Particulas coloreantess( colores billantes).
 * d = Gusanos coloreantes (matices rojos,violetas y negros).
 * f = Ellipse acendentes (colores extraidos de la foto).
 * así como crear diversas combinaciones que quedaran guardadas con el nombre de "mini"
 * apretando cualquier tecla .Para ver lienzo en blancoapretar 'h'.
 */

//Se craga la imagen
PImage img; 
//se declaran variables
ArrayList pinceles; //vaiables de objetos
float ancho, alto, grosor;//varisables de imagen
int x,y;//variables x e y

//parámetros del sketch
void setup(){ 
  size(650,600); //tamaño
  smooth(); //suabizado
  pinceles = new ArrayList(); //asignacion de variables
  background(255); //color fondo blanco
  masPinceles(); //objeto
  img = loadImage("ritoque.jpg"); //craga imagen
  colorMode (HSB); //modo de color
} 
//para extraer el color de la imagen
color pal(PImage i, int x, int y){ 
  color c = i.get(x,y); 
  return c; 
} 


//Se inicia el dibujo
void draw(){ 

  //para pintar la imagen   
  if (mousePressed == true){
    ancho = random(20,40);
    alto = random(15,30);
    grosor = random(5,10);
    x = round(random(width));
    y = round(random(height));
    fill(img.get(mouseX,mouseY));
    noStroke();
    PImage foto= img.get(mouseX,mouseY,40,40);
    image(foto,mouseX,mouseY);
  }

  //ciclo del pincel objeto
  for(int i = 0; i < pinceles.size(); i++){ 
    Pincel p = (Pincel)pinceles.get(i); 
    p.dibuja(); 
  } 

} 

// ciclo para crear mas objetos
void masPinceles(){ 
  int sp = 0; 
  for(int i = 0; i < height; i++){ 
    Pincel p = new Pincel(0, i); 
    p.ang = 0; 
    pinceles.add(p); 
  }  
} 


// variables para el tipo de pincel
class Pincel{ 
  int x, y; 
  float ang, rad; 
  int seed; 

  //se declaran las  variables
  Pincel(float px, float py){ 

    //los valores de los float se redondean para se numeros enteros y asi poder pintar
    x = round(py);       
    y = round(px); 
    rad = 6;//mayor el rad mas amplia es la curva y mas rapido se llena 
    seed = round(random(10000)); 
  } 

  //se inicia el dibujo del pincel con los siguientes parámetros
  void dibuja(){ 
    //si se aprieta una tecla cualquiera esto pasa:
    if( keyPressed == true){

      noiseSeed(seed); //se establece el valor para el noise en uno constante 
      ang += (noise(millis()/random(350,450)) - 0.5) * HALF_PI; //segun el tiempo aparecen

      x += round(cos(ang) * rad);  
      y += round(sin(ang) * rad+4);//curvatura del pincel y privilegia la caida desde arriba hacia abajo

      float h,s,b;  //se declaran valores de color que se extraen fielmente de la foto
      h = hue (pal(img, x, y));  
      s = saturation (pal(img, x, y));  
      b = brightness (pal(img, x, y)) ;  

      fill(h,s,b);
      noStroke(); 
      ellipse(x,y,4,4); // se establece la forma del pincel, en este caso son circulos
      if (x < 0) x += width; 
      if (y < 0) y += height; 
      if (x > width) x -= width; 
      if (y > height) y -= height;//el pincel no escapa del marco 
    }

    //Si se aprieta la 'a'
    else if( key == 'a'){ 

      noiseSeed(seed); 
      ang += (noise(millis()/random(350,450)) - 0.5) * HALF_PI; 


      y += round(sin(ang) * rad+4);//privilegia la caida desde arriba

      float h,s,b; 
      h = hue (pal(img, x, y)) + 20;  
      s = saturation (pal(img, x, y))+20;  
      b = brightness (pal(img, x, y)) +40;  //se alteran los valoresen el color

      fill(h+2,s*2,b*2);//vuelvo a alterarlos jugando con ellos,colores planos fuertes y luminosos
      noStroke(); 
      ellipse(x,y,7,7); //aumento el tamaño

      if (x < 0) x += width; 
      if (y < 0) y += height; 
      if (x > width) x -= width; 
      if (y > height) y -= height;//el pincel no escapa del marco 
    }
    //si apriettas 's'
    else if(key == 's'){ 

      noiseSeed(seed); 
      ang += (random(millis()/300))*HALF_PI; //aparecen mas rápido al poner random y al dividir los millis() en un numero menor

      x += round(cos(ang) * rad);  
      y += round(sin(ang) * rad);//x e y aparcen de forma pareja 

      float h,s,b; 
      h = hue (pal(img, x, y)) +random(10,80);  
      s = saturation (pal(img, x, y))+40;  
      b = brightness (pal(img, x, y)) +30;  //altero nuevamente los valores de color de otra forma,colores saturados al azar 

      fill(h,s,b);
      noStroke(); 
      ellipse(x,y,4,4); 
      if (x < 0) x += width; 
      if (y < 0) y += height; 
      if (x > width) x -= width; 
      if (y > height) y -= height;//el pincel no escapa del marco 

    }

    //si aprietas  'd'
    else  if(key == 'd' ){ 


      noiseSeed(seed); 
      ang += (noise(millis()/450) - 0.5) * HALF_PI; //divido los millis en una menor cantidad

      x += round(sin(ang) * rad);  
      y += round(cos(ang) * rad);

      float h,s,b; 
      h = hue (pal(img, x, y))+random(80,250) ;  
      s = saturation (pal(img, x, y))+ random(0,20);  
      b = brightness (pal(img, x, y)) +20;  //se altera de otra forma el color rojo,violetas, purpuras y azules

      fill(h,s,b);
      noStroke(); 
      ellipse(x,y,4,4); 
      if (x < 0) x += width; 
      if (y < 0) y += height; 
      if (x > width) x -= width; 
      if (y > height) y -= height;//el pincel no escapa del marco 

    }

    else if(key == 'f' ){ 

      noiseSeed(seed);
      ang += (random(millis()/450) - 0.5) * HALF_PI;//mas rapido

      x += round(cos(ang) * rad);
      y += round(sin(ang) * rad-4);//se privilegia el crecimientode abajo hacia arriba

      stroke(pal(img, x, y));
      strokeWeight(random(1,PI*(random(2,4))));
      point(x,y); //otro tipo de forma esta vez son puntos que toman el color directo de la foto
      if (x < 0) x += width; 
      if (y < 0) y += height; 
      if (x > width) x -= width; 
      if (y > height) y -= height;//el pincel no escapa del marco 

    }


    else  if(key == 'g' ){ 
      noiseSeed(seed); 
      ang += (noise(millis()/random(350,450)) - 0.5) * HALF_PI; //es suave


      y += round(sin(ang) * rad+5);//cae en forma de cascada



      float h,s,b;  
      h = hue (pal(img, x, y))/50;  
      s = saturation (pal(img, x, y))*2;  
      b = brightness (pal(img, x, y)) ;  //se altera otra vez el valor dando un tono rojo

      fill(h,s,b);
      noStroke(); 
      ellipse(x,y,4,4); 
      if (x < 0) x += width; 
      if (y < 0) y += height; 
      if (x > width) x -= width; 
      if (y > height) y -= height;//el pincel no escapa del marco 


    }
    else if (key == 'h'){
      fill(255);
      rect(0,0,650,600);//crea un cuadro blanco
    }
  }  
}


/*Cada cambio de pincel al teclear una letra empieza desde
 *donde estubieron los pinceles en el momento en que se apretó la tecla asi
 *se crean combinaciones*/


















