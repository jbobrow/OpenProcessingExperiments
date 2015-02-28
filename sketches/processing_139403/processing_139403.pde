
int linelength = 200;
int rcolor = int(random(0-255));
int gcolor = int(random(0-255));
int bcolor = int(random(0-255));

int[] x = new int[linelength];
int[] y = new int[linelength];



int [] r = new int [250];
int [] g = new int [254];
int  [] b = new int [252];

 




int counter =0;


void setup () {
  size(600, 600);
  background(255);
  smooth();
  

}




void draw() {
  stroke( 1, 1, 6);
  fill(150, 150, 25);


  if ( keyPressed ) {

    background(random(0,255),random(0, 255),random(0, 255));
  }

  int i =0;
  while ( i<x.length) {
    noStroke();
      fill (r[i], g[i], b[i],random(0,2000));
    ellipse (x[i], y[i], 40, 40);
    i = i + 1;
  }

  if (mousePressed) {
        fill(random(0,255),random(0, 255),random(0, 255));

    if (counter >=x.length) {
     
      x = expand (x);
      y = expand (y);
      r = expand(r);
      g = expand(g);
      b = expand(b);
     
    }
    x[counter] = mouseX;
    y[counter] = mouseY;
    r[counter] = round(random(200,255));
       g[counter] = round(random(100,250));
          b[counter] = round(random(102,255));
    
  }
  
   if (key == 'r') {
      r[counter] = round(random(0, 255));
      g[counter] = round(random(0,250));
      b[counter] = 0;
    }

  
 counter = counter +1;





    
    
  }
  
  
           

 




