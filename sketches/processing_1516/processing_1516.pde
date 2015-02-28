
//globale variablen

int spalte = 0; //spalte
int zeile = 0; //zeile
float h_grid = 63;  //breite der gitterzellen
float v_grid = 45;  //höhe der gitterzellen
float einheit = h_grid/7;  //kleinste kantenlänge
float strich = 2;  //strichstärke
  
float kante1, kante2, kante3; // konstanten für die verschiedenen kantenlängen
  
float mitte = 5*einheit;  //mittleres quadrat
float mitte2 = (7*einheit - mitte)/2;  //mittlere "beiquadrate"
int[] farbe = { #27387d, #000000, #da2016, #207264 }; //feld mit füllfarben


void setup(){
  size (623, 613);           //width: h_grid*9+28*strich, height: v_grid*13+14*strich;

  smooth();
  stroke(#A4B0D1);
  strokeWeight(strich);
  
  line(0, 0, width, 0);  //linien links und oben zeichnen
  line(0, 0, 0, height);
}


void draw(){   
  for(int j =0; j<13; j++ ){
    for(int i=0; i<9; i++){  
      zelle(int(spalte*(h_grid+3*strich)), int(zeile*(v_grid+strich)));
      spalte++;
    }   
    
  line(0, (zeile+1)*(v_grid+strich), width, (zeile+1)*(v_grid+strich));
  spalte = 0;
  zeile ++;
  mitte = map(zeile, 0, 12, (5*einheit), einheit);
  mitte2 = (7*einheit - mitte)/2;
  }
  noLoop();
}  


// zeichnen einer zelle 
void zelle(int x, int y){
    // berechnung der quadratgrössen
   if(spalte < 5){
     kante1 = map(spalte, 0, 4, 5*einheit, mitte2);
     kante2 = map(spalte, 0, 4, einheit, mitte); 
     kante3 = h_grid - kante1 -kante2;
   }else{
      kante3 = map(spalte, 4, 8, mitte2, 5*einheit);
      kante2 = map(spalte, 4, 8, mitte, einheit); 
      kante1 = h_grid - kante3 -kante2;
    }

    //quadrate und linien zeichnen
    
    fill(farbe[zeile%4]);
    strokeWeight(0);
    rect(x, y, kante1, kante1);
    strokeWeight(strich);
    stroke(#A4B0D1);
    line(x+kante1, y, x+kante1, y+v_grid+2);
    
    fill(farbe[(zeile+1)%4]);
    strokeWeight(0);
    rect(x+kante1+strich, y+v_grid/2-kante2/2, kante2, kante2);
    strokeWeight(strich);
    stroke(#A4B0D1);
    line(x+kante1+kante2+strich, y, x+kante1+kante2+strich, y+v_grid+2);
    
    fill(farbe[(zeile+2)%4]);
    strokeWeight(0);
    rect(x+kante1+kante2+2*strich, y+v_grid+strich-kante3, kante3, kante3); 
    strokeWeight(strich);
    stroke(#A4B0D1);
    line(x+h_grid+2*strich, y, x+h_grid+2*strich, y+v_grid+strich);
}



