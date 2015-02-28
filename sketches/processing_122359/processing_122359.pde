
// JOY DIVISION 

// variables globals
PFont font, font2;
int sx, sy;
float densitat = 0.9;
int [][] mon;
int [][] copia;
int sizeCell = 8;
color [] paleta = {
  #2f2f2f, #5f5f5f, #afafaf, #efefef
}; 

void setup() {

  // carreguem la font
  font = loadFont("data/HelveticaNeue-Light-16.vlw");
  font2 = loadFont("data/Helvetica-Bold-18.vlw");
  // mida de la caratula
  size(512, 512);
  sx = width / sizeCell;
  sy = height / sizeCell;

  mon = new int[sx][sy];
  copia = new int[sx][sy];

  // creem el món en funció de la densitat
  // asignem valors de 1 a les cel·les amb vida 
  println(mon[0][0]);
  for (int i = 0; i < sx * sy * densitat; i++)
  {
    mon[(int)random(sx)][(int)random(sy)] = 1;
  }



  // frame rate
  frameRate(15);
  

}

void draw()
{
  // pintem el fons
  background(0);
  // dibuixem la lletra
  stroke(#efefef);
  textFont(font, 12);
  textAlign(CENTER);
  text("JOY DIVISION", width/2, height * 0.7); 
  textFont(font2, 14);
  textAlign(CENTER);
  text("UNKNOWN PLEASURES", width * 0.5, height * 0.73);
  // pintem les "cel·les" 


  // pintem les línies blanques :)
  for (int y = 0; y < 64; y ++)
  {
     stroke(#efefef);
     strokeWeight(random(0, 1));
     line(width/2 - 32, height/2 - 48 + (y * 2), width/2 + 32,  height/2 - 48 + (y * 2));
  }


  for (int x = 0; x < sx; x++) {
    for (int y = 0; y < sy; y++) {
      if (mon[x][y] == 1 || (mon[x][y] == 0 && copia[x][y] == 1))
      {
        // desem l'estat de la cel·la en la còpia del món
        copia[x][y] = 1;

        // dibuixem les línies i fem un clipping
        if (x > 16 && x < 48 && y > 16 && y < 48) {
          // pintem la cel·la de color si està viva
          //rect(x * sizeCell, y * sizeCell, sizeCell, sizeCell);
          // color de les cel·les vives
          stroke(paleta[(int)random(4)]);
          strokeWeight(random(0, 1));
          line(x * sizeCell, y * sizeCell, x * sizeCell + (sizeCell * random(-1, 1)), y * sizeCell + (sizeCell  * random(-1, 1)));
        }
      }
      if (mon[x][y] == -1)
      {
        copia[x][y] = 0;
      }
      mon[x][y] = 0;
    }
  }

  // regles del joc
  for (int x = 0; x < sx; x++) {
    for (int y = 0; y < sy; y++) {
      int count = veins(x, y);
      // tres veins vius donem vida
      if  (count == 3 && copia[x][y] == 0)
      {
        mon[x][y] = 1;
      } 
      // però... si tenim vida i té pocs veins o massa veins
      if ((count < 2 || count > 3) && copia[x][y] == 1)
      {
        mon[x][y] = -1;
      }
    }
  }
} // final de draw()


// funció que calcua els veïns o cel·les adjacents
int veins(int x, int y) {
  /*
  cell0, cell1, cell2
   cell3, XXXXX, cell4
   cell5, cell6, cell7
   */

  /* explicar 
   el problema de las celdas 0 o 320
   0 - 1 = -1 ? error
   0 + 320 - 1 = 319 % 320 = 319 ;)
   */

  int cell0 = copia[(x + sx - 1) % sx][(y + sy - 1) % sy];
  int cell1 = copia[x][(y + sy - 1) % sy];
  int cell2 = copia[(x + sx + 1) % sx][(y + sy -1) % sy];
  int cell3 = copia[(x + sx - 1) % sx][y];
  int cell4 = copia[(x + sx + 1) % sx][y];
  int cell5 = copia[(x + sx - 1) % sx][(y + sy + 1) % sy];
  int cell6 = copia[x][(y + sy + 1) % sy];
  int cell7 = copia[(x + sx + 1) % sx][(y + sy + 1) % sy];

  return cell0 + cell1 + cell2 + cell3 + cell4 + cell5 +
    cell6 + cell7;
}




