
//Athos Bulcão
//Azulejaria, BElo Horizonte, Setembro 2013

int cols, lins;

void setup() {
  size(900, 450);
  cols=24;
  lins=12;
  smooth();
  mousePressed();
}
void draw() {
  
  if(random(1)>.98) mousePressed();
}

void mousePressed() {
  background(255);
  cols=int(random(2, 20));
  lins=int(random(2, 20));
  noStroke();
float white=.0;//quanto mais proximo de .5 maior a porcentagem de brancos
  for (int j=0; j<lins; j++) { 
    for (int i=0; i<cols; i++) { 
      fill(255*round(random(white, 1)));
      triangle(i*width/cols, j*height/lins, (i+1)*width/cols, j*height/lins, i*width/cols, (j+1)*height/lins);
      fill(255*round(random(white, 1)));
      triangle((i+1)*width/cols, (j+1)*height/lins, (i+1)*width/cols, j*height/lins, i*width/cols, (j+1)*height/lins);
    }
  }
  stroke(200);
  strokeWeight(.5);
   for (int j=0; j<cols; j++) { 
     line(j*width/cols,0,j*width/cols,height);
   }
    for (int i=0; i<lins; i++) { 
      line(0,i*height/lins,width,i*height/lins);
    }
}
