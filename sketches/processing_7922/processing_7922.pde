
int misura = 400;
int quanti = 10;

int lato = misura/quanti;
int caso = int(random(misura));
int col = caso;
int sat = caso;
int bri = caso;
boolean verso = true;

int i = 0;
int j = 0;

void setup(){
  size (misura, misura);
  noStroke();
  colorMode(HSB, misura);   
  frameRate(31);
}



void draw(){
  if (col > misura ){
    verso = false;
  } 
  else if (col < 0){
    verso = true;
  }

  if (verso) {
    col++;
  } 
  else {
    col--;
  }
  println(col);

  if (i < misura){
    i = i + lato;
    if (j < misura){
      j = j + lato;
    } 
    else {
      j = 0;
    }
  } 
  else {
    i = 0;
  }
  quadrato(i,j,col,col,col,misura-j);
}


void quadrato(int posx, int posy, int col, int sat, int bri, int trans){
  pushMatrix();
  int miniValue = int(random(misura/3));
  translate(posx, posy);
  fill (col,sat,bri,trans);
  triangle(0, 0, lato/2, lato/2, lato, 0);
  fill (col-miniValue,sat,bri,trans);
  triangle(lato, 0, lato/2, lato/2, lato, lato);
  fill (col,sat-miniValue,bri,trans);
  triangle(lato, lato, lato/2, lato/2, 0, lato);
  fill (col,sat,bri-miniValue,trans+miniValue);
  triangle(0, 0, lato/2, lato/2, 0, lato);
  popMatrix();
}

