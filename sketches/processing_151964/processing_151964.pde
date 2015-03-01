
/* Bases de datos / Mariana Lombard
 -----------------------------------------------------------------------------------------------------------------------
 La idea de la visualizacion es generar un perfil de ciudad donde cada comuna corresponda a un edificio y, a su vez, 
 cada edificio tenga alojados dentro los datos de las viviendas habitadas, deshabitadas y colectivas indicadas mediante
 colores bien diferenciados.
 ----------------------------------------------------------------------------------------------------------------------- 
 */

Ventanas ventana[];
String [] lineas;
float [] comuna; 
float [] total_v;
float [] v_habitadas; 
float [] v_deshabitadas; 
float [] v_colectivas;
int edificioAncho = 900/15;
float [] contador;
int k;

void setup() {
  size (1000, 300);
  background(105, 152, 183);

  textSize(14);
  fill(255);
  text("Viviendas habitadas, deshabitadas, colectivas / Ciudad Autonoma de Buenos Aires / segun Comuna", 180, 80);

  textSize(12);
  fill(255);
  text("viviendas habitadas", 30, 20); 
  fill(255, 255, 0);
  rect(10, 10, 10, 10);

  textSize(12);
  fill(255);
  text("viviendas deshabitadas", 30, 40);
  fill(255);
  rect(10, 30, 10, 10);

  textSize(12);
  fill(255);
  text("viviendas colectivas", 30, 60);
  fill(255, 0, 0);
  rect(10, 50, 10, 10);


  lineas = loadStrings ("viviendas.csv");
  comuna = new float [lineas.length];
  total_v = new float [lineas.length];
  v_habitadas = new float [lineas.length];
  v_deshabitadas = new float [lineas.length];
  v_colectivas = new float [lineas.length];
  ventana = new Ventanas[lineas.length];
  contador = new float [lineas.length];
  for (int i=0; i < lineas.length; i++) {
    ventana [i] = new Ventanas(k);
    contador[i] =0;
  }
}


void draw() {  
  for (int i=0; i<lineas.length; i++) { 
    String [] values = split (lineas[i], ';');
    comuna [i] = int (values [0]); 
    total_v [i] = float (values [1]); 
    v_habitadas [i] = float (values [2]); 
    v_deshabitadas [i] = float (values [3]); 
    v_colectivas [i] = float (values [4]);
    strokeWeight(1);
    stroke(0);
    ventana[i].update(i);
    ventana[i].dibujar(i);


    //    println("total_v"+total_v[i]);
  }
}

class Ventanas
{
  //atributos
  int posx;
  int posy;
  color relleno;
  color amarillo;
  color rojo;
  color blanco;
  int a;

  
  Ventanas(int k) {
    stroke(0);
    posx = 0;
    posy = height;
    amarillo = color(252, 233, 37);
    rojo = color(222, 69, 69);
    blanco = color (255);
    relleno = amarillo;
    a = 10;
  }

 
  void dibujar(int k) {
    pintar(k);
    fill (relleno);
    rect (posx+edificioAncho*k+40, posy, a, a);
   
  }


  void update(int k) {
    if (contador[k]<total_v[k]) {
      if (posx<=edificioAncho) {
        posx=posx+a;
      } else {
        posx=0;
        posy=posy-a;
      }
      contador[k]++;

    }
    //    println(total_v[0]);
    
  }
  void pintar(int k) {
    if (contador[k]<=v_habitadas[k]) {
      relleno = amarillo;
    } else if (contador[k]<=v_habitadas[k]+v_deshabitadas[k]) {
      relleno = blanco;
    } else {
      relleno = rojo;
    }
    //  println(v_habitadas[0]);
  }
}



