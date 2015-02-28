


// Arrays

float [] posx = new float [200];
float [] posy = new float [200];
int [] dirx = new int [200];
int [] diry = new int [200];
color[] col = new color [200];

void setup () {
  size (320, 240);
  smooth();


  int counter = 0;

  while (counter < 200){
    
    posx[counter] = random (width);
    posy[counter] = random (height);
    dirx[counter] = 1;
    diry[counter] = 1;
    col[counter] = color (random (180), (29), (3));
  
    counter = counter + 1;
  }
}

void draw () {
  background (255);
  fill (0);
  noStroke ();

  int counter = 0;
  while (counter < 200) {

    posx[counter] = posx [counter] + (random (10) * dirx[counter]);
    posy[counter] = posy[counter] + (random (1) * diry[counter]);

    if (posx[counter] > width || posx[counter] < 0) {
      dirx[counter] = dirx[counter] * -1;
    }
    if (posy[counter] > height || posy[counter] < 0) {
      diry[counter] = diry[counter] * -1;
    }
    fill (col[counter]);
    rect (posx[counter], posy[counter], 20, 20); 
    counter = counter + 1;
    
    //ellipse (posx[counter], posy[counter], 20, 20); 
    //counter = counter + 1;
  }
}


