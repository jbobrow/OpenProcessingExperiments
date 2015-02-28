
/*
Il Rispostiere CLM: contiene risposte a quesiti apparsi sul sito di giochi matematici "Conlemele": http://conlemele.wordpress.com/

Cliccando sulla pallina in basso a destra si passa alla modalita' "Pang", un passatempo che ha come obiettivo distruggere le palline che rimbalzano sullo schermo cliccandoci sopra.

Applet containing the answers to maths puzzles from the italian blog "Conlemele": http://conlemele.wordpress.com/". There is a little Pang-like bonus game you can activate by clicking on the bottom right ball.
*/

int n_max = 10;
int n;
float[] px; float[] py; // Centri delle palline
float[] dx; float[] dy;
int[] dim; // Dimensione (da 1 a 10)
float[] dimp; // Diametro in pixel

int ALTEZZA = 480, LARGHEZZA = 640, BORDO = 5;
int FPS = 30; // Fotogrammi al secondo

PImage Fpallina;
int colore;

PImage Fpangon;
PImage Fpangoff;

color rugiada = color(257, 240, 256);

boolean pang = false;

PFont F_faciebat;
PFont F_times;

String[] titolo_problemi;
String[] risposta_problema;
int n_problemi;
int primo_problema;
//boolean mostra_elenco;
int stato;
// Stati:
int s_mostra_elenco = 1;
int s_mostra_menu_problema = 2;
int s_mostra_risposta = 3;

int elenco_X;
int elenco_Y;
int elenco_riga;
int elenco_n;

int problema_selezionato;


void setup () {

    size(640, 480);

    colore = -1;

    px = new float[n_max];
    py = new float[n_max];
    dx = new float[n_max];
    dy = new float[n_max];
    dim = new int[n_max];
    dimp = new float[n_max];

    /* Nuova partita */
    nuova_partita();

    /* Imposta fotogrammi al secondo */
    frameRate(FPS);

    /* Importa bottoni */
    Fpangon = loadImage("f_pang_on.gif");
    Fpangoff = loadImage("f_pang_off.gif");

    primo_problema = 1;
    problema_selezionato = -1;

    F_times = loadFont("TimesNewRomanPSMT-18.vlw");
    F_faciebat = loadFont("BookAntiqua-Bold-48.vlw");

    /* L'elenco dei problemi */
    n_problemi = 72+1;
    titolo_problemi = new String[n_problemi];
    risposta_problema = new String[n_problemi];

    /* Pesca l'elenco dei problemi */
    elenco_problemi();

    elenco_X = 30; elenco_Y = 80; elenco_riga = 20; elenco_n = 15;

    /* Mostra elenco */
    stato = s_mostra_elenco;

    background(rugiada);

}

/* Disegna la cornice */
void disegna_bordo(color c) {

    fill(c); stroke(c);

    int a, b, k; a = ALTEZZA; b = LARGHEZZA; k = BORDO;

    rect(0, 0, b-k, k); // Alto
    rect(b-k, 0, a-k, b); // Destra
    rect(k, a-k, b, a-k); // Basso
    rect(0, k, k, a); // Sinistra
    
}

/* Bottone switch tra pang/rispostiere */
void disegna_pulsante() {

    if (pang == false) {
        
        image(Fpangoff,
              LARGHEZZA - 50 - BORDO, ALTEZZA - 50 - BORDO,
              50, 50);

    } else {
    
        image(Fpangon,
              LARGHEZZA - 50 - BORDO, ALTEZZA - 50 - BORDO,
              50, 50);
        
    }
    
}

void draw() {

    /* Disegna pulsante */
    disegna_pulsante();
    
    /* Bordo */
    disegna_bordo(color(0, 0, 0));

    if (pang == false) {

        if (stato == s_mostra_elenco) {

            mostra_elenco_problemi(primo_problema);

        }

        if (stato == s_mostra_menu_problema) {

            mostra_menu_problema(problema_selezionato);

        }

        if (stato == s_mostra_risposta) {

            mostra_risposta();
            
        }

    } else {
        
        /* Cancella palline */
        disegna_palline(true);

        /* Muovi palline */
        muovi_palline();

        /* Palline */
        disegna_palline(false);

    }
    
    /* Faciebat */
    textFont(F_faciebat, 18);
    textSize(18);
    fill(0); stroke(0);
    text("v. 1; JMM faciebat anno MMXII; conlemele.wordpress.com", 20, 470);

}

void mousePressed() {

    if (pang == true) {

        float raggio;

        for (int j = 0; j < n; j++) {
        
            if (dist(mouseX, mouseY, px[j], py[j])*2 <= dimp[j]) {
            
                /* Colpita! */
                spezza_pallina(j);

                /* Una pallina per click */
                j = n;

            }

        }

    } else {
        if (mouseY >= elenco_Y - elenco_riga) {
            int id;
            if (stato == s_mostra_elenco) {
                id = floor((mouseY - elenco_Y + elenco_riga) / elenco_riga) + 1;

                // Righe 1 e elenco_n+2 sono per gli scorrimenti
                if ((id > 1) && (id < elenco_n+2)) {
                    problema_selezionato = id + primo_problema - 2;
                    background(rugiada);
                    stato = s_mostra_menu_problema;
                }
                
                // Scorri
                if ((id == (elenco_n+2)) && (primo_problema+elenco_n <= n_problemi)) {
                    primo_problema+=elenco_n;
                    background(rugiada);
                }
                if ((id == 1) && (primo_problema > 1)) {
                    primo_problema-=elenco_n;
                    if (primo_problema < 1) { primo_problema = 1; }
                    background(rugiada);
                }
            } else if (stato == s_mostra_menu_problema) {
                id = floor((mouseY - elenco_Y + elenco_riga) / elenco_riga) + 1;
                if (id == 2) {
                    background(rugiada);
                    stato = s_mostra_risposta;
                }
                if (id == 3) {
                    background(rugiada);
                    stato = s_mostra_elenco;
                }
            } else if (stato == s_mostra_risposta) {
                id = floor((mouseY - elenco_Y + elenco_riga) / elenco_riga) + 1;
                if (id == 3) {
                    background(rugiada);
                    stato = s_mostra_menu_problema;
                }
            }
        }
    }

    if ((mouseX > LARGHEZZA - BORDO - 50) &&
        (mouseY > ALTEZZA - BORDO - 50)) {

        if (pang == true) {

            /* Nascondi palline */
            disegna_palline(true);

        } else {

            /* Cancella tutto */
            background(rugiada);

        }

        pang = !pang;

    }

}


/*==============
  IL RISPOSTIERE
  ==============*/

/* Carica titolo dei problemi */
void elenco_problemi() {
    
    //="titolo_problemi[" & F1 & "] = """ & A1 & """; risposta_problema[" & F1 & "] = """ & D1 & """;"    

titolo_problemi[0] = "Il prato triangolare"; risposta_problema[0] = "1200 - 20(sqrt(5) + sqrt(2) + sqrt(10)";
titolo_problemi[1] = "Chicchi di riso"; risposta_problema[1] = "n=9 e m=11";
titolo_problemi[2] = "Pane tortile"; risposta_problema[2] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[3] = "Un pentamino, apologeticamente"; risposta_problema[3] = "8";
titolo_problemi[4] = "Seminata intermittente"; risposta_problema[4] = "16 gettoni in una 16 per 3";
titolo_problemi[5] = "Una capriola acrobatica"; risposta_problema[5] = "pi^2";
titolo_problemi[6] = "Omini di Pampepato"; risposta_problema[6] = "5430";
titolo_problemi[7] = "Il prato con una sola radice"; risposta_problema[7] = "no";
titolo_problemi[8] = "Traversata con piccioni"; risposta_problema[8] = "nil";
titolo_problemi[9] = "Con le mele e con le pere"; risposta_problema[9] = "3";
titolo_problemi[10] = "Halloween ai cuberdon"; risposta_problema[10] = "42";
titolo_problemi[11] = "Bruxelles 2011 (1) - Tre camere di albergo"; risposta_problema[11] = "225";
titolo_problemi[12] = "Bruxelles 2011 (2) - Un dipinto di Vantongerloo"; risposta_problema[12] = "1440^2";
titolo_problemi[13] = "Bruxelles 2011 (3) - Divertissement 1-3"; risposta_problema[13] = "1/4,3/8,(3-2/sqrt(2))/3";
titolo_problemi[14] = "Bruxelles 2011 (4) - Piastrellatura con domini"; risposta_problema[14] = "41/39";
titolo_problemi[15] = "Bruxelles 2011 (5) - Divertissement 4-6"; risposta_problema[15] = "8r/pi";
titolo_problemi[16] = "10 1 e Distanza in un albero"; risposta_problema[16] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[17] = "Bruxelles 2011 (6) - L'Uomo Ragno sull'Atomium"; risposta_problema[17] = "80/7";
titolo_problemi[18] = "La pentola e l'insalatiera"; risposta_problema[18] = "10";
titolo_problemi[19] = "Sezioni di sciarpe"; risposta_problema[19] = "144";
titolo_problemi[20] = "Libri d'occasione"; risposta_problema[20] = "260610";
titolo_problemi[21] = "La vasca distruttrice"; risposta_problema[21] = "34";
titolo_problemi[22] = "RaddoppiaSerpenti (+ gioco Java)"; risposta_problema[22] = "255";
titolo_problemi[23] = "Uno"; risposta_problema[23] = "nil";
titolo_problemi[24] = "Cubetti Ruota e Blocca"; risposta_problema[24] = "259200";
titolo_problemi[25] = "Complicato egalitarismo"; risposta_problema[25] = "11/32 > 1/3";
titolo_problemi[26] = "Brucia brucia la candela"; risposta_problema[26] = "7/26";
titolo_problemi[27] = "Ricordando NIPS 2010"; risposta_problema[27] = "1/2 e 1/5";
titolo_problemi[28] = "Corridoio unico visivo"; risposta_problema[28] = "27000";
titolo_problemi[29] = "London 2011 - Divertissement 7-10"; risposta_problema[29] = "pi/(4 - pi), pi/(4 - pi), (r^2)/4 (pi - 2/9), 1 + 2/3";
titolo_problemi[30] = "Composizione"; risposta_problema[30] = "nil";
titolo_problemi[31] = "Il bicchiere sospeso"; risposta_problema[31] = "4 * pi + 6 * sqrt(3)";
titolo_problemi[32] = "La strada di mattonelle gialle"; risposta_problema[32] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[33] = "Presepe minimalista"; risposta_problema[33] = "nil";
titolo_problemi[34] = "Girotondo di cerchi 1 - da divertissement a ..."; risposta_problema[34] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[35] = "Girotondo di cerchi 2 - l'ottaedro di corda"; risposta_problema[35] = "I due grafi sono equivalenti";
titolo_problemi[36] = "Futuro"; risposta_problema[36] = "nil";
titolo_problemi[37] = "Girotondo di cerchi 3 - Semplificare"; risposta_problema[37] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[38] = "Girotondo di cerchi 4 - Monete"; risposta_problema[38] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[39] = "La biglia azzurra"; risposta_problema[39] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[40] = "Corsa in metro"; risposta_problema[40] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[41] = "Barrette in scatola"; risposta_problema[41] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[42] = "Quasi Origami"; risposta_problema[42] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[43] = "Amore per il caffe'"; risposta_problema[43] = "nil";
titolo_problemi[44] = "Non-e'-vero"; risposta_problema[44] = "nil";
titolo_problemi[45] = "Fagioli in una giara"; risposta_problema[45] = "nil";
titolo_problemi[46] = "Amore per il caffe' 2"; risposta_problema[46] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[47] = "Spirale di sfere"; risposta_problema[47] = "nil";
titolo_problemi[48] = "La corsa sul tavolo"; risposta_problema[48] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[49] = "Ante di un armadio"; risposta_problema[49] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[50] = "Tempus fugit"; risposta_problema[50] = "(97485)_(10) = (276315)_8";
titolo_problemi[51] = "Da un cerchio di carta ad un tetraedro"; risposta_problema[51] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[52] = "Gioco del 17"; risposta_problema[52] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[53] = "La cravatta giusta"; risposta_problema[53] = "9";
titolo_problemi[54] = "SC1"; risposta_problema[54] = "nil";
titolo_problemi[55] = "ORA"; risposta_problema[55] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[56] = "Mimetismo integrale"; risposta_problema[56] = "nil";
titolo_problemi[57] = "Quindici noci"; risposta_problema[57] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[58] = "Archi a sesto acuto"; risposta_problema[58] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[59] = "Haiku matematico"; risposta_problema[59] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[60] = "Pentagono approssimato"; risposta_problema[60] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[61] = "Cinque commissioni con quattro esaminatori"; risposta_problema[61] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[62] = "Aleph e Zahir"; risposta_problema[62] = "nil";
titolo_problemi[63] = "Il dado del Sahkku"; risposta_problema[63] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[64] = "Nel cortile di Palazzo Carignano"; risposta_problema[64] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[65] = "Eukleides in italiano"; risposta_problema[65] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[66] = "Numero medio di lanci di un dado a 6 facce"; risposta_problema[66] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[67] = "Tre tori contro tre tori"; risposta_problema[67] = "nil";
titolo_problemi[68] = "Quadrilatero di superficie costante"; risposta_problema[68] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[69] = "Sextopus"; risposta_problema[69] = "Si puo' fare";
titolo_problemi[70] = "Multe arbitrarie"; risposta_problema[70] = "mancante: sollecita jean.morales@tiscali.it";
titolo_problemi[71] = "Collettivo Ludolinguistico Matematico"; risposta_problema[71] = "nil";
titolo_problemi[72] = "Il Rispostiere CLM"; risposta_problema[72] = "10";
    
}

/* Menu del problema n */
void mostra_menu_problema(int n) {

    textFont(F_times, 18);
    textSize(18); fill(0); stroke(0);
    text(titolo_problemi[n-1], elenco_X, elenco_Y);
    text(" - risposta", elenco_X, elenco_Y + elenco_riga);
    text(" - ritorna", elenco_X, elenco_Y + 2*elenco_riga);

}

void mostra_risposta() {
    textFont(F_times, 18);
    textSize(18); fill(0); stroke(0);
    text(titolo_problemi[problema_selezionato-1], elenco_X, elenco_Y);
    text(risposta_problema[problema_selezionato-1], elenco_X, elenco_Y + elenco_riga);
    text(" - ritorna", elenco_X, elenco_Y + 2*elenco_riga);

}

/* Mostra problemi a partire dal numero n (parte da 1) */
void mostra_elenco_problemi(int n) {

    textSize(22);
    textFont(F_times, 22);
    
    fill(0); stroke(0);
    text("Il Rispostiere CLM", elenco_X, (int)(elenco_Y/2));

    
    textSize(18);
    textFont(F_times, 18);
    //    fill(0); stroke(0);

    /* Possibilita' di salire */
    if (n > 1) { text("  << sali", elenco_X, elenco_Y); }

    /* Possibilita' di scendere */
    if (n + elenco_n - 1 < n_problemi) {
        text("  >> scendi", elenco_X, elenco_Y + elenco_riga * (1+elenco_n)); }
    
    for (int j = 0; j < elenco_n; j++) {
        if (j + n - 1 < n_problemi) {
            if (risposta_problema[j+n-1] == "mancante: sollecita jean.morales@tiscali.it") {
            fill(192, 192, 192);
            } else {
                fill(0);
            }
            text(titolo_problemi[j+n-1], elenco_X, elenco_Y + elenco_riga*(j+1));
        }
    }
    
}

/*====
  PANG
  ====*/
/* Controlla se la pallina indice ne ha toccata un'altra
   con indice superiore */
void verifica_collisioni(int indice) {

    for (int j = (indice+1); j < n; j++) {

        if (dist(px[indice], py[indice], px[j],py[j])*2 <
            dimp[indice] + dimp[j]) {

            /* La distanza tra i centri delle palline indice e j
               e' minore della somma dei raggi, quindi le uniamo */
            px[indice] = (px[indice] + px[j])/2;
            py[indice] = (py[indice] + py[j])/2;
            dim[indice] += dim[j];
            dimp[indice] = map(dim[indice], 1, 10, 23, 89);

            float delta = ALTEZZA /
                (FPS * map(dim[indice], 1, 10, 2, 5));
            
            /* Direzione iniziale casuale */
            float angolo = random(TWO_PI);

            dx[indice] = delta * cos(angolo);
            dy[indice] = delta * sin(angolo);

            /* Per non lasciare buchi, rimpiazza j con n-1 */
            if (j < (n-1)) {
                px[j] = px[n-1];
                py[j] = py[n-1];
                dx[j] = dx[n-1];
                dy[j] = dy[n-1];
                dim[j] = dim[n-1];
                dimp[j] = dimp[n-1];
                j--; // Continua la verifica dallo stesso j
            }
            
            n--;
            
        }

    }

}

/* Aggiorna la posizione delle palline */
void muovi_palline() {

    float raggio;

    for (int j = 0; j < n; j++) {

        /* Spostamento */
        px[j] += dx[j]; py[j] += dy[j];

        /* Verifica collisioni */
        if (j < n)
            verifica_collisioni(j);

        /* Calcola il raggio */
        raggio = dimp[j] / 2;

        /* Verifica rimbalzi */
        if (px[j] > LARGHEZZA - raggio - BORDO) {
            dx[j] = -dx[j];
            px[j] = LARGHEZZA - raggio - BORDO;
        }
        if (px[j] < BORDO + raggio) {
            dx[j] = -dx[j];
            px[j] = BORDO + raggio;
        }
        if (py[j] > ALTEZZA - raggio - BORDO) {
            dy[j] = -dy[j];
            py[j] = ALTEZZA - raggio - BORDO;
        }
        if (py[j] < BORDO + raggio) {
            dy[j] = -dy[j];
            py[j] = BORDO + raggio;
        }

    }

}

/* Disegna le palline */
void disegna_palline(boolean cancella) {

    float sfasa;

    for (int j = 0; j < n; j++) {

        /* Sfasamento */
        sfasa = dimp[j] / 2;

        if (cancella == true) {

            ellipseMode(CORNER);

            stroke(rugiada);
            fill(rugiada);

            /* Cancella la pallina */
            ellipse((int)(px[j] - sfasa - 1),
                    (int)(py[j] - sfasa - 1),
                    dimp[j] + 2, dimp[j] + 2);

        } else {

            /* Disegna la pallina */
            image(Fpallina,
                  (int)(px[j] - sfasa), (int)(py[j] - sfasa),
                  dimp[j], dimp[j]);

        }

    }
    
}

/* Una pallina sola, al centro, direzione/colore casuale*/
void nuova_partita() {
    
    /* Una pallina sola */
    n = 1;

    /* Posizione centrale */
    px[0] = (int)(LARGHEZZA/2);
    py[0] = (int)(ALTEZZA/2);

    /* Delta per una pallina di dim 10: percorre l'intera
       altezza in circa 5 secondi */
    float delta = ALTEZZA / (FPS * 5);

    /* Direzione iniziale casuale */
    float angolo = random(TWO_PI);

    dx[0] = delta * cos(angolo);
    dy[0] = delta * sin(angolo);

    /* Dimensione 10 */
    dim[0] = 10;
    dimp[0] = map(10, 1, 10, 23, 89);

    /* Cambia colore */
    int col = floor(random(4));
    while (col == colore) { col = floor(random(4)); } colore = col;

    switch(col) {
    case 0: Fpallina = loadImage("pallina_r.gif"); break;
    case 1: Fpallina = loadImage("pallina_g.gif"); break;
    case 2: Fpallina = loadImage("pallina_v.gif"); break;
    case 3: Fpallina = loadImage("pallina_b.gif"); break;
    }
    
}

/* Spezza la pallina indice, aggiornando la direzione */
void spezza_pallina(int indice) {

    /* Cancella palline */
    disegna_palline(true);

    if (dim[indice] <= 2) {

        if (n > 1) {
            /* Rimpiazza indice con n-1 */
            dim[indice] = dim[n-1];
            dimp[indice] = dimp[n-1];
            px[indice] = px[n-1];
            py[indice] = py[n-1];
            dx[indice] = dx[n-1];
            dy[indice] = dy[n-1];
        }
            
        /* Una pallina in meno */
        n--;

        /* Lasciagli qualcosa da fare */
        if (n == 0) nuova_partita();
        
    } else {

        int a, b;

        if ((dim[indice] % 2) == 1) { // Dispari

            a = (dim[indice]-1)/2;
            b = (dim[indice]+1)/2;

        } else { // Pari

            a = dim[indice]/2;
            b = a;
            
        }

        dim[indice] = a; dim[n] = b;
        
        dimp[indice] = map(a, 1, 10, 23, 89);
        dimp[n] = map(b, 1, 10, 23, 89);

        float angolo, delta_a, delta_b, raggio;
        float vecchio_x, vecchio_y;

        vecchio_x = px[indice];
        vecchio_y = py[indice];

        /* Nuova posizione e velocita' per la prima pallina*/
        float den = dx[indice];
        if (den >= 0) {
            den = max(den, 0.01);
        } else {
            den = min(den, -0.01);
        }
        angolo = atan(dy[indice] / den);

        delta_a = ALTEZZA / (FPS * map(dim[indice], 1, 10, 2, 5));

        dx[indice] = delta_a * cos(angolo + QUARTER_PI);
        dy[indice] = delta_a * sin(angolo + QUARTER_PI);

        raggio = dimp[indice]/2;
        
        px[indice] = vecchio_x + dx[indice] * raggio/delta_a;
        py[indice] = vecchio_y + dy[indice] * raggio/delta_a;

        /* Per la seconda */
        delta_b = ALTEZZA / (FPS * map(dim[n], 1, 10, 2, 5));

        dx[n] = -dx[indice]*delta_a/delta_b;
        dy[n] = -dy[indice]*delta_a/delta_b;

        raggio = dimp[n]/2;
        
        px[n] = vecchio_x + dx[n] * raggio/delta_b;
        py[n] = vecchio_y + dy[n] * raggio/delta_b;

        /* Una pallina in piu' */
        n++;

    }

}

