
//originariamente iban a ser circulos pero luego cambie de idea pero por comodidad mantuve el nombre :)
class circulo
{
int inicioX;//posicion de origen en el eje X
int inicioY;//posicion de origen en el eje Y
int sumando;//lo que sumo en el for
float sumaRadio;//lo que sumo al radio
float growth;//cada cuadradito se agranda hasta un determinado tamaño
float phase;//frecuencia con la que se agranda y achica
float x;//posicion de lo que voy a dibujar en el draw en X
float y;//posicion de lo que voy a dibujar en el draw en Y
float radius = 0.0; //radio de cada circulo del firework (que a su vez esta conformado por varios cuadrados)
float angle2 = 0.1; // angulo para usar en los cuadrados que conforman cada anillo del firework (originariamente eran circulos pero cambie de idea)
float speed = 0.02; // velocidad de crecimiento
//constructor
//posicion inicial x e y, lo que sumo al int del for, lo que sumo al radio, el growth, la phase
circulo(int ix, int iy, int s, float sr, float g, float ph)
{ inicioX = ix;
  inicioY = iy;
  sumando = s;
  sumaRadio = sr;
  growth = g;
  phase = ph;
}//fin constructor
void crecimiento()//cuando termina de salir, vuelve a empezar en tanto el usuario mantenga el click del mouse
{if(radius >= 350)
    {radius = 0.0;
     };  
}//fin void crecimiento
void display()//funcion que muestra el resultado cuando se la llama en el sketch
{for(int deg = 0; deg < 360; deg += sumando)//para que se vaya agrandando el radio de la circunferencia armada por los circulitos
     { float angle = radians(deg);//paso el valor del angulo a radianes
       radius += sumaRadio;//al radio le voy sumando el valor que luego determino con el constructor
       x = inicioX + (cos(angle) * radius);//posicion inicial del firework en X
       y = inicioY + (sin(angle) * radius);//posicion inicial del firework en Y
       angle2 +=speed; //para que cada cuadradito se agrande y se achique
       float diametro = (sin(angle2 + phase)) * growth;
       //cada uno esta conformado por 3 cuadrados de distintos tamaños
       rect(x, y, diametro, diametro); 
       rect(x, y, diametro/0.5, diametro/0.5);
       rect(x, y, diametro/1.5, diametro/1.5);     
      };
}//fin void display
}

