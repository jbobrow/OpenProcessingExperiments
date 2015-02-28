
// FI Asetukset
// EN Settings

boolean unhardcore = true; // False = hardcoremode, you need to reset the website to play again
boolean hahmoelaa = true; // False = game not work, screenshotmode, press "Q" to start
boolean velaa = true; // False = peaceful
boolean combot = true; // False = No combos
boolean poin = true; //False = No points, no cubes, only pac-man and you.
int liikkuvuus = 3; // character speed
int kuutioita = 10; // Number of cubes
int combo = 10; // Number of combo points / combo
int vnopeus = 2; // Enemy's speed


//Basicsetting:
//All booleans = true
//liikkuvuus = 3
//kuutioita = 10
//combo = 10
//vnopeus = 2

// FI Arvot kuutioille ja pelihahmolle k = kuutio y = ympyrä
// EN Values ​​for the cube and the game character k = cubic y = a circle

int hahmonkoko = 30;
int yy = 250;
int yx = 250;
int kmax = 30;
int kmin = 5;
int pisteet = 0;
int combopisteet = 0;

// FI Arvot vastukselle
// EN Values ​​resistor

int vx = 0;
int vy = (int)random (460);
int vkoko = 30;


// FI Hahmon kuvat
// EN Character Images

PImage hahmo;
PImage hahmoDown;
PImage hahmoLeft;
PImage hahmoRight;
PImage hahmoUp;
PImage gameover;

// FI Vastuksen kuvat
// EN Resistance Images

PImage vastusUp;
PImage vastusDown;
PImage vastusLeft;
PImage vastusRight;
PImage vastusRightkiinni;

// FI Muut
// EN Other

PImage bg;

// FI Kuutioiden määrä ja asetukset
// EN Number of cubes and Regulations

boolean[]elossa = new boolean[kuutioita];
int[] kx = new int[kuutioita];
int[] ky = new int[kuutioita];
int[] kkoko = new int[kuutioita];

color[] kvari = new color[kuutioita];


// FI Perusasetukset
// EN Basic settings

void setup() {
  
  // FI Hahmon grafiikat
  // EN Character graphics
  
  hahmo = loadImage("hahmoDown.gif");
  hahmoDown = loadImage("hahmoDown.gif");
  hahmoLeft = loadImage("hahmoLeft.gif");
  hahmoRight = loadImage("hahmoRight.gif");
  hahmoUp = loadImage("hahmoUp.gif");
  gameover = loadImage("GAMEOVER.gif");
  
  // FI Muut grafiikat
  // EN Other graphics
  
  bg = loadImage("bg.png");
  
  // FI Vastuksen grafiikat
  // EN Graphics resistance
  
  vastusUp = loadImage("vastusUp.gif");
  vastusDown = loadImage("vastusDown.gif");
  vastusLeft = loadImage("vastusLeft.gif");
  vastusRight = loadImage("vastusRight.gif");
  vastusRightkiinni = loadImage("vastusRightkiinni.gif");
  
size(500,500);
background(bg);
  
for(int i=0;i<elossa.length;i++) {
 elossa[i]=false; 
}

// FI Kuutioiden piirtäminen
// EN  Draw the cubes
if (poin == true) {
for(int i=0;i<kuutioita;i++){
kvari[i] = color (random (255),random (255),random (255));
kx[i]=(int)random (width-kmax);
ky[i]=(int)random (height-kmax);
kkoko[i]=(int)random (kmin, kmax);
elossa[i] = true;
fill (kvari[i]);
rect (kx[i],ky[i],kkoko[i],kkoko[i]);
}
}
  
// FI Hahmon ja pisteiden teko
// EN Character and point making
  image(hahmoDown,yx,yy);
  fill (0,0,200);
 if (poin == true) {
 text ("Score: " + pisteet,20,20);
 }
 if (combot == true){
 text("Combot: " + combopisteet , 20, 35);
 }

}

// FI Hahmon ja vastuksen piirto
// EN Pattern and overhead resistance

void draw() {
  
  background (bg); 
  
      for(int i=0;i<elossa.length;i++) {
 if (elossa[i]==true) {
   fill(kvari[i]);
  rect (kx[i],ky[i],kkoko[i],kkoko[i]);
 }
}

  image(hahmo, yx, yy);
  
  // FI Pelin häviäminen
  // EN Game over
 
if (velaa == true){
if ((yx + hahmonkoko >= vx && yx < vx + vkoko)
     && (yy + hahmonkoko >= vy && yy < vy + vkoko)) {
  hahmoelaa = false;
  if (unhardcore == true) {
  fill (160,0,160);
  rect (245,235,150,60);
  fill (0,0,200);
  text ("GAME OVER",250,250);
  text ("Your score: " + pisteet ,250,270);
  text ("Press Q to play again",250,290);
  }
  hahmo = gameover;
  } 
}
  
  // FI Vastuksen siirto takaisin
  // EN Resistance of the transfer back to top
  
  if (velaa == true) {
  image(vastusRight, vx, vy);
  if (hahmoelaa == true) {
  vx = vx + vnopeus;
  }
  
  if (vx >= 500) {
    vx = vx - 530;
    vy = (int)random (500);
  }
  }
  

 fill (0,0,200); 
 if (poin == true) {
 text ("Score: " + pisteet,20,20);
 }
 if (combot == true) {
 text("Combos: " + combopisteet , 20, 35);
 }
  
}

void keyPressed ()
{
  
  if (!(key =='a' || key =='s' || key =='d' || key =='w'||key =='A'||key =='S'||key =='D'||key =='W'||key =='q'||key =='Q'|| key =='g'|| key =='G'|| key =='h'|| key =='H')) {
    print ("Näppäintä ei voi käyttää. ");
    return;
  }

 // FI Kuutioiden tuhoamisen säädöt pelihahmolle
 // EN Cubes destruction of the controls the game character

 for(int i=0;i<elossa.length;i++) {
 if (elossa[i]==true) {
   if ((yx + hahmonkoko >= kx[i] && yx < kx[i] + kkoko[i])
     && (yy + hahmonkoko >= ky[i] && yy < ky[i] + kkoko[i]))  
     {
       
       elossa[i]=false;
       if (poin = true) {
       print ("Saatiin piste. ");
        pisteet = pisteet + 1;
       }
        if (combot == true) {
         if (pisteet > 100 ) {
          if (poin == true) {
          print ("Saatiin pisteitä. ");  
          pisteet = pisteet + 9;
          }
         }
        }
        
        // FI Pistecombot
        // EN Point Combos
        
        if (combot == true) {
        if (pisteet > 500 ) {
          print ("Saatiin combopiste. ");
          if (poin == true) {
          pisteet = pisteet + combo;
          }
          combopisteet = combopisteet + 1;
        }
         if (pisteet > 1000) {
          print ("Saatiin combopiste. ");
          if (poin == true) {
          pisteet = pisteet + combo;
          combopisteet = combopisteet + 1;
          }
        }
          if (pisteet > 2000) {
          print ("Saatiin combopiste. ");
          if (poin == true) {
          pisteet = pisteet + combo;
          combopisteet = combopisteet + 1;
          }
        }
          if (pisteet > 3000) {
          print ("Saatiin combopiste. "); 
         if (poin == true) { 
          pisteet = pisteet + combo;
         }
          combopisteet = combopisteet + 1;
        }
          if (pisteet > 4000) {
          print ("Saatiin combopiste.");
          if (poin == true) {
          pisteet = pisteet + combo;
          }
          combopisteet = combopisteet + 1;
        }
          if (pisteet > 5000) {
          print ("Saatiin combopiste. ");  
          if (poin == true) {
          pisteet = pisteet + combo;
          }
          combopisteet = combopisteet + 1;
        }
        }
       
        kvari[i] = color (random (255),random (255),random (255));
        kx[i]=(int)random (width-kmax);
        ky[i]=(int)random (height-kmax);
        kkoko[i]=(int)random (kmin, kmax);
        elossa[i] = true;
       
     }
 }
 
}
 
    
    // FI Hahmon liikuttaminen
    // EN  Moving a Character
  if (hahmoelaa == true) {  
  if (key =='s')
  {
    yy=yy+liikkuvuus;
    hahmo = hahmoDown;
  }
  if (key =='w')
  {
    yy=yy-liikkuvuus;
    hahmo = hahmoUp;
  }
  if (key =='a')
  {
    yx=yx-liikkuvuus;
    hahmo = hahmoLeft;
  }
  if (key =='d')
  {
    yx=yx+liikkuvuus;
    hahmo = hahmoRight;
    
  }
    if (key =='S')
  {
    yy=yy+liikkuvuus;
    hahmo = hahmoDown;
  }
  if (key =='W')
  {
    yy=yy-liikkuvuus;
    hahmo = hahmoUp;
  }
  if (key =='A')
  {
    yx=yx-liikkuvuus;
    hahmo = hahmoLeft;
  }
  if (key =='D')
  {
    yx=yx+liikkuvuus;
    hahmo = hahmoRight;
    
  }
   // FI Seinät
   // EN Walls
      if (yx >= 500-hahmonkoko) {
    yx = yx - liikkuvuus;
  }
    if (yx <= 0) {
    yx = yx + liikkuvuus;
  }
        if (yy >= 500-hahmonkoko) {
    yy = yy - liikkuvuus;
  }
    if (yy <= 0) {
    yy = yy + liikkuvuus;
  }
  }
  
 if (unhardcore == true) { 
 if (hahmoelaa == false) {
  if (key =='Q' || key =='q'){
   hahmoelaa = true;
   hahmo = hahmoDown; 
   vx = 0;
   vy = (int)random (500-30);
   pisteet = 0;
   combopisteet = 0;
   yy = 250;
   yx = 250;
   kuutioita = 0;
   kuutioita = 10;
  }
 }
 }
 
}

//BoxCollector game v.1.0 by AVM aka Lehtio. 
//Special thanks to Skari.
//© 2011 BoxCollector game. All Rights Reserved.
        
   

