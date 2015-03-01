
float scalar = 170;
float speed = 0.05;
float x, y, s, m, h, centroX, centroY;

void setup() { 
size(480,740);
smooth();
}

void draw() {
centroX=width/2;
centroY=520;
  
  
  
background(0,0,0);
noStroke();

// Luna
fill(255,254,219);
ellipse(380,50,80,80);
fill(0,0,0);
ellipse(370,45,80,80);

//ramo
fill(64,41,0);
beginShape();                                    
vertex(0,350);
vertex(120,330);
vertex(240,350);
vertex(360,350);
vertex (420,332);
vertex(430,280);
vertex(445,280);
vertex(440,325);
vertex(480,320);

vertex(480,350);
vertex(360,380);
vertex(240,390);
vertex(120,380);
vertex(0,410);
endShape(CLOSE);

//Fine ramo




// Inizio corpo
fill(139,88,0);
ellipse(centroX,240,220,280);

fill(200);
ellipse(centroX,260,200,260);
// fine corpo


// inizio testa
fill(0,0,0,100);
ellipse(250,165,160,160);

fill(165,120,37);
ellipse(240,160,160,160);                        //Testa gufo

beginShape();                                    // Orecchie
vertex(centroX+70,80);
vertex(centroX+30,90);
vertex(centroX+50,120);
endShape(CLOSE);

beginShape();
vertex(centroX-70,80);
vertex(centroX-30,90);
vertex(centroX-50,120);
endShape(CLOSE);

fill(200);                               // Gola grigia
arc(240,160,160,160,radians(60),radians(120));

fill(255,255,0);                                     // Occhi
ellipse(centroX-35,160,70,70);
ellipse(centroX+35,160,70,70);

fill(0,0,0);
ellipse(centroX-35,160,20,20);
ellipse(centroX+35,160,20,20);


fill(255,255,255);
ellipse(centroX-30,155,5,5);
ellipse(centroX+40,155,5,5);

fill(134,114,0);

beginShape();                                   // Becco 
vertex(centroX-3,160);
vertex(centroX+3,160);
vertex(centroX+10,170);
vertex(centroX,190);
vertex(centroX-10,170);
endShape(CLOSE);

// fine testa
// Orologio..
stroke(0);
strokeWeight(1);
fill(180); 
ellipse(centroX,520,400,400);
fill(255); 
ellipse(centroX,520,380,380);

// ore
stroke(0,0,0);
strokeWeight(6);
line(centroX,340,centroX,370);
line(centroX,670,centroX,700);
line(60,520,90,520);
line(390,520,420,520);



// zampe

strokeWeight(1);
fill(201,171,118);
strokeJoin(ROUND);
rect(centroX-53,314,15,30);
rect(centroX-38,312,15,30);
rect(centroX-23,310,15,30);

rect(centroX+8,310,15,30);
rect(centroX+23,312,15,30);
rect(centroX+38,314,15,30);

// comincia il blocco di prog per l'animazione delle lancette.

s = map (second(), 0, 60, 0, TWO_PI) - HALF_PI;                                           // rimappatura dei valori dei secondi, minuti, ore.
m = map (minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;                   // aggiungo il norm per lo spostamento addizionale della lancetta dei minuti in base al valore dei secondi
h = map (hour() + norm(minute(), 0, 60), 0, 12, 0,  TWO_PI) - HALF_PI;                    // aggiungo il norm per lo spostamento addizionale della lancetta delle ore in base al valore dei minuti

// E' CERCATO IL FATTO CHE LE OMBRE SI SPOSTANO DAVANTI E DIETRO LE LANCETTE?
// SI SOVRAPPONGONO A 115 E 315 GRADI
// prima le ombre delle lancette....
centroX = centroX+5;                       // spostiamo il centro dell'orologio di 5 px in x e y
centroY = 525;



                                         // Inizio lancetta secondi

x = centroX + cos(s) * scalar;           // lancetta con inizio al centro, vertice X in centro x + coseno angolo moltipl. per la lunghezza lancetta secondi.
y = centroY + sin(s) * scalar;           // lancetta con inizio al centro, vertice Y in centro Y + seno angolo moltipl. per la lunghezza lancetta secondi.

stroke(0,0,0,80);                       // Notare la finezza, canale alpha per ombre trasparenti
strokeWeight(3);
line(centroX, centroY, x, y);

                                         // inizio lancetta minuti, prima di tutto ridimensioniamo la lancetta...
                                        
scalar= 0.9 * scalar;                     // Dimensioniamo la lacetta dei minuti al 90% di quella dei secondi  

x = centroX + cos(m) * scalar;           // lancetta con inizio al centro, vertice X in centro x+coseno angolo moltipl. per lungh. lanc. minuti (scalar) e stesso per Y
y = centroY + sin(m) * scalar;           
strokeWeight(5);
line(centroX, centroY, x, y);
                                         // passiamo alle ore, ora è facile, copia e incolla..  

scalar= 0.8 * scalar;                     // lancetta delle ore al 80% di quella dei minuti 

x = centroX + cos(h) * scalar;           // lancetta con inizio al centro, vertice X in centro x+coseno angolo moltipl. per lungh. lanc. minuti (scalar) e stesso per Y
y = centroY + sin(h) * scalar;           //  e vvai.... 
strokeWeight(5);
line(centroX, centroY, x, y);

scalar = 170;                            //Riportiamo a 170 il valore di scalar
noStroke();                                 // ombra al centro delle lancette
fill(180);
ellipse(centroX,centroY,15,15);


// ora le lancette...


noStroke();
centroX = width/2;                       // salviamo in memoria il centro dell'orologio
centroY = 520;
fill(255,0,0);
ellipse(centroX,centroY,15,15);        // cerchio al centro delle lancette

                                         // Inizio lancetta secondi

x = centroX + cos(s) * scalar;           // lancetta con inizio al centro, vertice X in centro x + coseno angolo moltipl. per la lunghezza lancetta secondi.
y = centroY + sin(s) * scalar;           // lancetta con inizio al centro, vertice Y in centro Y + seno angolo moltipl. per la lunghezza lancetta secondi.

stroke(255,0,0);
strokeWeight(3);
line(centroX, centroY, x, y);

                                         // inizio lancetta minuti, prima di tutto ridimensioniamo la lancetta...
                                        
scalar= 0.9 * scalar;                     // Dimensioniamo la lacetta dei minuti al 90% di quella dei secondi  

x = centroX + cos(m) * scalar;           // lancetta con inizio al centro, vertice X in centro x+coseno angolo moltipl. per lungh. lanc. minuti (scalar) e stesso per Y
y = centroY + sin(m) * scalar;           
strokeWeight(5);
line(centroX, centroY, x, y);
                                         // passiamo alle ore, ora è facile, copia e incolla..  

scalar= 0.8 * scalar;                     // lancetta delle ore al 80% di quella dei minuti 

x = centroX + cos(h) * scalar;           // lancetta con inizio al centro, vertice X in centro x+coseno angolo moltipl. per lungh. lanc. minuti (scalar) e stesso per Y
y = centroY + sin(h) * scalar;           //  e vvai.... 
strokeWeight(5);
line(centroX, centroY, x, y);
                                  

scalar = 170;                               // riportiamo a 170 il valore di scalar per il prossimo loop, altrimenti le lancette sarebbero sempre più piccole










}


