
// LIBRARIES


// GLOBAL VARIABLES
PShape baseMap;
String csv[];
String myData[][];
String csv2[];
String myData2[][];
PFont f, f2;
int cantAnual = 1;
int inicio = 1900;
int fin = 2000;


// SETUP
void setup() {
  size(1024, 700);
  f = createFont("Arial", 12);
  f2 = createFont("Arial", 10);
  baseMap = loadShape("WorldMap.svg");
  csv = loadStrings("MeteorStrikes.csv");
  myData = new String[csv.length][6];
  for(int i=0; i<csv.length; i++) {
    myData[i] = csv[i].split(",");
  }

  csv2 = loadStrings("MeteorStrikes-anual.csv");
  myData2 = new String[csv2.length][6];
  for(int i=0; i<csv2.length; i++) {
    myData2[i] = csv2[i].split(",");
  }
}


// DRAW
void draw() {
  shape(baseMap, 0, 0, width, 512);
  noStroke();
  
  
  //Lee los datos y los asigna a variables
  for(int i=0; i<myData.length; i++){
    fill(255, 0, 0, 50);
    textMode(MODEL);
    noStroke();
    float graphLong = map(float(myData[i][3]), -180, 180, 0, width);
    float graphLat = map(float(myData[i][4]), 90, -90, 0, 512);
    float markerSize = 0.05*sqrt(float(myData[i][2]))/PI;
    int yr = int(myData[i][1]);


    //Muestra los datos cronológicamente al mover el ratón
    if(yr < map (mouseX,0,width,inicio,fin) && yr>inicio){
      //Dibuja cada círculo
      ellipse(graphLong, graphLat, markerSize, markerSize);
      //Dibuja la leyenda en algunos datos
      if(i<20){
        fill(0);
        textFont(f);
        text(myData[i][0], graphLong + markerSize + 5, graphLat + 4);
        noFill();
        stroke(0);
        line(graphLong+markerSize/2, graphLat, graphLong+markerSize, graphLat);
      }
    }

  }

  //Lee los datos del segundo dataset y los asigna a variables
  //Gráfico 2: número anual de meteoritos
  for(int i=1; i<myData2.length; i++){
    fill(#666666);
    noStroke();
    float xPos = map(float(myData2[i][1]), inicio, fin, 0, width);
    float yPos = 540+cantAnual/25;
    int yr = int(myData2[i][1]);
    if(int(myData2[i][1]) == int(myData2[i-1][1])){cantAnual++;} else {noFill();cantAnual=1;}
    noStroke();
    rect(xPos, yPos, 8, 1);
    textFont(f2);
    pushMatrix();
      translate(xPos, 540);
      rotate(-HALF_PI);
      fill(255);
      rect(0,0,30,8);
      fill(125);
      text(myData2[i][1], 4, -4);
    popMatrix();
  }

}
