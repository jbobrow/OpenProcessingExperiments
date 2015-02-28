
// Juego del Gato, ver. 3 (reinicia juego + cambio turno al inicio)
// Algoritmo de la MÃ¡quina: Ganar o bloquear o random
// cc-by-sa alberto pacheco @beto0303 (alberto@acm.org)
// mex, nov 2013

import ddf.minim.*; //2
import ddf.minim.ugens.*; //2

Minim minim; //2
AudioOutput out; //2

final float SI=233.08, DO=261.63, RE=293.66, MI=311.13, FA=349.23; //2 MI & SI BEMOL
float[] notas = {RE, RE, MI, FA, FA, MI, RE, DO, SI, SI, DO, RE, RE, DO, DO}; //2
float[]   dur = {1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.5,0.5,2.0}; //2

final int nodef=-1, vacio=0, rueda=1, cruz=2; //3 rueda=computer, cruz=human
boolean gana = false; // end-of-game
int turno = cruz; // 1=rueda, 2=cruz
int radio = 70; // tamaÃ±o figuras
int jugadas = 0; //1.3 no. jugadas
int timer = 0; //3 retardo final juego

int[][] tablero = { // matriz para tablero
    // cada elemento = [cx,cy,jugador]
    {1,1,vacio},{2,1,vacio},{3,1,vacio},
    {1,2,vacio},{2,2,vacio},{3,2,vacio},
    {1,3,vacio},{2,3,vacio},{3,3,vacio}};

int[][] winners = { //1.1 Matriz de Trazos: formas de ganar
    // cada elemento = [i1,i2,i3,ruedas,cruces,vacios]
    {0,1,2,0,0,nodef}, {3,4,5,0,0,nodef}, {6,7,8,0,0,nodef}, // horizontal
    {0,3,6,0,0,nodef}, {1,4,7,0,0,nodef}, {2,5,8,0,0,nodef}, // vertical
    {0,4,8,0,0,nodef}, {2,4,6,0,0,nodef}};               // diagonal

IntList vacios = null; //2:3 casillas-opciÃ³n para la compu

// dibuja tablero de juego
void setup()
{
  minim = new Minim(this); //2
  out = minim.getLineOut(Minim.STEREO); //2
  size(400,400);
  colorMode(RGB, 255);
  noLoop(); //3 no draw auto-refresh
  inicia();
}

void inicia() //3 condiciones iniciales de juego
{
  for (int i=0; i<tablero.length; i++) { // vaciar tablero
    tablero[i][2] = vacio;
  }
  gana = false; // candado cuando gana
  background(255); // borrar tablero
  strokeWeight(4); // dibujar tablero
  stroke(0);
  line(50,150,350,150);
  line(50,250,350,250);
  line(150,50,150,350);
  line(250,50,250,350);
  if ( round(random(0,2)) == 1 ) { //3 turno al azar (inicio)
    turno = cruz; // inicia humano
    jugadas = 0;
  } else {
    turno = rueda; // inicia la compu
    piensa_y_juega(); // jugada inicial (compu)
    jugadas = 1;
  }
}

void cruz(int cx, int cy) {
    int r = radio / 2;
    stroke(220,0,70);
    line(cx-r,cy-r,cx+r,cy+r);
    line(cx-r,cy+r,cx+r,cy-r);
}

void rueda(int cx, int cy) {
    noFill();
    stroke(30,0,220);
    ellipse(cx,cy,radio,radio);
}

int contar(int p) //1.2 Calcula contadores para trazo p
{
    int[] data = winners[p]; // trazo ganador
    int ruedas = 0; // Contador ruedas (true)
    int cruces = 0; // Contador cruces (false)
    // 1 es rueda. 2 es cruz. -1 es nada
    winners[p][5] = nodef; // vacio (reset)
    for (int i=0; i<3; i++) { // each index
        switch (tablero[data[i]][2]) {
          case rueda: // rueda
                ++ruedas;
                break;
          case cruz: // cruz
                ++cruces;
                break;
          default: // vacio (0)
                vacios.append(data[i]); //1.3 (bug)
                winners[p][5] = data[i]; //indice
        }
    }
    winners[p][3] = ruedas;
    winners[p][4] = cruces;
    return max(ruedas,cruces); // regresa mayor puntuaciÃ³n
}

int ruedas(int p) { return winners[p][3]; } //1.3

int cruces(int p) { return winners[p][4]; } //1.3

boolean casilla(int i) // Dentro de casilla? Dibuja jugador y cambio de turno
{
    int[] celda = tablero[i];
    int cx = celda[0]*100;
    int cy = celda[1]*100;
    int sel = celda[2];
    boolean inside = mouseX>=cx-45 && mouseX<=cx+45 && mouseY>=cy-45 && mouseY<=cy+45;
    if (inside && sel==0) {
        out.playNote(0.0,0.5,FA); //2
        cruz(cx,cy); //1.5 false = cruz
        ++jugadas; //1.3
        tablero[i][2] = cruz; // ocupado x jugador
        turno = rueda; // cambia turno: la computadora
    }
    return inside;
}

boolean win() //1.1 Verifica si hay Ganador
{
    vacios = new IntList(); //2 Reset

    for (int i=0; i<winners.length; i++) { // each trazo
        if ( contar(i) == 3 ) { // tres-en-lÃ­nea?
            int[] ini = tablero[winners[i][0]]; // pos. inicial
            int[] fin = tablero[winners[i][2]]; // pos. final
            stroke(100,100,0,100);
            strokeWeight(radio/2);
            line(ini[0]*100,ini[1]*100,fin[0]*100,fin[1]*100); 
            return true; // win!
        }
    }
    return false; // not yet
}

void tiraCompu(int i) //1.3 Dibuja rueda
{
    int cx = tablero[i][0]*100;
    int cy = tablero[i][1]*100;
    rueda(cx,cy);
    ++jugadas; //1.3
    tablero[i][2] = rueda; // ocupado! (bug)
    turno = cruz; // cambia turno    
    out.playNote(0.5,0.5,DO); //2
}

boolean piensa_y_juega() //1.3 La compu decide su jugada
{
  for (int i=0; i<winners.length; i++) { // each trio..
    if ( ruedas(i)==2 ) { //1:3 TIRAR A GANAR?
      int vacio = winners[i][5];  // vacio=indice
      if ( vacio != nodef ) { // Hay lugar?
        tiraCompu(vacio); // Gana!
        return true; // fin!
      }
    }
  }
  for (int i=0; i<winners.length; i++) { // each trio..
    if ( cruces(i)==2 ) { //3 TIRAR A BLOQUEAR?
      int vacio = winners[i][5];  // vacio=indice
      if ( vacio != nodef ) { // Hay lugar?
        tiraCompu(vacio); // Bloquea!
        return true; // fin!
      }
    }
  }
  // escoge casilla vacia al azar
  if ( vacios==null ) { //3 caso especial: inicia la compu el juego
    tiraCompu(floor(random(0,9)));
  } else { // jugada random normal
    int idx = floor(random(0,vacios.size()));  //:2
    tiraCompu(vacios.get(idx));
  }
  return (jugadas<9); // se termino?
}

void ode_to_joy(boolean win, float factor, float v1, float v2) //2 Beethoven music
{
  for (float vel=v1; vel>=v2; vel/=2.0) {
    float ini=0.1;
    for (int i=(win?0:notas.length-1); (win?i<notas.length:i>=0); i+=(win?1:-1)) {
      float d = dur[i]*vel;
      out.playNote(ini,d,notas[i]*factor);
      ini += d;
    }
  }
  timer = millis(); //3 start timer: comienza a contar tiempo retrazo
}

void draw()
{
    if ( gana ) {
      if ( millis()-timer > 3500 ) { //3 Espera para reiniciar juego
          inicia();
      }
      return;
    }
    for (int i=0; i<tablero.length; i++) { // each cell..
        if ( casilla(i) ) { // inside?
            fill(0,100,0);
            textSize(24);
            if ( win() ) { //1.1 win?
                ode_to_joy(true,1.0,0.4,0.1); //2
                gana = true;
                text("Â¡GANASTE!",130,32);
                return;
            }
            if ( jugadas>=9 || !piensa_y_juega()) { //1.3 Juega Compu
                ode_to_joy(false,0.9,0.1,0.05); //2
                gana = true;
                text("Â¡EMPATE!",130,32); // Tablero lleno!
                return;
            }
            if ( win() ) { //1.1 Compu win?
                ode_to_joy(false,1.1,0.2,0.1); //2
                gana = true;
                text("Â¡TE GANE!",130,32);
                return;
            }
            return; // optimizaciÃ³n
        }
    }
}

void mouseClicked() { //3 react when click
  redraw();
}

