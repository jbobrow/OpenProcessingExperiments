
void drawmatrix(int i) 
{    // disegno matrice con scritta
  if (first==0) {i=first; first=1;}
  String[] motto = {
    "G", "R", "E", "Y", "M", "A", "T", "T", "E", "R", "W", "A", "N", "T", "E", "D"
  };
  for (int y=0; y<331; y+=110) { // 4 rows
    for (int x = 0; x<331; x+=110) { // 4 colums 
      if (i>15) { 
        i=0;
      }
      ff = int(map(i, 0, 15, 230, 30));
      fill(ff, 255); // set grey value of cell
      rect(x, y, x+110, y+110);
      fill(255-ff); // visible within cell's greyscale coming from map()
      textSize(95);
      text(motto[i++], x, y, 110, 110);
    }
  }
  gmwmat = createImage(width, height, RGB); // creo buffer
  gmwmat = get(); // catturo matrice
  image(gmwmat, 0, 0); // visualizzo
  noLoop();
}

