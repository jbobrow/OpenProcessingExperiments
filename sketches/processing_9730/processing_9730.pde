
Table aTable;
PFont Calibri;

int rowCount, legenda;
float y, ellipseX, ellipseY, rasterbreedte;

float plotX1, plotY1;
float plotX2, plotY2;
boolean mouseover;
public float mouseWaarde;

float [][] f = {  
  {255, 0, 0},
  {0, 255, 0}, 
  {0, 0, 255}, 
  {255, 0, 255},
  {255, 0, 0},  
  {255, 255, 0}};


void setup(){
  //Algemeen
  size(600,600);
  mouseover = false;  
  //Inladen..
  Calibri = loadFont("Calibri-48.vlw");
  textFont(Calibri, 20);
  aTable= new Table("data.tsv");
  rowCount = aTable.getRowCount();
  
  //Plot gegevens
  plotX1 = 60;
  plotX2 = 400;
  plotY1 = 40;
  plotY2 = height - plotY1;
  
  //Breedte van raster en bepaling van legenda
  rasterbreedte = plotX2/rowCount;
  legenda = width - 160;
}

void draw(){
  smooth();
  background(224);
  
  //Teken de witte vlakken
  fill(255);
  rect(3, 4,415 , 585);
  rect(425, 4, 165, 150);
  
  //Roep de functies aan
  ellipseX = 0; 
  ellipseY = 0;
  tekenRaster();
  tekenLegenda();
  tekenJaartal();
  tekenAantal();
  tekenData();
  if (mouseover == true){
    mouseOver(mouseWaarde);
  }
  mouseover = false;
}

void tekenData(){
  //dubbele loop om data uit alle velden te halen
     for (int jaar = 0; jaar < 6; jaar++){
        for(int row = 1; row < rowCount; row++){
          float y = aTable.getFloat(row,jaar);
          fill(f[jaar][0], f[jaar][1], f[jaar][2]);
          float ellipseX = row*rasterbreedte+40;
          float ellipseY = ((plotY2)-(y*0.4));
          ellipse(ellipseX, ellipseY , 7, 7);
            if( dist ( ellipseX, ellipseY, mouseX, mouseY) < 6){
              //Als de muis over een data punt gaat..
             mouseWaarde = y;
             mouseover = true; 
            }
            
        }
                   
      }
}

void tekenRaster(){
  //Vertikale lijnen
  for(int row = 1; row < 11; row++){
    line(row*rasterbreedte, 20, row*rasterbreedte, plotY2); 
  }

  for(int i = 1; i < 29; i++){
    //Horizontale lijnen
    line(40,i*20,400,i*20); 
  }
}

void tekenLegenda(){

  fill(0);
  text("Legenda:", legenda, 20);
  text("15 jaar en jonger", legenda+27, 42);
  text("16 jaar", legenda+27, 67);
  text("17 jaar", legenda+27, 92);
  text("18 jaar", legenda+27, 117);
  text("19 jaar", legenda+25, 142);

  for(int i = 0; i < 5; i++){ 
    fill(f[i+1][0], f[i+1][1], f[i+1][2]);
    rect(legenda, 25+(i*25), 20, 20);
  }
}

void tekenJaartal(){
  fill(0);
  textFont(Calibri, 17);
  for(int i = 0; i < 9; i++){
    int jaartal= 2000 + (i*1);
    text(jaartal, (i*rasterbreedte)+60, plotY2+20);    
  }
}

void tekenAantal(){
  fill(0);
  for(int i = 0; i < 28; i++){
    int aantal= 0 + (i*50);
    text(aantal,6 , 565-(i*20));
  }
}

void mouseOver(float a){
  fill(150);
  rect(mouseX+10,mouseY-20, 225, 20 );
  fill(255);
  text(("Aantal tienermoeders: " + a) , mouseX+13, mouseY-14, 400, 50);

}


