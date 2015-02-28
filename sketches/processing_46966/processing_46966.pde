
// Costanti globali
int FOTOGRAMMI = 30;

int TESTA = 12; // Diametro della testa
int SCATTI = 6; // Nro di scatti per muoversi di una testa

// 40 teste: 2 meta` per il bodo e 1 per il testo
int ALTEZZA = -1; //40 * TESTA;

// 636 pixels
int LARGHEZZA = -1; // 53 * TESTA;

int N_SEGMENTI = 100*SCATTI;
int N_SERPENTI = 4;

int RAGGIO_CATTURA = 5;

// Colori
color bordeaux = color(192, 64, 0);
color rugiada = color(257, 240, 256);
color ametista = color(64, 0, 20);
color rosa = color(255, 80, 80);
color giallo = color(255, 225, 24);
color blu = color(82, 145, 239);

// Colore del bordo
color c_bordo = color(0, 0, 0);

// Variabili globali
boolean interruzione;
boolean partita_finita;
boolean mostra_punteggio;
boolean mostra_inizio;
boolean cancella_scritte;
int punteggio;

/* Coordinate dei centri per ogni serpente, per ogni segmento */
float[][] centri_x;
float[][] centri_y;

/* Coordinate per la nuova posizione della testa */
float[] nuovo_centro_x;
float[] nuovo_centro_y;

/* Lunghezza del serpente i-esimo */
int[] lunghezza;

float ultimo_mouse_x;
float ultimo_mouse_y;
int conta_frame;

float delta_mouse_x;
float delta_mouse_y;

/* Accelerazione */
float massima_accelerazione = 4;
float accelerazione = 1;

/* Situazioni di gioco:
   1 - schermata iniziale
   2 - regole
   3 - partita
   4 - fine partita
 */
int situazione_gioco = 1;

PImage RDregole;
PImage RDtitolo;

void configurazione_iniziale() {

    /* Posizione iniziale dei serpenti */
    for (int i = 0; i < N_SEGMENTI; i++) {

        /* Primo serpente in alto a destra */
        centri_x[0][i] = LARGHEZZA - 5 * TESTA;
        centri_y[0][i] = 5 * TESTA;

        /* Secondo serpente in alto a sinistra */
        centri_x[1][i] = 5 * TESTA;
        centri_y[1][i] = 5 * TESTA;

        /* Terzo serpente in basso a sinistra */
        centri_x[2][i] = 5 * TESTA;
        centri_y[2][i] = ALTEZZA - 5 * TESTA;

        /* Quarto serpente in basso a sinistra */
        centri_x[3][i] = LARGHEZZA - 5 * TESTA;
        centri_y[3][i] = ALTEZZA - 5 * TESTA;

    }

    /* Lunghezze iniziali dei serpenti (crescenti) */
    for (int i = 0; i < N_SERPENTI; i++) {
        lunghezza[i] = (2*i+3) * SCATTI;
    }

    /* Moti iniziali */
    nuovo_centro_x[0] = centri_x[0][0] - TESTA/SCATTI; // verso sinistra
    nuovo_centro_y[0] = centri_y[0][0];

    nuovo_centro_x[1] = centri_x[1][0];
    nuovo_centro_y[1] = centri_y[1][0] + TESTA/SCATTI; // verso il basso

    nuovo_centro_x[2] = centri_x[2][0] + TESTA/SCATTI; // verso destra
    nuovo_centro_y[2] = centri_y[2][0];

    nuovo_centro_x[3] = centri_x[3][0];
    nuovo_centro_y[3] = centri_y[3][0] - TESTA/SCATTI; // verso l'alto

}

void setup () {

    size(636, 480);

    LARGHEZZA = 636; ALTEZZA = 480;
    
    RDregole = loadImage("RDregole.png");
    RDtitolo = loadImage("RDtitolo.png");

    partita_finita = true;
    interruzione = true;
    mostra_punteggio = false;
    mostra_inizio = true;
    cancella_scritte = false;
    punteggio = 0;

    stroke(255);

    frameRate(FOTOGRAMMI);

    /* Alloca centri */
    centri_x = new float[N_SERPENTI][N_SEGMENTI];
    centri_y = new float[N_SERPENTI][N_SEGMENTI];

    /* Alloca lunghezze, visibili e totale, dei serpenti */
    lunghezza = new int[N_SERPENTI];

    /* Alloca moti */
    nuovo_centro_x = new float[N_SERPENTI];
    nuovo_centro_y = new float[N_SERPENTI];

    /* Sfondo */
    background(rugiada);

    noStroke();

    configurazione_iniziale();

    textFont(loadFont("BookAntiqua-Bold-48.vlw"));

    ultimo_mouse_x = mouseX;
    ultimo_mouse_y = mouseY;
    conta_frame = 0;

}

/* Disegna il bordo del campo */
void disegna_bordo(color c) {

    fill(c); stroke(c);

    /* Bordo in alto, con spazio per la scritta */
    rect(0, 0, LARGHEZZA - TESTA/2, TESTA*3/2);

    /* Bordo in basso */
    rect(TESTA/2, ALTEZZA - TESTA/2, LARGHEZZA, ALTEZZA);

    /* Bordo a destra */
    rect(LARGHEZZA - TESTA/2, 0, LARGHEZZA, ALTEZZA - TESTA/2);

    /* Bordo a sinistra */
    rect(0, TESTA/2, TESTA/2, ALTEZZA - TESTA/2);
    
}

/* Disegna il serpente j-esimo col colore c */
void disegna_serpente(int j, color c) {

    color sbiadito = rugiada;

    /* Il corpo del serpente e` in colore sbiadito */
    if (c != rugiada) {
        sbiadito = blendColor(c, rugiada, OVERLAY);
    }

    stroke(sbiadito); fill(sbiadito);
    strokeWeight(2); beginShape();
    
    for (int i = lunghezza[j] - 1; i > 0; i--) {
        vertex(centri_x[j][i], centri_y[j][i]);
    }

    endShape();

    /* La testa nel colore richiesto */
    stroke(c); fill(c);
    strokeWeight(1); strokeCap(SQUARE);
    
    ellipse(centri_x[j][0], centri_y[j][0],
            TESTA, TESTA);
}

/* Inverti la direzione del serpente j-esimo */
void inverti_direzione(int j) {

    /* Salva delta */
    float delta_x = nuovo_centro_x[j] - centri_x[j][0];
    float delta_y = nuovo_centro_y[j] - centri_y[j][0];

    /* Inverti */
    nuovo_centro_x[j] = centri_x[j][0] - delta_x;
    nuovo_centro_y[j] = centri_y[j][0] - delta_y;
    
}


void controlla_punteggio() {

    boolean tutti_pari = true;

    for (int j = 0; j < N_SERPENTI; j++) {
        if (((lunghezza[j]/SCATTI) % 2) != 0) {
            tutti_pari = false;
        }
    }

    if (tutti_pari == true) {

        /* Riduci serpenti */
        for (int j = 0; j < N_SERPENTI; j++) {

            /* Trova il delta dell'ultimo segmento visibile */
            boolean trovato = false; int indice = 0;

            /* Percorri a ritroso tutti i segmenti */
            for (int i = lunghezza[j]-1; (i > 0) & !(trovato); i--) {

                /* Se i e` separato da i-1 */
                if (norma(centri_x[j][i] - centri_x[j][i-1],
                          centri_y[j][i] - centri_y[j][i-1]) > 0) {
                    
                    /* Trovato quello che cercavo */
                    trovato = true; indice = i;

                }
                
            }

            /* Compatta i segmenti */
            for (int i = indice + 1; i < N_SEGMENTI; i++) {
                centri_x[j][i] = centri_x[j][indice];
                centri_y[j][i] = centri_y[j][indice];
            }

            /* Dimezza serpenti */
            lunghezza[j] /= 2;

        }

        punteggio++;
        
        /* Accelera il gioco */
        accelerazione = map(punteggio, 0, 100, 1, massima_accelerazione);
        //        println("acc = " + accelerazione);
        
    }
    
}

/* Verifica le eventuali collisioni del serpente index e calcolane l'esito */
void collisione(int index) {

    float X = nuovo_centro_x[index];
    float Y = nuovo_centro_y[index];

    boolean collisione_avvenuta = false;

    for (int j = 0; (j < N_SERPENTI) & (!collisione_avvenuta); j++) {
        if (j != index) {
            
            // Verifica la collisione col serpente j
            for (int i = 0; (i < lunghezza[j]) & (!collisione_avvenuta); i++) {

                /* Distanza con il serpente j */
                if (norma(X - centri_x[j][i],
                          Y - centri_y[j][i]) <= TESTA) {

                    /* Collisione avvenuta! */
                    collisione_avvenuta = true;

                    /* Fai fare dietro front */
                    inverti_direzione(index);
                    
                    /* Index attacca un serpente piu` forte: raddoppia! */
                    if ((lunghezza[j] > lunghezza[index]) &&
                        (lunghezza[j] <= lunghezza[index]*2)) {
                        
                        /* Raddoppia index per quanto possibile */
                        lunghezza[index] *= 2;

                        if (lunghezza[index] >= N_SEGMENTI-1) {

                            // cosi` non interferisce con gli altri controlli
                            lunghezza[index] /= 2;

                            // Fine partita
                            situazione_gioco = 4;

                        } else {

                            /* Aggiorna punteggio */
                            controlla_punteggio();

                        }

                    } else {

                        if ((lunghezza[index] > lunghezza[j]*2) ||
                            (lunghezza[j] > lunghezza[index]*2)) {

                            // Fine partita
                            situazione_gioco = 4;

                        }
                    }

                }

            }

        }
        
    }

}

/* Aggiorna la posizione dei serpenti */
void muovi_serpenti() {

    float delta_x; float delta_y;

    /* Ripeti per ogni serpente */
    for (int j = 0; j < N_SERPENTI; j++) {
        /* Scorri segmenti */
        for (int i = N_SEGMENTI-1; i > 0; i--) {
            centri_x[j][i] = centri_x[j][i-1];
            centri_y[j][i] = centri_y[j][i-1];
        }

        /* Trova il delta dell'ultimo segmento visibile */
        boolean trovato = false; int indice = 0;
        /* Percorri a ritroso tutti i segmenti */
        for (int i = lunghezza[j]-1; (i > 0) & !(trovato); i--) {
            /* Se i e` separato da i-1 */
            if (norma(centri_x[j][i] - centri_x[j][i-1],
                      centri_y[j][i] - centri_y[j][i-1]) > 0) {
                /* Trovato quello che cercavo */
                trovato = true; indice = i;
            }
        }
        for (int i = indice+1; i < N_SEGMENTI; i++) {
            centri_x[j][i] = centri_x[j][indice];
            centri_y[j][i] = centri_y[j][indice];
        }
            
        /* Calcola lo spostamento */
        delta_x = nuovo_centro_x[j] - centri_x[j][0];
        delta_y = nuovo_centro_y[j] - centri_y[j][0];

        if (abs(delta_x) < .1) { delta_x = .1; }
        if (abs(delta_y) < .1) { delta_y = .1; }

        /* Aggiorna posizione della testa */
        centri_x[j][0] = nuovo_centro_x[j];
        centri_y[j][0] = nuovo_centro_y[j];

        float spostamento = norma(delta_x, delta_y);

        /* Mantieni la direzione */
        nuovo_centro_x[j] = centri_x[j][0] +
            delta_x * accelerazione * (TESTA/SCATTI) / spostamento;
        nuovo_centro_y[j] = centri_y[j][0] +
            delta_y * accelerazione * (TESTA/SCATTI) / spostamento;

        /* Controlla collisione con i bordi */
        if ((nuovo_centro_x[j] - TESTA / 2 <= TESTA / 2) ||
            (nuovo_centro_x[j] + TESTA / 2 >= LARGHEZZA - TESTA / 2)) {
            
            nuovo_centro_x[j] = centri_x[j][0] - 
                delta_x * accelerazione * (TESTA/SCATTI) / spostamento;
            
        }

        if ((nuovo_centro_y[j] - TESTA / 2 <= TESTA * 3 / 2) ||
            (nuovo_centro_y[j] + TESTA / 2 >= ALTEZZA - TESTA / 2)) {

            nuovo_centro_y[j] = centri_y[j][0] -
                delta_y * accelerazione * (TESTA/SCATTI) / spostamento;
            
        }

        /* Verifica collisioni */
        collisione(j);

    }

}

void linea_punteggio() {

    String s = "Lunghezze:";

    for (int j = 0; j < N_SERPENTI; j++) {
        s += (" " + lunghezza[j] / SCATTI);
    }

    s += "      Livello: " + punteggio;

    fill(c_bordo); stroke(c_bordo);
    rect(0, 0, LARGHEZZA, TESTA);
    textSize(16);
    fill(225); stroke(225);
    text(s, TESTA, TESTA);
        
}

void draw() {

    switch(situazione_gioco) {

    case 1: // schermata iniziale

        image(RDtitolo, 0, 0);

        textSize(16);
        fill(0); stroke(0);
        text("Premi il mouse per continuare", 350, 420);

        textSize(16); fill(bordeaux);
        text("v. 1; JMM faciebat anno MMXI; conlemele.wordpress.com", 20, 470);

        break;

    case 2: // schermata regole

        background(rugiada);

        image(RDregole, 0, 0);

        textSize(16);
        fill(0); stroke(0);
        text("Premi il mouse per continuare", 350, 420);

        break;

    case 3: // partita in corso

        /* Cancella i serpenti */
        for (int j = 0; j < N_SERPENTI; j++) {
            disegna_serpente(j, rugiada);
        }

        muovi_serpenti();

        /* Ridisegna i serpenti */
        disegna_serpente(0, ametista);
        disegna_serpente(1, blu);
        disegna_serpente(2, rosa);
        disegna_serpente(3, giallo);

        linea_punteggio();
        
        break;

    case 4: // partita finita

        textSize(32);
        fill(0); stroke(0);
        String s = "Livello = ";
        s += punteggio;
        text(s, 50, 200);
        
        disegna_bordo(c_bordo);
        linea_punteggio();

        textSize(16);
        fill(0); stroke(0);
        text("Premi il mouse per continuare", 350, 420);
        
        break;

    }

}

/* Norma di un vettore 2D */
float norma(float a, float b) { return(sqrt((a*a) + (b*b))); }

void mousePressed() {

    switch(situazione_gioco) {

    case 1: // schermata iniziale

        // Prosegui
        situazione_gioco = 2;
        break;

    case 2: // schermata regole

        // Prosegui
        situazione_gioco = 3;
        background(rugiada);
        disegna_bordo(c_bordo);
        
        break;

    case 3: // partita in corso

        /* Seleziona il serpente piu` vicino */
        float tmp;

        for (int j = 0; j < N_SERPENTI; j++) {
            
            // Distanza diretta
            tmp = norma(centri_x[j][0] - mouseX, centri_y[j][0] - mouseY);

            /* Seleziona il j-esimo serpente */
            if ((tmp > TESTA / 2) &&
                (tmp < RAGGIO_CATTURA * TESTA)) {
                nuovo_centro_x[j] = centri_x[j][0] +
                    (mouseX - centri_x[j][0])*TESTA/SCATTI/tmp;
                nuovo_centro_y[j] = centri_y[j][0] +
                    (mouseY - centri_y[j][0])*TESTA/SCATTI/tmp;
            }

        }

        break;

    case 4: // Mostra punteggio

        // Ricomincia da capo
        situazione_gioco = 1;
        punteggio = 0;
        configurazione_iniziale();
        frameRate(FOTOGRAMMI+map(punteggio, 0, 100, 0, 19));

    }

}

