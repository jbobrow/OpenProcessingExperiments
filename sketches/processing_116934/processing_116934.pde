
var turno = false; // true=rueda, false=cruz
var gana = false; // end-of-game
var radio = 70;
var jugadas = 0; //1.3 no. jugadas
 
var tablero = [ // centro-casilla + jugador
    // cada elemento = [x,y,jugador]
    {x:1,y:1,t:null},{x:2,y:1,t:null},{x:3,y:1,t:null},
    {x:1,y:2,t:null},{x:2,y:2,t:null},{x:3,y:2,t:null},
    {x:1,y:3,t:null},{x:2,y:3,t:null},{x:3,y:3,t:null}];
 
var winners = [ //1.1 formas de ganar (3 indices+puntos)
    // cada elemento = [i1,i2,i3,ruedas,cruces,vacios]
    [0,1,2,0,0,0], [3,4,5,0,0,0], [6,7,8,0,0,0], // horizontal
    [0,3,6,0,0,0], [1,4,7,0,0,0], [2,5,8,0,0,0], // vertical
    [0,4,8,0,0,0], [2,4,6,0,0,0]];               // diagonal
 
var vacios = []; //1.3 casillas-opción para la compu
 
void setup() {  //setup function called initially, only once
    colorMode(RGB, 255);
    size(400,400);
    background(255);
    smooth();
    strokeWeight(4); // dibuja tablero de juego
    line(50,150,350,150);
    line(50,250,350,250);
    line(150,50,150,350);
    line(250,50,250,350);
}
 
 
void cruz(cx, cy)
{
    var r = radio / 2;
    stroke(220,0,70);
    line(cx-r,cy-r,cx+r,cy+r);
    line(cx-r,cy+r,cx+r,cy-r);
}
 
 
void rueda(cx, cy)
{
    noFill(); stroke(30,0,220);
    ellipse(cx,cy,radio,radio);
}
 
 
int contar(p) //1.2 Calcula contadores para trazo p
{
    var data = winners[p]; // trazo ganador
    var ruedas = 0; // Contador ruedas (true)
    var cruces = 0; // Contador cruces (false)
 
    // Si valor=true es rueda. Si valor=false es cruz.
    winners[p][5] = null; // clear vacio
    for (var i=0; i<3; i++) { // each index
        var valor = tablero[data[i]].t;
        if ( valor===true ) { // valor?
                ++ruedas;
        } else if ( valor===false ) {
                ++cruces;
        } else { //null
                append(vacios,data[i]); //1.3 (bug)
                winners[p][5] = data[i]; //indice
        }
    }
    winners[p][3] = ruedas;
    winners[p][4] = cruces;
    return max(ruedas,cruces); // regresa mayor puntuación
}
 
int ruedas(p) { return winners[p][3]; } //1.3
 
int cruces(p) { return winners[p][4]; } //1.3
 
boolean casilla( i ) // Dentro de casilla? Dibuja jugador y cambio de turno
{
    var celda = tablero[i];
    var cx = celda.x*100;
    var cy = celda.y*100;
    var sel = celda.t;
    var inside = mouseX>=cx-45 && mouseX<=cx+45 && mouseY>=cy-45 && mouseY<=cy+45;
 
    if (inside && sel===null) {
        cruz(cx,cy); //1.5 false = cruz
        ++jugadas; //1.3
        tablero[i].t = turno; // ocupado!
        turno = !turno; // cambia turno
    }
    return inside;
}
 
 
boolean win() //1.1 Verifica si hay Ganador
{
    vacios = []; //1.3
 
    for (var i=0; i<winners.length; i++) { // each trazo
        if ( contar(i) === 3 ) { // tres-en-línea?
            var ini = tablero[winners[i][0]]; // pos. inicial
            var fin = tablero[winners[i][2]]; // pos. final
            stroke(100,100,0,100);
            strokeWeight(radio/2);
            line(ini.x*100,ini.y*100,fin.x*100,fin.y*100);
            return true; // win!
        }
    }
    return false; // not yet
}
 
void tiraCompu( i ) //1.3 Dibuja rueda
{
    if (turno===true) { //1.5 es rueda? (compu)
        var cx = tablero[i].x*100;
        var cy = tablero[i].y*100;
        rueda(cx,cy);
        ++jugadas; //1.3
        tablero[i].t = turno; // ocupado! (bug)
        turno = !turno; // cambia turno   
    }
}
 
boolean piensa_y_juega() //1.3 La compu decide su jugada
{
    for (var i=0; i<winners.length; i++) { // each trio..
        if ( ruedas(i)===2 || cruces(i)===2 ) { // casi?
            var vacio = winners[i][5];  // vacio=indice
            if ( vacio!==null ) { // Hay lugar?
                tiraCompu(vacio); //bloquea o gana!
                return true; // fin!
            }
        }
    }
    // escoge casilla vacia al azar
    var idx = floor(random(0,vacios.length));
    tiraCompu(vacios[idx]);
    return (jugadas<9); // se termino?
}
 
void mouseClicked()
{
    if ( gana ) { // end-of-game: do nothing!
        return;
    }
    for (var i=0; i<tablero.length; i++) { // each cell..
        if ( casilla(i) ) { // inside?
            fill(0,100,0);
            textSize(24);
            if ( win() ) { //1.1 win?
                text("¡GANASTE!",130,32);
                gana = true;
                return;
            }
            if ( jugadas>=9 || !piensa_y_juega()) { //1.3 Juega Compu
                text("¡EMPATE!",130,32); // Tablero lleno!
                gana = true;
                return;
            }
            if ( win() ) { //1.1 Compu win?
                text("¡TE GANE!",130,32);
                gana = true;
                return;
            }
            return; // optimización
        }
    }
}
