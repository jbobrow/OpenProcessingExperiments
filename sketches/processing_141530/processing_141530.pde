
// Esercizio 3.1 Fire Barrier
// Liberamente ispirato da 2 opere di Klee
// Fire in the Evening, Fish Magic.
// Davide Mannarelli
// Accademia di Belle Arti di Brera - NTA1

// File source: http://commons.wikimedia.org/

/* @pjs preload="Fire_in_the_Evening.jpg,Fish_Magic.jpg"; */

PImage fire = loadImage("Fire_in_the_Evening.jpg"); //640x660
PImage fish = loadImage("Fish_Magic.jpg"); //640x500

size(640,500);
background(fish);

for ( int x=0 ; x<=640 ; x+=10 ) {
  copy( fire, x,0, 2,500, x,0, 2,500 );
}



