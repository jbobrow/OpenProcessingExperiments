
int oa = 0;              // Colonna 0: Impaginatori totale
int Ia = 200;

int ob = 0;              // Colonna 1: Ebook/Sigil
int Ib = 50;

int oc = 0;              // Colonna 2: Pdf/Scribus
int Ic = 50;

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//                                             LEGENDA MATRICE DATI FCM
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// Singificato Codici Valori Colonna
//------------------------------------------------------------------------------------------------------------------------------------
// Binari    > | NO = o | SÌ = I | (la lettera precedente serve solo per differenziare i valori per colonna)
// Analogici > | Valori interi da 0 a + infinito |
//------------------------------------------------------------------------------------------------------------------------------------
// Codici Valori Colonna
//------------------------------------------------------------------------------------------------------------------------------------
// Impaginatori/Dropbox        = 0       Binari a  [0 = Senza Bordo + 80 | 1 = Bordo + 200 xpos]
// Ebook/Sigil                 = 1       Binari b  Coordinate x [0 = + 50 | 1 = + 100]
// Pdf/Scribus                 = 2       Binari c  Coordinate x [0 = + 50 | 1 = + 100]
// Revisori                    = 3       Binari    (mancanti)
// Traduttori                  = 4       Binari    (mancanti)
// Posizioni di responsabile   = 5       Analogici [Grandezza cerchio x7] + [+ valore*7 xpos]
// Posizioni di coordinatore   = 6       Analogici [Grandezza cerchio x7] + [+ valore*7 xpos]
// Posizioni di collaboratore  = 7       Analogici [Grandezza cerchio x2] + [+ valore*7 xpos]
// Ego networks MarcoBuono     = 8       Binari    [0 = No trasparenza cerchio | 1 = Metà trasparenza cerchio]
// Indice nomi                 = 9       Analogici Legenda: Dati associazione nome utente-riga
// Posizione Y Utenti          = 10      Analogici Coordinate y - dati convenzionali (asse y non indicativa ai fini della ricerca)
// Contributi singole edizioni = 11      Analogici
// Sistema desktop             = 12
//-----------------------------------------------------------------------------------------------------------------------------------
//                                                   *    *                   
//   n° colonna:     0   1   2   3  4  5  6  7   8   9   10  11 12    // n° riga // aggiungere quelli che utilizzano ubuntu e quelli che no, in binario 1/0
int[][] matrice = { {Ia, Ib, Ic, 1, 1, 2, 1, 0,  1,  0,   5, 19, 0},   // 0  # AldoLatino
                    {Ia, Ib, oc, 1, 1, 1, 0, 1,  0,  1,  10, 17, 4},   // 1  # AlessandroLosavio
                    {oa, ob, oc, 0, 0, 0, 0, 0,  0,  2,  15,  2, 5},   // 2  AlessandroStagni 
                    {oa, ob, oc, 0, 0, 0, 0, 0,  0,  3,  20,  1, 5},   // 3  AndreaLimongelli 
                    {oa, ob, oc, 0, 0, 0, 0, 0,  0,  4,  25,  0, 5},   // 4  AntoninoArcudi 
                    {oa, ob, oc, 0, 1, 0, 0, 0,  0,  5,  30,  4, 5},   // 5  AntonioAllegretti 
                    {oa, ob, oc, 0, 0, 0, 0, 0,  0,  6,  35,  1, 2},   // 6  AntonioPiccinno 
                    {oa, ob, oc, 0, 1, 0, 0, 0,  0,  7,  40, 19, 0},   // 7  BiancaKwey 
                    {Ia, ob, Ic, 0, 0, 6, 2, 0,  0,  8,  45,  5, 5},   // 8  # CristianoLuinetti 
                    {Ia, ob, Ic, 0, 0, 0, 0, 0,  0,  9,  50,  0, 5},   // 9  # CristinaFranzolini 
                    {oa, ob, oc, 1, 1, 0, 0, 0,  1, 10,  55, 12, 5},   // 10 DarioCavedon 
                    {oa, ob, oc, 0, 0, 0, 0, 0,  1, 11,  60,  2, 5},   // 11 DavidLaMonaca 
                    {Ia, Ib, Ic, 1, 1, 0, 0, 0,  1, 12,  65, 14, 2},   // 12  # DavideMiceli 
                    {oa, ob, oc, 0, 0, 0, 0, 0,  0, 13,  70,  0, 5},   // 13 EdoardoElidoro 
                    {oa, ob, oc, 0, 0, 0, 0, 0,  0, 14,  75,  6, 5},   // 14 FabrizioBrusa 
                    {oa, ob, oc, 0, 1, 0, 0, 0,  0, 15,  80, 10, 2},   // 15 FrancescoCargiuli 
                    {oa, ob, oc, 0, 0, 0, 0, 0,  0, 16,  85,  0, 5},   // 16 FabrizioGiacosa 
                    {Ia, ob, Ic, 1, 1, 0, 0, 0,  0, 17,  90, 15, 0},   // 17  # FabrizioNicastro 
                    {oa, ob, oc, 0, 0, 0, 0, 0,  0, 18,  95,  3, 5},   // 18 FrancescoPlacco 
                    {oa, ob, oc, 0, 0, 0, 0, 0,  0, 19, 100,  0, 5},   // 19 GianfrancoTaormina 
                    {oa, ob, oc, 0, 1, 0, 0, 0,  1, 20, 105, 15, 1},   // 20 GianlucaSantoro 
                    {oa, ob, oc, 0, 0, 0, 0, 1,  0, 21, 110, 14, 5},   // 21 # GiulioTani 
                    {oa, ob, oc, 0, 1, 0, 0, 0,  0, 22, 115, 19, 0},   // 22 GiuseppeCalà 
                    {oa, ob, oc, 1, 1, 0, 0, 0,  0, 23, 120, 15, 2},   // 23 GiuseppeDandrea 
                    {oa, ob, oc, 0, 1, 0, 0, 0,  0, 24, 125, 15, 4},   // 24 IreneBonta 
                    {oa, ob, oc, 0, 0, 0, 0, 0,  0, 25, 130,  3, 5},   // 25 LucaDeJulis 
                    {oa, ob, oc, 0, 0, 0, 0, 0,  0, 26, 135,  0, 5},   // 26 LucaSaba 
                    {oa, ob, oc, 0, 0, 0, 0, 0,  1, 27, 140, 10, 5},   // 27 LuigiDiGaetano 
                    {Ia, ob, Ic, 1, 1, 5, 4, 0,  0, 28, 145, 18, 7},   // 28  # MarcoBuono 
                    {oa, ob, oc, 1, 1, 0, 0, 0,  0, 29, 150, 16, 8},   // 29 MarcoLetizia 
                    {oa, ob, oc, 0, 0, 0, 0, 0,  0, 30, 155,  0, 5},   // 30 MattiaImpellizzeri 
                    {Ia, ob, Ic, 0, 1, 0, 0, 0,  0, 31, 160,  3, 2},   // 31  # MattiaRizzolo 
                    {Ia, Ib, Ic, 0, 0, 0, 0, 1,  1, 32, 165,  4, 2},   // 32  # MirkoPizii 
                    {Ia, ob, Ic, 0, 0, 0, 0, 4,  1, 33, 170, 14, 5},   // 33  # PaoloGarbin 
                    {Ia, ob, oc, 0, 0, 0, 1, 0,  0, 34, 175,  1, 9},   // 34  # PaoloRotolo 
                    {oa, ob, oc, 0, 1, 0, 0, 0,  0, 35, 180,  4, 3},   // 35 PasqualeDomenicoColaianni 
                    {Ia, ob, Ic, 1, 0, 0, 0, 0,  0, 36, 185,  9,10},   // 36  # RiccardoVianello 
                    {oa, ob, oc, 0, 0, 0, 0, 0,  0, 37, 190, 20, 2},   // 37 RoaldDeTino 
                    {oa, ob, oc, 0, 0, 0, 0, 0,  0, 38, 195,  0, 5},   // 38 TeoCocetta 
                    {oa, ob, oc, 0, 0, 0, 0, 0,  0, 39, 200,  1, 5},   // 39 UgoFazzini 
                    {oa, ob, oc, 1, 1, 0, 0, 0,  0, 40, 205, 12,11},   // 40 ValerioSalvucci 
                    {oa, ob, oc, 0, 0, 0, 0, 0,  0, 41, 210,  0, 5},   // 41 VitoArnetta 
                    {oa, ob, oc, 0, 0, 0, 0, 0,  0, 42, 215,  0, 5},   // 42 VitoTigani
                   };

// Codici Matrice Righe: NomeCognome membri ........................................................................................
String[] NomeCognome = {
"AldoLatino",
"AlessandroLosavio",
"AlessandroStagni",
"AndreaLimongelli",
"AntoninoArcudi",
"AntonioAllegretti",
"AntonioPiccinno",
"BiancaKwey",
"CristianoLuinetti",
"CristinaFranzolini",
"DarioCavedon",
"DavidLaMonaca",
"DavideMiceli",
"EdoardoElidoro",
"FabrizioBrusa",
"FrancescoCargiuli",
"FabrizioGiacosa",
"FabrizioNicastro",
"FrancescoPlacco",
"GianfrancoTaormina",
"GianlucaSantoro",
"GiulioTani",
"GiuseppeCalà",
"GiuseppeDandrea",
"IreneBonta",
"LucaDeJulis",
"LucaSaba",
"LuigiDiGaetano",
"MarcoBuono",
"MarcoLetizia",
"MattiaImpellizzeri",
"MattiaRizzolo",
"MirkoPizii",
"PaoloGarbin",
"PaoloRotolo",
"PasqualeDomenicoColaianni",
"RiccardoVianello",
"RoaldDeTino",
"TeoCocetta",
"UgoFazzini",
"ValerioSalvucci", 
"VitoArnetta",
"VitoTigani",
};

String[] VarColonna = {
"Impaginatore",
"Impaginatore Ebook",
"Impaginatore Pdf",
"Revisore",
"Traduttore",
"Responsabile",
"Coordinatore",
"Collaboratore",
"Ego Network Coordinatore",
"Indice nomi utenti",
"Coordinate y",
"Contributi singole edizioni",
"Sistema desktop usato",
};
// Matrice Codici membri .........................................................................................................
String[] SottoNome = {         // assegnare a singolo il numero indice SottoNome[48] = testo, così da avere doppio valore testo + analogico matrice
"[Kde]",   // 0                       // Legenda
"[Gnome]", // 1                       // da cancellare e rifare con in colonna prima numeri 45 e poi aggiungere SottoNome[ ecc e dopo ] = 'testo'
"[Unity]", // 2
"[Xfce]",  // 3
"[Lxde]",   // 4
" ",      // 5
"[Unity, Gnome 3, Xfce]", // 6
"[Unity, Kde, Gnome]",  // 7
"[Cinnamon]", // 8
"[Gnome 3, Unity]", // 9
"[Windows]", // 10
"[Gnome, Lxde]", // 11
};

String[] Tradut = {
" ", // 0
"(Tr.)",
};
String[] Rev = {
" ", // 0
"(Rv.)",
};
String[] Trad = {
" ", // 0
"(Imp.)",
};

int[] matrixBottone = {1};
//--------------------------------------------------------------------------------------------------------------------------------------
UtenteFCM utente;
PFont f;
PFont AndaleMono;

void setup() {
size(800, 700);
smooth();
f = loadFont("Dialog.plain-11.vlw");
AndaleMono = loadFont("AndaleMono-12.vlw");
frameRate(24);
}

void draw() {
  smooth();
  background(255);
  int righe   = 43;
  int colonne = 12;
  int spazio_col = 8;
  int spazio_righe = 20;
  int xmatr = 20;
  int ymatr = 20;
  int spazioNomi = 8;

// Bottoni --------------------------------------------------------------
  if(mousePressed) {
         if (mouseX >= 95 && mouseX <= 177 && mouseY <= 26 && mouseY >= 5) { // Matrice
             matrixBottone[0] = 2;

  } else if (mouseX >= 185 && mouseX <= 267 && mouseY <= 26 && mouseY >= 5) { // Grafico
             matrixBottone[0] = 1;

  } else if (mouseX >= 275 && mouseX <= 357 && mouseY <= 26 && mouseY >= 5) { // Contributi
             matrixBottone[0] = 3;
             
             } else {
             }
  } else {
  }
  
    for (int rows = 0; rows < righe; rows++)  {
      if (xfisso < 90) {
        xfisso++;
        }
        else {
        }
      utente = new UtenteFCM(            // Posizioni classe   | Pos | Effetto componenti variabili
//------------------------------------------------------------------------------------------------------------------------------
      color(30,30,30,matrice[rows][0]),       // (1)           |  0  | Impaginatori           - trasparenza bordo
      matrice[rows][0],                       // (2)           |  0  | Impaginatori           - coordinate x + 200
      matrice[rows][1],                       // (3)           |  1  | Ebook/Sigil            - coordinate x + 50
      matrice[rows][2],                       // (4)           |  2  | Pdf/Scribus            - coordinate x + 50
      matrice[rows][10] + 30,                 // (5)           | 10  | Posizione Y utenti     - coordinate y (convenzionali)
      matrice[rows][5]*7,                     // (6)           |  5  | Responsabili           - grandezza raggio cerchio x 7 volte
      matrice[rows][6]*7,                     // (7)           |  6  | Coordinatore           - grandezza raggio cerchio x 7 volte
      matrice[rows][7]*2,                     // (8)           |  7  | Collaboratore          - grandezza raggio cerchio x 2 volte
      color(matrice[rows][3]*255,             // (9)           |  3  | Revisore
            matrice[rows][4]*255,             // (9)           |  4  | Traduttore             -
            0,
            255),                             // (9)     
      rows,                                   //(10)           |  9  | Numero indice Nome     - indice di stringa testo
      matrice[rows][11],                      //(11)           | 11  | Contributi/Continuità  - Ponderazione: coordinate x + ???
      matrice[rows][12],                      //(12)           | 12  | Desktop usato          - Testo sotto il nome 
      matrice[rows][3]*50,                    //(13)           |  3  | Revisore               - 
      matrice[rows][4]*50,                     //(14)           |  4  | Traduttore             - 
      matrice[rows][8]                        //(15)           |  8  | EgoNetwork             - 
      );
//------------------------------------------------------------------------------------------------------------------------------
                   if (matrixBottone[0] >= 1 && matrixBottone[0] < 2) { // Factotum e Stato iniziale
     utente.display();
           } else  if (matrixBottone[0] >= 3 && matrixBottone[0] < 4) { // Contributi
    utente.mostraContributi();
           } else  if (matrixBottone[0] >= 2 && matrixBottone[0] < 3) { // Matrice
     utente.NoDisplay();
     spazio_righe = 20;
     spazio_col = spazio_col +10;
   for (int rows2 = 0; rows2 < righe; rows2++)  {
     spazio_righe = 20;
     spazio_col = spazio_col +10;
        for (int col = 0; col <= colonne; col++)  {
    textFont(f,11);
    fill(50);
    textAlign(LEFT);
          if (col >= 0 && col <= 0) {
             if (matrice[rows2][col] >= 200 && matrice[rows2][col] <=200) {
    text("1",275 + spazio_righe,spazio_col+20);
    spazio_righe = spazio_righe + 32;
        } else {
    text("0",275 + spazio_righe,spazio_col+20);
    spazio_righe = spazio_righe + 32;
        }
        } else if (col >= 1 && col <= 1) {
             if (matrice[rows2][col] >= 50 && matrice[rows2][col] <=50) {
    text("1",275 + spazio_righe,spazio_col+20);
    spazio_righe = spazio_righe + 32;
        } else {
    text("0",275 + spazio_righe,spazio_col+20);
    spazio_righe = spazio_righe + 32;
        }
        } else if (col >= 2 && col <= 2) {
             if (matrice[rows2][col] >= 50 && matrice[rows2][col] <=50) {
    text("1",275 + spazio_righe,spazio_col+20);
    spazio_righe = spazio_righe + 32;
        } else {
    text("0",275 + spazio_righe,spazio_col+20);
    spazio_righe = spazio_righe + 32;
        }
    } else if (col >= colonne && col <= colonne) {
    text(SottoNome[matrice[rows2][col]],275 + spazio_righe,spazio_col+20);
    spazio_righe = spazio_righe + 32;
    } else {
    text(matrice[rows2][col],275 + spazio_righe,spazio_col+20);
    spazio_righe = spazio_righe + 32;
    }
        }
      }
    for (int rows3 = 0; rows3 < righe; rows3++)  {
     spazioNomi = spazioNomi + 10;
    textFont(f,11);
    fill(50);
    textAlign(LEFT);
    text(NomeCognome[rows3],120,spazioNomi+30);
    }
    noStroke();
    fill(240);
    rect(0,470,width,250);
    pushMatrix();
    textFont(f,11);
    fill(50);
    rotate(radians(-90));
    textAlign(LEFT);
    int distDidascalie = 308;
    for (int colm = 0; colm <= colonne; colm++)  {
    text(VarColonna[colm],-625,distDidascalie);
    distDidascalie = distDidascalie + 32;
    }
    popMatrix();

 }
}
   
   
  int StrokeButton = 200;
  int FillButton = 235;
  int FillTextButton = 50;
  int StrokeButtonMatrice = 200;
  int FillButtonMatrice = 235;
  int FillTextButtonMatrice = 50;
  int StrokeButtonGrafico = 200;
  int FillButtonGrafico = 235;
  int FillTextButtonGrafico = 50;
  int StrokeButtonContributi = 200;
  int FillButtonContributi = 235;
  int FillTextButtonContributi = 50;
  
     if (mouseX >= 5 && mouseX <= 88 && mouseY <= 26 && mouseY >= 5) {
StrokeButton = 220;
FillButton = 220;
FillTextButton = 100;
    stroke(230);
    fill(245,245,245,220);
    rect(5,5,width-10,height-10);
//--------------------------------- Membri
    noStroke();
    fill(190);
    ellipse(30,50,20,20);
    textFont(f,11);
    fill(50);
    textAlign(LEFT);
    text("Cerchio = Membro Fcm Italia",50,55);
//--------------------------------- Membri
    noStroke();
    fill(190);
    ellipse(30,85,25,25);
    textFont(f,11);
    fill(50);
    textAlign(LEFT);
    text("Grandezza cerchio = Numero incarichi assunti",50,83);
    text("(Responsabile + Coordinatore + Collaboratore)",50,97);
//--------------------------------- Barra costanza contributi
if (matrixBottone[0] >= 1 && matrixBottone[0] < 2) {
    noStroke();
    fill(230,160,160);
    rect(20,115,50,5);
    textFont(f,11);
    fill(50);
    textAlign(LEFT);
    text("Costanza Contributi",80,121);
      } else {
      } 
//--------------------------------- Legenda ruoli
    noStroke();
    textFont(f,11);
    fill(50);
    textAlign(LEFT);
    text("Ruoli = Colore quadrato + (Etichetta):",20,145);
    fill(0,255,0);
    rect(25,151,10,10);
    fill(50);
    text("(Tr.) = Traduttore",40,160);
    fill(255,0,0);
    rect(25,166,10,10);
    fill(50);
    text("(Rv.) = Revisore",40,175);
    fill(255,255,0);
    rect(25,182,10,10);
    fill(50);
    text("(Tr.)(Rv.) = Traduttore e Revisore",40,190);
    fill(0,0,0);
    rect(25,198,10,10);
    fill(50);
    text("Etichetta assente = Dati mancanti o non reperibili",40,207);
//--------------------------------- Legenda ruoli Impaginatori
    stroke(50);
    fill(190);
    ellipse(30,225,20,20);
    textFont(f,11);
    fill(50);
    textAlign(LEFT);
    text("Bordo cerchio = Impaginatori",50,230);
//--------------------------------- Leganda Asse Y
    textFont(f,11);
    fill(50);
    textAlign(LEFT);
    text("Ordinate Y = Dati convenzionali, non ai fini della ricerca",20,270);
 //--------------------------------- Ego Network 
    noStroke();
    fill(220);
    rect(10,465,width-20,40);
    textFont(f,11);
    fill(50);
    textAlign(LEFT);
    text("I collegamenti tra i nodi corrispondono alla rete sociale del coordinatore dell'edizione MarcoBuono.",20,480);
    text("(I dati sono stati ricavati tramite il social network facebook).",20,495);
//--------------------------------- Legenda Asse X Factotum
if (matrixBottone[0] >= 1 && matrixBottone[0] < 2) {
    stroke(200);
    line(10,320,width-10,320);
    line(10,432,width-10,432);
    textFont(f,11);
    fill(50);
    textAlign(LEFT);
    text("Ascisse X = membri factotum = membri che contribuiscono in cose diverse:",20,310);
    text("Coordinata X = Revisione + Traduzione + Impaginazione (eBook + Pdf) + Numero posizioni di responsabile, coordinatore, collaboratore",10,335);
    text("Per ogni ruolo vengono assegnati +50px di posizione sull'asse X.",10,350);
    text("Ai ruoli non coinvolti direttamente nella produzione viene assegnato un peso minore:",10,365);
    text("Per ogni posizione di responsabile e coordinatore vengono aggiunti +7px alle coordinate X",10,380);
    text("Per ogni posizione di collaboratore vengono aggiunti +2px alle coordinate X",10,395);
    text("Più un membro è verso destra (più il valore di x è alto) più ruoli diversi occupa.",10,410);
    text("Più un membro è verso sinistra (più il valore di x è basso) meno ruoli diversi occupa.",10,425);
      } else {
      } 
      //--------------------------------- Legenda Asse X Contributi
if (matrixBottone[0] >= 3 && matrixBottone[0] < 4) {
    stroke(200);
    line(10,320,width-10,320);
    line(10,403,width-10,403);
    textFont(f,11);
    fill(50);
    textAlign(LEFT);
    text("Ascisse X = quantità di contributi alle edizioni:",20,310);
    text("(Per la rilevazione vengono considerati i contributi a partire dal numero 37 fino al 56 di FCM)",10,335);
    text("Più un membro è verso destra (più il valore di x è alto) maggiore è il numero di edizioni a cui ha partecipato.",10,350);
    text("Più un membro è verso sinistra (più il valore di x è basso) minore è il numero di edizioni a cui ha partecipato.",10,365);
    text("Accanto al nome di ogni partecipante è indicato il numero totale dei suoi contributi",10,380);
    text("Ogni partecipazione a un solo numero di FCM vale +1, il totale poi viene moltiplicato per 29 per una migliore lettura del grafico",10,395);
      } else {
      } 
//-------------------------------- Fine legenda > Animazione pulsanti:
  } else if (mouseX >= 95 && mouseX <= 177 && mouseY <= 26 && mouseY >= 5) { // Pulsante Matrice
  StrokeButtonMatrice = 220;
FillButtonMatrice = 220;
FillTextButtonMatrice = 100;

  } else if (mouseX >= 185 && mouseX <= 267 && mouseY <= 26 && mouseY >= 5) { // Pulsante Grafico
    StrokeButtonGrafico = 220;
FillButtonGrafico = 220;
FillTextButtonGrafico = 100;

  } else if (mouseX >= 275 && mouseX <= 357 && mouseY <= 26 && mouseY >= 5) { // Pulsante Contributi
    StrokeButtonContributi = 220;
FillButtonContributi = 220;
FillTextButtonContributi = 100;

  } else {
  StrokeButton = 200;
  FillButton = 235;
  FillTextButton = 50;
     StrokeButtonMatrice = 200;
  FillButtonMatrice = 235;
  FillTextButtonMatrice = 50;
       StrokeButtonGrafico = 200;
  FillButtonGrafico = 235;
  FillTextButtonGrafico = 50;
       StrokeButtonContributi = 200;
  FillButtonContributi = 235;
  FillTextButtonContributi = 50;
}
  stroke(StrokeButton);
  fill(FillButton);
  rect(5,5,80,20);
    textFont(f,11);
    fill(FillTextButton);
    textAlign(LEFT);
    text("Legenda",21,20);
    
  stroke(StrokeButtonMatrice);
  fill(FillButtonMatrice);
  rect(95,5,80,20);
    textFont(f,11);
    fill(FillTextButtonMatrice);
    textAlign(LEFT);
    text("Matrice",113,20);
    
  stroke(StrokeButtonGrafico);
  fill(FillButtonGrafico);
  rect(185,5,80,20);
    textFont(f,11);
    fill(FillTextButtonGrafico);
    textAlign(LEFT);
    text("Factotum",200,20);
    
  stroke(StrokeButtonContributi);
  fill(FillButtonContributi);
  rect(275,5,80,20);
    textFont(f,11);
    fill(FillTextButtonContributi);
    textAlign(LEFT);
    text("Contributi",288,20);
    
}
int xfisso = 0; // valore convenzionale delle x per distanziare gli utenti dal bordo destro
    
class UtenteFCM {            // Classe generico UtenteFCM, proprietà:
  color c;
  int xpos;
  int ypos;
  int xyGran;
  int indiceStringa;
  int indiceDesktop;
  int Contributi;
  color t;
  int Revisore;
  int Traduttore;
  int EgoNet;
  
  UtenteFCM(                 // Il costruttore è definito con gli argomenti:
//-----------------------------------------------------------------------------------------------------------------------------
  color tempC,               // (1) :: Impaginatori           - trasparenza bordo
  int tempXposImp,           // (2) :: Impaginatori           - coordinate x + 200
  int tempXposEbook,         // (3) :: Ebook/Sigil            - coordinate x + 50
  int tempXposPdf,           // (4) :: Pdf/Scribus            - coordinate x + 50
  int tempYpos,              // (5) :: Posizione Y utenti     - coordinate y (convenzionale)
  int tempGranResp,          // (6) :: Responsabili           - grandezza raggio cerchio x 7 volte
  int tempGranCoord,         // (7) :: Coordinatore           - grandezza raggio cerchio x 7 volte
  int tempGranCollab,        // (8) :: Collaboratore          - grandezza raggio cerchio x 2 volte
  color tempT,               // (9) 
  int indexNomi,             //(10) :: Numero indice Nome     - indice di stringa testo
  int tempContributi,        //(11) :: Contributi/Continuità  - Ponderazione: coordinate x + ???
  int Desktop,               //(12) :: Desktop usato          - Testo sotto il nome
  int tempRevisore,          //(13) :: Revisore               -
  int tempTraduttore,        //(14) :: Traduttore             -
  int tempEgoNet)            //(15) :: EgoNetwork             -
  
//-----------------------------------------------------------------------------------------------------------------------------
  { 
// Variabili incidenti nella rappresentazione:
    c = tempC;
    xpos = xfisso + (tempXposEbook + tempXposPdf + tempGranResp + tempGranCoord + tempGranCollab + tempRevisore + tempTraduttore)*2;
    ypos = tempYpos*3 - 50;
    xyGran = tempGranResp + tempGranCoord + tempGranCollab + 5;
    indiceStringa = indexNomi;
    indiceDesktop = Desktop;
    Contributi = tempContributi;
    Revisore = tempRevisore;
    Traduttore = tempTraduttore;
    t = tempT;
    EgoNet = tempEgoNet;
  }
  void NoDisplay() {

  }

  void display() {
    stroke(c); // proprietà colore bordi > stroke 255, oppure, stroke(255,255,255); Se non si vuole: noStroke();
    fill(200);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,xyGran,xyGran);
    noStroke();
    fill(230,160,160);
    rect(xpos+10,ypos+2,Contributi*2,5);
    fill(t);
    rect(xpos+5,ypos+2,5,5);
 // ellipse(x,y,larghezza,altezza)
    textFont(f,11);
    fill(0);
    textAlign(LEFT);
    text(NomeCognome[indiceStringa] + " " + SottoNome[indiceDesktop] + " " + Tradut[Traduttore/50] + " " + Rev[Revisore/50],xpos,ypos);
    if (EgoNet >= 1) {
       stroke(50,50,50,120);
       line(xpos,ypos,516,475);
        }
        else {
        }
// println(NomeCognome[indiceStringa] + "(xpos = " + xpos + ") (ypos = " + ypos + ")");
  }
   void mostraContributi() {
    stroke(c); // proprietà colore bordi > stroke 255, oppure, stroke(255,255,255); Se non si vuole: noStroke();
    fill(200);
    ellipseMode(CENTER);
    ellipse(20 + Contributi*29,ypos,xyGran,xyGran);
    noStroke();
    fill(t);
    rect((20 + Contributi*29)+5,ypos+2,10,5);
 // ellipse(x,y,larghezza,altezza)
    textFont(f,11);
    fill(0);
    textAlign(LEFT);
    text(NomeCognome[indiceStringa] + " " + "=" + " " + Contributi + " " + Tradut[Traduttore/50] + " " + Rev[Revisore/50],20 + Contributi*29,ypos);
        if (EgoNet >= 1) {
       stroke(50,50,50,120);
       line(20 + Contributi*29,ypos,540,475);
        }
        else {
        }
   // println(NomeCognome[indiceStringa] + "(xpos = " + 20 + Contributi*29 + ") (ypos = " + ypos + ")");
  }
}


