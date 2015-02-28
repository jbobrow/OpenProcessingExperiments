
//Computing for the Arts with Processing homework 10
//Code copyright Stephanie Cheung, data belongs to exoplanet.eu

//display number of exoplanets found through gravitational microlensing
// sort by mass, year discovered and distance to star
//data from:
      //http://exoplanet.eu/catalog/?f=%22microlensing%22+IN+detection
//information on gravitational microlensing: 
      //http://en.wikipedia.org/wiki/Gravitational_microlensing
   
//zero time = 2004 These numbers are the years passed since 2004
    //for each discovery
float dates[] = { 4, 4, 5, 6, 6, 7, 9, 8, 8, 8, 1, 1, 
                  1, 3, 3, 3, 9, 8, 9, 8, 8, 9, 9, 0};
                  
//The mass of each planet compared to Jupiter
float mass[] = { .01, .9, .23, .0327, .157, 2.6, .029, 
                1.5, 4.8, 3.7, 3.5, .04, .017, .727, .271,
                .0694, 7.5, .96, 9.4, .11, .68, 1.85, 2.73, 2.6 };

//The distance of each planet to its parent star compared to
    //the distance from the Earth to the Sun (AU)
float dist[] = { 0.66, 0.85, 1.25, 3.2, 2.0, 1.8, .92, 2.0, 
                1.1, 8.3, 3.6, 2.8, 2.1, 2.3, 4.5, 3.3, .31, 
                3.86, .19, 3.82, 4.63, .87, 3.45, 5.1};
              
float [] amp; //distance from center of the screen to planet
              // determined by distance to star
float [] per; //speed of the planet, determined by distance to star
float [] rx;  // x position of planet
float [] ry;  // y position of planet
color [] col; // recently discovered planets are more opaque

float angle;


void setup () {
  size ( 800,800);
  rx = new float [dates.length];
  ry = new float [dates.length];
  amp = new float [dates.length];
  per = new float [dates.length];
  col = new color [dates.length];
  stroke(7, 129, 247);
}

void draw () {
smooth();
  background (0);
  drawPlanets();
}

void drawPlanets () {
 for (int i = 0; i < dates.length; i++) {
   amp [i] = dist[i]*75;
   per [i] = .00008*(1.0/dist[i]);
   rx [i] = 400 + amp[i]*sin((millis()*per[i])*(2*PI));
   ry [i] = 400 + amp[i]*cos((millis()*per[i])*(2*PI));
   col [i] = color(20*dates[i], 25*dates[i], 30*dates[i], 15*dates[i]);
   fill(col[i]);
   ellipse (rx[i], ry[i], mass[i]*15, mass[i]*15);
   // size of planet determined by the mass
 }
}



