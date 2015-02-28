
//Sketch ambientat en un tauler d'escacs en el qual els dos reis són les
//úniques figures restants i es persegueixen infinitament

//Mida de les caselles del tauler
int midaQuadrat = 50;
//Posició de la primera casella
int posInicialX = 100;
int posInicialY = 100;
//Posicions inicials dels dos reis
int reiNegreX = 175;
int reiNegreY = 225;
int reiBlancX = 175;
int reiBlancY = 275;
//Tipus de moviments dels reis
boolean pujarNegre = true;
boolean pujarBlanc = true;
boolean baixarNegre = false;
boolean baixarBlanc = false;
boolean dretaNegre = false;
boolean dretaBlanc = false;
boolean esquerraNegre = false;
boolean esquerraBlanc = false;
boolean diagonalPENegre = false;
boolean diagonalPEBlanc = false;
boolean diagonalBDNegre = false;
boolean diagonalBDBlanc = false;
boolean diagonalBENegre = false;
boolean diagonalBEBlanc = false;
//Intercambiador entre rei negre i rei blanc que a més funciona com a
//iniciador del moviment perquè aquest coincideixi amb la tornada de la
//cançó
int reis = 1;
//Impressor de textos aleatoris per pantalla davant l'interacció de
//l'usuari
boolean missatge = false;
//Selector de missatge aleatori; varia el seu valor per cada clic
int selector;
//Variables per a la importació de la cançó
import ddf.minim.*;
AudioPlayer player;
Minim minim;

void setup() {
  size(600,600);
  //Cançó de Benny Hill, ideal per a una persecució còmica sense final
  minim = new Minim(this);
  player = minim.loadFile("Benny Hill Theme.mp3");
  player.play();
}
void draw() {
  //Col·loquem aquí el fons per esborrar els textos quan toqui
  background(#602010);
  //Baix frameRate per apreciar cada moviment dels reis
  frameRate(6);
  //Dibuix de les caselles del tauler
  strokeWeight(1);
  stroke(#000000);
  while (posInicialY < height - (midaQuadrat * 2)) {
    for (int fila = 1; fila <= 8; fila++) {
      for (int columna = 1; columna <= 8; columna++) {
        if ((columna + fila) % 2 == 0) {
          fill(#FFFFFF);
        }
        else {
          fill(#000000);
        }
        rect(posInicialX,posInicialY,midaQuadrat,midaQuadrat);
        posInicialX = posInicialX + midaQuadrat;
      }
      posInicialY = posInicialY + midaQuadrat;
      posInicialX = 100;
    } 
  }
  //Text introductori
  textSize(20);
  if (reis <= 24 && reis >= 1) {
    text("ARA JA NOMÉS QUEDEM TU I JO, REI...",118,60);
  }
  //Text aleatori degut a la interacció de l'usuari
  if (reis > 24 && missatge) {
    if (selector == 1) {
      text("No ens espatllis la partida! Encara pot guanyar un dels dos",15,60);
    }
    if (selector == 2) {
      text("Deixa'ns jugar! Tenim tot el dia per decidir vencedor...",45,60);
    }
    if (selector == 3) {
      text("Espera el teu torn per jugar! Encara no hem acabat",60,60);
    }
  }
  //Rey negre
  strokeWeight(2);
  stroke(#404040);
  fill(#1A1A1A);
  rect(reiNegreX - 15,reiNegreY - 2,30,22);
  bezier(reiNegreX - 15,reiNegreY + 20,reiNegreX - 28,reiNegreY + 10,reiNegreX - 15,reiNegreY - 10,reiNegreX - 4,reiNegreY - 4);
  bezier(reiNegreX + 15,reiNegreY + 20, reiNegreX + 28,reiNegreY + 10,reiNegreX + 15,reiNegreY - 10,reiNegreX + 4,reiNegreY - 4);
  rect(reiNegreX - 4,reiNegreY - 4,8,24);
  beginShape();
    vertex(reiNegreX - 2,reiNegreY - 4);
    vertex(reiNegreX + 2,reiNegreY - 4);
    vertex(reiNegreX + 2,reiNegreY - 8);
    vertex(reiNegreX + 6,reiNegreY - 8);
    vertex(reiNegreX + 6,reiNegreY - 12);
    vertex(reiNegreX + 2,reiNegreY - 12);
    vertex(reiNegreX + 2,reiNegreY - 16);
    vertex(reiNegreX - 2,reiNegreY - 16);
    vertex(reiNegreX - 2,reiNegreY - 12);
    vertex(reiNegreX - 6,reiNegreY - 12);
    vertex(reiNegreX - 6,reiNegreY - 8);
    vertex(reiNegreX - 2,reiNegreY - 8);
    vertex(reiNegreX - 2,reiNegreY - 4);
  endShape();
  //Rey blanc
  fill(#E2E2E2);
  rect(reiBlancX - 15,reiBlancY - 2,30,22);
  bezier(reiBlancX - 15,reiBlancY + 20,reiBlancX - 28,reiBlancY + 10,reiBlancX - 15,reiBlancY - 10,reiBlancX - 4,reiBlancY - 4);
  bezier(reiBlancX + 15,reiBlancY + 20, reiBlancX + 28,reiBlancY + 10,reiBlancX + 15,reiBlancY - 10,reiBlancX + 4,reiBlancY - 4);
  rect(reiBlancX - 4,reiBlancY - 4,8,24);
  beginShape();
    vertex(reiBlancX - 2,reiBlancY - 4);
    vertex(reiBlancX + 2,reiBlancY - 4);
    vertex(reiBlancX + 2,reiBlancY - 8);
    vertex(reiBlancX + 6,reiBlancY - 8);
    vertex(reiBlancX + 6,reiBlancY - 12);
    vertex(reiBlancX + 2,reiBlancY - 12);
    vertex(reiBlancX + 2,reiBlancY - 16);
    vertex(reiBlancX - 2,reiBlancY - 16);
    vertex(reiBlancX - 2,reiBlancY - 12);
    vertex(reiBlancX - 6,reiBlancY - 12);
    vertex(reiBlancX - 6,reiBlancY - 8);
    vertex(reiBlancX - 2,reiBlancY - 8);
    vertex(reiBlancX - 2,reiBlancY - 4);
  endShape();
  //Quan l'acumulador "reis" supera el valor 24 (després de 4 segons), s'inicia
  //el moviment coincidint amb la tornada de la cançó
  if (reis > 24) {
    //MOVIMENTS DEL REI NEGRE
  //Pujar
    if (pujarNegre && (reis % 2) == 1) {
      reiNegreY = reiNegreY - midaQuadrat;
      if (reiNegreY == 125) {
        pujarNegre = false;
        dretaNegre = true;
      }
      if (reiNegreY == 325) {
        pujarNegre = false;
        diagonalPENegre = true;
      }
    }
    //Dreta
    else if (dretaNegre && (reis % 2) == 1) {
      reiNegreX = reiNegreX + midaQuadrat;
      if (reiNegreX == 325) {
        dretaNegre = false;
        baixarNegre = true;
      }
      if (reiNegreX == 375) {
        dretaNegre = false;
        diagonalBDNegre = true;
      }
    }
    //Baixar
    else if (baixarNegre && (reis % 2) == 1) {
      reiNegreY = reiNegreY + midaQuadrat;
      if (reiNegreY == 225) {
        baixarNegre = false;
        dretaNegre = true;
      }
      if (reiNegreY == 425) {
        baixarNegre = false;
        esquerraNegre = true;
      }
    }
    //Diagonal baixant cap a la dreta
    else if (diagonalBDNegre && (reis % 2) == 1) {
      reiNegreX = reiNegreX + midaQuadrat;
      reiNegreY = reiNegreY + midaQuadrat;
      if (reiNegreX == 425) {
        diagonalBDNegre = false;
        diagonalBENegre = true;
      }
    }
    //Diagonal baixant cap a l'esquerra
    else if (diagonalBENegre && (reis % 2) == 1) {
      reiNegreX = reiNegreX - midaQuadrat;
      reiNegreY = reiNegreY + midaQuadrat;
      if (reiNegreX == 375) {
        diagonalBENegre = false;
        esquerraNegre = true;
      }
    }
    //Esquerra
    else if (esquerraNegre && (reis % 2) == 1) {
      reiNegreX = reiNegreX - midaQuadrat;
      if (reiNegreX == 325) {
        esquerraNegre = false;
        baixarNegre = true;
      }
      if (reiNegreX == 225) {
        esquerraNegre = false;
        pujarNegre = true;
      }
    }
    //Diagonal pujant cap a l'esquerra
    else if (diagonalPENegre && (reis % 2) == 1) {
      reiNegreX = reiNegreX - midaQuadrat;
      reiNegreY = reiNegreY - midaQuadrat;
      if (reiNegreY == 275) {
        diagonalPENegre = false;
        pujarNegre = true;
      }
    }
    //MOVIMENTS DEL REI BLANC
    //Pujar
    if (pujarBlanc && (reis % 2) == 0) {
      reiBlancY = reiBlancY - midaQuadrat;
      if (reiBlancY == 125) {
        pujarBlanc = false;
        dretaBlanc = true;
      }
      if (reiBlancY == 325) {
        pujarBlanc = false;
        diagonalPEBlanc = true;
      }
    }
    //Dreta
    else if (dretaBlanc && (reis % 2) == 0) {
      reiBlancX = reiBlancX + midaQuadrat;
      if (reiBlancX == 325) {
        dretaBlanc = false;
        baixarBlanc = true;
      }
      if (reiBlancX == 375) {
        dretaBlanc = false;
        diagonalBDBlanc = true;
      }
    }
    //Baixar
    else if (baixarBlanc && (reis % 2) == 0) {
      reiBlancY = reiBlancY + midaQuadrat;
      if (reiBlancY == 225) {
        baixarBlanc = false;
        dretaBlanc = true;
      }
      if (reiBlancY == 425) {
        baixarBlanc = false;
        esquerraBlanc = true;
      }
    }
    //Diagonal baixant cap a la dreta
    else if (diagonalBDBlanc && (reis % 2) == 0) {
      reiBlancX = reiBlancX + midaQuadrat;
      reiBlancY = reiBlancY + midaQuadrat;
      if (reiBlancX == 425) {
        diagonalBDBlanc = false;
        diagonalBEBlanc = true;
      }
    }
    //Diagonal baixant cap a l'esquerra
    else if (diagonalBEBlanc && (reis % 2) == 0) {
      reiBlancX = reiBlancX - midaQuadrat;
      reiBlancY = reiBlancY + midaQuadrat;
      if (reiBlancX == 375) {
        diagonalBEBlanc = false;
        esquerraBlanc = true;
      }
    }
    //Esquerra
    else if (esquerraBlanc && (reis % 2) == 0) {
      reiBlancX = reiBlancX - midaQuadrat;
      if (reiBlancX == 325) {
        esquerraBlanc = false;
        baixarBlanc = true;
      }
      if (reiBlancX == 225) {
        esquerraBlanc = false;
        pujarBlanc = true;
      }
    }
    //Diagonal pujant cap a l'esquerra
    else if (diagonalPEBlanc && (reis % 2) == 0) {
      reiBlancX = reiBlancX - midaQuadrat;
      reiBlancY = reiBlancY - midaQuadrat;
      if (reiBlancY == 275) {
        diagonalPEBlanc = false;
        pujarBlanc = true;
      }
    }
  }  
  //Reiniciem els valors de les caselles per tornarles a dibuixar i evitar
  //que s'imprimeixin més de dos reis per pantalla
  posInicialX = 100;
  posInicialY = 100;
  //A cada cicle canviem entre un rei i un altra per recrear el moviment per
  //torns i la sensació de persecució
  reis = reis + 1;
}

//Quan l'usuari clica sobre el sketch, un missatge graciós apareix
void mousePressed() {
  missatge = true;
  //El màxim valor ha de ser "4" perquè també inclogui el "3"
  selector = int(random(1,4));
}

//Al deixar de prémer el ratolí, el missatge desapareix
void mouseReleased() {
  missatge = false;
}

//Un cop acabi la cançó, aturem el reproductor perquè no soni més
void stop(){ 
  player.close();
  minim.stop();
  super.stop();
}

//PD: Ja sé que en algun moment la blanca podria haver matat el rei negre,
//però la gracia es troba en la imitació de moviments, de manera que mai
//s'arribin a agafar

