
float wi, he;
float [] posx, posy, posz, magz, dif, sett, magx, magy;

void setup () {
  size (700,300);

  posx = new float [21];
  posy = new float [21];
  posz = new float [21];
  dif = new float [22];
  sett = new float [21];
  magx = new float [21];
  magy = new float [21];
  magz = new float [21];
  
  for (int q = 1; q < 21; q++) {
    posx[q] = random(width);
    posy[q] = random(height);
    posz[q] = random(-400,400);
    magx[q] = random(-1.0,1.0);
    magy[q]= random (-1.0,1.0);
    magz[q]= random (-1.0,1.0);
    
  }

}

void draw () {

  color black = color (0);
  color white = color (255);
    he = 0;
    wi = 0;
  loadPixels ();

  for (int i = 1; i < width*height; i++) 
  {
    wi++;
    if (wi>width) {
      wi = 1; 
      he++;
    }

    for (int q = 1; q<21;q++) {
      dif[q] = dist(he, wi, 0, posy[q], posx[q], posz[q]);
    
    }


for (int ich = 0; ich < sett.length; ich++) {
 sett[ich] = dif[ich];
}

    sett = sort(sett);



    for (int n = 20; n >1; n--) {
      for (int m = 0; m < n-2; m++) {        
        sett [m] = sett[m+1]-map(sett[m+2]-sett[m], 0,450,0,sett[m+2]);
      }
      sett = sort (sett);
    }

  pixels [i] = color (sett[1]);

    
  }

  for (int q = 1; q < 21; q++) {
    posx[q] += magx[q];
    posy[q] += magy[q];
    if (posx[q] >= width || posx[q] < 1) {
      magx[q] = -magx[q];
    }
    if (posy[q] >= height || posx[q] < 1) {
      magy[q] = -magy[q];
    }
    if (posz[q] >= 600 || posx[q] < -600) {
      magy[q] = -magy[q];
    }
  }

  updatePixels ();
}


