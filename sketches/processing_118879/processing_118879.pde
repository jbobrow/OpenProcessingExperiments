
// Juego del Gato, ver. 2
// Juega la Máquina: Ganar o bloquear o random
// Pdte: random: volado inicia cruz o rueda
// Pdte: agregar boton para reiniciar juego

import ddf.minim.*; //2
import ddf.minim.ugens.*; //2

Minim minim; //2
AudioOutput out; //2

float SI=233.08, DO=261.63, RE=293.66, MI=311.13, FA=349.23; //2 MI & SI BEMOL
float[] notas = {RE, RE, MI, FA, FA, MI, RE, DO, SI, SI, DO, RE, RE, DO, DO}; //2
float[]   dur = {1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.5,0.5,2.0}; //2

boolean gana = false; // end-of-game
int turno = 1; // 1=rueda, 2=cruz
int radio = 70;
int jugadas = 0; //1.3 no. jugadas

int[][] tablero = { // centro-casilla + jugador
    // cada elemento = [x,y,jugador]
    {1,1,0},{2,1,0},{3,1,0},
    {1,2,0},{2,2,0},{3,2,0},
    {1,3,0},{2,3,0},{3,3,0}};

int[][] winners = { //1.1 formas de ganar (3 indices+puntos)
    // cada elemento = [i1,i2,i3,ruedas,cruces,vacios]
    {0,1,2,0,0,-1}, {3,4,5,0,0,-1}, {6,7,8,0,0,-1}, // horizontal
    {0,3,6,0,0,-1}, {1,4,7,0,0,-1}, {2,5,8,0,0,-1}, // vertical
    {0,4,8,0,0,-1}, {2,4,6,0,0,-1}};               // diagonal

IntList vacios; //2 casillas-opción para la compu

// dibuja tablero de juego
void setup() {
  size(400,400);
  colorMode(RGB, 255);
  background(255);
  strokeWeight(4);
  line(50,150,350,150);
  line(50,250,350,250);
  line(150,50,150,350);
  line(250,50,250,350);
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

    // Si valor=true es rueda. Si valor=false es cruz.
    winners[p][5] = -1; // vacio
    for (int i=0; i<3; i++) { // each index
        switch (tablero[data[i]][2]) {
          case 1: // rueda
                ++ruedas;
                break;
          case 2: // cruz
                ++cruces;
                break;
          default: // vacio
                vacios.append(data[i]); //1.3 (bug)
                winners[p][5] = data[i]; //indice
        }
    }
    winners[p][3] = ruedas;
    winners[p][4] = cruces;
    return max(ruedas,cruces); // regresa mayor puntuación
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
        cruz(cx,cy); //1.5 false = cruz
        ++jugadas; //1.3
        tablero[i][2] = 1; // ocupado!
        turno = 2; // cambia turno
    }
    return inside;
}

boolean win() //1.1 Verifica si hay Ganador
{
    vacios = new IntList(); //2 Reset

    for (int i=0; i<winners.length; i++) { // each trazo
        if ( contar(i) == 3 ) { // tres-en-línea?
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
    if (turno==2) { //1.5 es rueda? (compu)
        int cx = tablero[i][0]*100;
        int cy = tablero[i][1]*100;
        rueda(cx,cy);
        ++jugadas; //1.3
        tablero[i][2] = 2; // ocupado! (bug)
        turno = 1; // cambia turno    
    }
}

boolean piensa_y_juega() //1.3 La compu decide su jugada
{
    for (int i=0; i<winners.length; i++) { // each trio..
        if ( ruedas(i)==2 || cruces(i)==2 ) { // casi?
            int vacio = winners[i][5];  // vacio=indice
            if ( vacio!=-1 ) { // Hay lugar?
                tiraCompu(vacio); //bloquea o gana!
                return true; // fin!
            }
        }
    }
    // escoge casilla vacia al azar
    int idx = floor(random(0,vacios.size()));  //:2
    tiraCompu(vacios.get(idx));
    return (jugadas<9); // se termino?
}

void ode_to_joy(boolean win, float factor, float v1, float v2) //2 Beethoven music
{
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  for (float vel=v1; vel>=v2; vel/=2.0) {
    float ini=0.1;
    for (int i=(win?0:notas.length-1); (win?i<notas.length:i>=0); i+=(win?1:-1)) {
      float d = dur[i]*vel;
      out.playNote(ini,d,notas[i]*factor);
      ini += d;
    }
  }
}

void draw()
{
    if ( gana || !mousePressed ) { // end-of-game: do nothing!
        return;
    }
    for (int i=0; i<tablero.length; i++) { // each cell..
        if ( casilla(i) ) { // inside?
            fill(0,100,0);
            textSize(24);
            if ( win() ) { //1.1 win?
                ode_to_joy(true,1.0,0.5,0.1); //2
                gana = true;
                text("¡GANASTE!",130,32);
                return;
            }
            if ( jugadas>=9 || !piensa_y_juega()) { //1.3 Juega Compu
                ode_to_joy(false,0.9,0.1,0.05); //2
                gana = true;
                text("¡EMPATE!",130,32); // Tablero lleno!
                return;
            }
            if ( win() ) { //1.1 Compu win?
                ode_to_joy(false,1.1,0.2,0.1); //2
                gana = true;
                text("¡TE GANE!",130,32);
                return;
            }
            return; // optimización
        }
    }
}
