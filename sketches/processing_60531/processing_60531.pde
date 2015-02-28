
/* Game. Slide blocks similarly to the classic Fifteen Puzzle. Try to obtain columns of the same colour, leaving the empty space at the bottom left. Or just play with it, arranging the blocks any way you like.

   Gioco. Tipo Gioco del 15, ispirato ad un puzzle 3D. Le tessere possono scorrere sulla stessa colonna, oppure spostarsi in orizzontale uscendo da un lato per rientrare nell'altro. Prova a mettere lo stesso colore per ogni colonna e lasciare lo spazio nero in basso a destra. */

int ALTEZZA, LARGHEZZA, BORDO = 5;
PImage Fdestra, Fsinistra;

int[][] casella;

int n_stelle;
int[] stelleX;
int[] stelleY;
float[] stelleLum;

boolean risolto;

/* Disegna la cornice */
void disegna_bordo(color c) {

    fill(c); stroke(c);

    int a, b, k; a = ALTEZZA; b = LARGHEZZA; k = BORDO;

    rect(0, 0, b-k, k); // Alto
    rect(b-k, 0, a-k, b); // Destra
    rect(k, a-k, b, a-k); // Basso
    rect(0, k, k, a); // Sinistra
    
}

/* Sfuma */
void disegna_cielo() {

    int k = BORDO;
    int h2 = int(ALTEZZA/2)-k;

    strokeWeight(2);

    for (int i = 0; i < h2; i+=2) {

        stroke(color(0, 0, int(255*i/h2)));
        line(k, k+i, LARGHEZZA-k, k+i);
        stroke(color(int(255*i/h2), 0, 255-int(i/h2)));
        line(k, k+i+h2, LARGHEZZA-k, k+i+h2);
    }        

}

/* */
void disegna_stelle() {
    int k;
    for (int i = 0; i < n_stelle; i++) {
        k = int(stelleLum[i]*255);
        color col = color(k, k, k);
        stroke(col); fill(col);
        ellipse((float)stelleX[i], (float)stelleY[i], 5*stelleLum[i], 5*stelleLum[i]);

    }
}

/* Scorri strato i-esimo */
void scorri_strato(int i, boolean destra) {

    if (destra) {
        int tmp = casella[i][0];
        for (int j = 0; j < 5; j++)
            casella[i][j] = casella[i][j+1];
        casella[i][5] = tmp;
    } else {
        int tmp = casella[i][5];
        for (int j = 5; j > 0; j--)
            casella[i][j] = casella[i][j-1];
        casella[i][0] = tmp;
    }      

}

/* Scorri casella (strato i, colonna j) */
void scorri_casella(int i, int j) {

    if ((i == 0) && (casella[1][j] == 0)) {
        casella[1][j] = casella[0][j]; casella[0][j] = 0;
    }

    if ((i == 2) && (casella[1][j] == 0)) {
        casella[1][j] = casella[2][j]; casella[2][j] = 0;
    }

    if (i == 1) {

        if (casella[0][j] == 0) {
            casella[0][j] = casella[i][j]; casella[i][j] = 0;
        }

        if (casella[2][j] == 0) {
            casella[2][j] = casella[i][j]; casella[i][j] = 0;
        }

    }
    
}

/* Dai una bella rimesciata alle caselle */
void mescola() {

    int N = (int)random(1000);
    for (int i = 0; i < N; i++) {
        if ((int)random(100) < 50) {
            scorri_casella((int)random(3), (int)random(6));
        } else {
            if ((int)random(100) < 50) {
                for (int j = 0; j < (int)random(6)+1; j++) {
                    scorri_strato((int)random(3), true);
                }
            } else {
                for (int j = 0; j < (int)random(6)+1; j++) {
                    scorri_strato((int)random(3), false);
                }
            }
        }
    }
    risolto=false;
}

/* Riordina */
void configurazione_iniziale() {

    int tmp = 0;
    for (int j = 0; j < 6; j++)
        for (int i = 0; i < 3; i++)
            casella[i][j] = ++tmp;

    casella[2][5] = 0;

    n_stelle = 10 + int(random(40));

    stelleX = new int[n_stelle];
    stelleY = new int[n_stelle];
    stelleLum = new float[n_stelle];

    int lato, x0, y0;
    lato = (int)(LARGHEZZA / 10);
    x0 = lato*2;
    y0 = (int)((ALTEZZA - lato*3)/2);
    
    for (int i = 0; i < n_stelle; i++) {
        stelleX[i] = int(BORDO + random(LARGHEZZA-2*BORDO));
        stelleY[i] = int(BORDO + random(y0));
        stelleLum[i] = random(1);
    }

}

void disegna_luna() {
    
    int lato, x0, y0;
    lato = (int)(LARGHEZZA / 10);
    x0 = lato*2;
    y0 = (int)((ALTEZZA - lato*3)/2);

    fill(255, 255, 255);
    if (risolto) {
        stroke(63, 63, 63);
    } else {
        stroke(192, 192, 192);
    }
    ellipse(lato*8, lato*1.2, lato*1.3, lato*1.3);

}

void disegna_caselle() {

    int lato, x0, y0;
    lato = (int)(LARGHEZZA / 10);
    x0 = lato*2;
    y0 = (int)((ALTEZZA - lato*3)/2);

    if (risolto) {
        stroke(255, 255, 255);
    } else {
        stroke(0, 0, 0);
    }

    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 6; j++) {
            int c = casella[i][j]; color col = color(0, 0, 0);
            if ((c==1) || (c==2) || (c==3)) {
                col = color(255, 0, 0); }
            if ((c==4) || (c==5) || (c==6)) {
                col = color(255, 165, 0); }
            if ((c==7) || (c==8) || (c==9)) {
                col = color(165, 42, 42); }
            if ((c==10) || (c==11) || (c==12)) {
                col = color(0, 0, 255); }
            if ((c==13) || (c==14) || (c==15)) {
                col = color(0, 255, 0); }
            if ((c==16) || (c==17)) {
                col = color(255, 255, 255); }
            
            fill(col);
            rect(x0 + j*lato, y0 + i*lato, lato, lato);
        }
    
    fill(color(0, 0, 0));
    for (int i = 0; i < 5; i++) {
        rect(x0 + (i+1)*lato, y0, BORDO, lato*3);
    }

}


void draw() {

    /* Bordo */
    disegna_bordo(color(0, 0, 0));

    /* Cielo: sfumature */
    disegna_cielo();

    /* Cielo: stelle */
    disegna_stelle();
     
    /* Cielo: luna */
    disegna_luna();

    /* Pedine */
    disegna_caselle();
       
    /* Frecce */
    int lato, x0, y0;
    lato = (int)(LARGHEZZA / 10);
    x0 = lato*2;
    y0 = (int)((ALTEZZA - lato*3)/2);

    int flato = (int)(lato*.8);
    image(Fdestra, lato*(8.5 + .1), y0 + .1*lato, flato, flato);
    image(Fdestra, lato*(8.5 + .1), y0 + (1+.1)*lato, flato, flato);
    image(Fdestra, lato*(8.5 + .1), y0 + (2+.1)*lato, flato, flato);

    image(Fsinistra, lato*(.5 + .1), y0 + .1*lato, flato, flato);
    image(Fsinistra, lato*(.5 + .1), y0 + (1+.1)*lato, flato, flato);
    image(Fsinistra, lato*(.5 + .1), y0 + (2+.1)*lato, flato, flato);
    
    /* Faciebat */
    textSize(18); //fill(bordeaux);
    fill(0); stroke(0);
    text("v. 1; JMM faciebat anno MMXII; conlemele.wordpress.com", 20, 470);

}

boolean controlla() {

    boolean flag = true;
    int P;

    if (casella[2][5] != 0) {

        flag = false;

    } else {

        for (int i = 0; i < 5; i++) {

            P = ((casella[0][i] % 3) + 1);
            P *= ((casella[1][i] % 3) + 1);
            P *= ((casella[2][i] % 3) + 1);

            if (P != 6) {
                flag = false;
            }
        }

    }

    return(flag);

}

void setup () {

    size(640, 480);

    LARGHEZZA = 640; ALTEZZA = 480;

    casella = new int[3][6];

    Fdestra = loadImage("f_est.gif");
    Fsinistra = loadImage("f_ovest.gif");

    configurazione_iniziale();

    mescola();
    
    risolto = controlla();

}

/* Norma di un vettore 2D */
float norma(float a, float b) { return(sqrt((a*a) + (b*b))); }

void mousePressed() {
    
    int lato, x0, y0;
    lato=(int)(LARGHEZZA/10); x0=lato*2; y0=(int)((ALTEZZA-lato*3)/2);
    int flato = (int)(lato*.8);

    /* E' stata premuta una casella? */
    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 6; j++) {
            if ((mouseX > x0+j*lato) && (mouseY > y0+i*lato) &&
                (mouseX <= x0+(j+1)*lato) &&
                (mouseY <= y0+(i+1)*lato)) {
                scorri_casella(i, j);
            }
        }

    /* E' stata premuta una freccia? */
    if (2*norma(mouseX-lato*(8.5+.1)-flato/2, mouseY-(y0+.1*lato)-flato/2) <= flato) {
        scorri_strato(0, false); }
    if (2*norma(mouseX-lato*(8.5+.1)-flato/2, mouseY-(y0+1.1*lato)-flato/2) <= flato) {
        scorri_strato(1, false); }
    if (2*norma(mouseX-lato*(8.5+.1)-flato/2, mouseY-(y0+2.1*lato)-flato/2) <= flato) {
        scorri_strato(2, false); }

    if (2*norma(mouseX-lato*(.5+.1)-flato/2, mouseY-(y0+.1*lato)-flato/2) <= flato) {
        scorri_strato(0, true); }
    if (2*norma(mouseX-lato*(.5+.1)-flato/2, mouseY-(y0+1.1*lato)-flato/2) <= flato) {
        scorri_strato(1, true); }
    if (2*norma(mouseX-lato*(.5+.1)-flato/2, mouseY-(y0+2.1*lato)-flato/2) <= flato) {
        scorri_strato(2, true); }

    /* E' stata premuta la luna? */
    if (2*norma(mouseX-lato*8, mouseY-lato*1.2) <= lato*1.3) {
        mescola();
    }

    boolean tmp = controlla();

    if (risolto != tmp) { disegna_luna(); }
    
    risolto = tmp;

    disegna_caselle();

}

