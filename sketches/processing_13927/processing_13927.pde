

// Energy Consumption in Australia by Industry

int[] agriculture;
int[] mining;
int[] manufacturing;
int[] generation;
int[] construction;
int[] transport;
int[] commercial;
int[] residential;
int[] other;

int margin = 80;
int marginY = 80;
int scaleRatio = 13;
float heightRatio = 4;
int textStartPosY = 480;
int textStartPosX = 620;
int spacer = 20;
 

PFont font;

void setup(){
  size(800, 600);
  background(255);
  font = createFont("Arial",12);
  textFont(font,12);
  loadData();
  
}

void draw(){
  background(255);
  smooth();
  strokeWeight(1);
  legend();
  //noFill();
  
  for (int startyear = 1; startyear < 36*scaleRatio ; startyear += 5*scaleRatio){
    stroke(0, 50);
    line(margin + startyear, height - 60, margin + startyear, 50);
    fill(0, 100);
    text (startyear/scaleRatio + 1972, margin + startyear + 5, height - 60);
  }
  
  for (int ht = 1; ht < 1750/heightRatio; ht += 500/heightRatio){
    stroke(0, 50);
    line(margin - 50, height - (marginY + ht), 550, height - (marginY + ht));
  }
  text("0 PJ", margin - 50, height - marginY - 5);
  text("500 PJ", margin - 50, height - (marginY + 500/heightRatio +5));
  text("1000 PJ", margin - 50, height - (marginY + 1000/heightRatio+5));
  text("1500 PJ", margin - 50, height - (marginY + 1500/heightRatio+5));
  
  
  textAlign(LEFT);
  fill(0);
  text("ENERGY CONSUMPTION", textStartPosX - 14, height - 88);
  text("IN AUSTRALIA", textStartPosX - 14, height - 74);
  text("BY INDUSTRY (PICOJOULE)", textStartPosX - 14, height - 60);
  
  
  beginShape();
  for (int i = 1; i < agriculture.length; i++){
    stroke(0, 255, 0);
    int consumption = agriculture[i]; 
    int startPos = agriculture[1];
    vertex(margin + i*scaleRatio, -consumption/heightRatio + (height - marginY));
    ellipse(margin + i*scaleRatio, -consumption/heightRatio + (height - marginY), 2, 2);
    noFill();
    //fill(0);
  }  
  endShape();
  
  beginShape();
  for (int i = 1; i < mining.length; i++){
    stroke(255, 0, 0);
    int consumption = mining[i];
    int startPos = mining[1];
    vertex(margin + i*scaleRatio, -consumption/heightRatio + (height - marginY));
    ellipse(margin + i*scaleRatio, -consumption/heightRatio + (height - marginY), 2, 2);
    noFill();
    //fill(255, 0, 0);
  }
  endShape();
  
  beginShape();
  for (int i = 1; i < manufacturing.length; i++){
    stroke(0, 0, 255);
    int consumption = manufacturing[i];
    int startPos = manufacturing[1];
    vertex(margin + i*scaleRatio, -consumption/heightRatio + (height - marginY));
    ellipse(margin + i*scaleRatio, -consumption/heightRatio + (height - marginY), 2, 2);
    noFill();
    //fill(255, 0, 0);
  }
  endShape();
  
  beginShape();
  for (int i = 1; i < generation.length; i++){
    stroke(0, 255, 255);
    int consumption = generation[i];
    int startPos = generation[1];
    vertex(margin + i*scaleRatio, -consumption/heightRatio + (height - marginY));
    ellipse(margin + i*scaleRatio, -consumption/heightRatio + (height - marginY), 2, 2);
    noFill();
    //fill(255, 0, 0);
  }
  endShape();
  
  beginShape();
  for (int i = 1; i < construction.length; i++){
    stroke(255, 0, 255);
    int consumption = construction[i];
    int startPos = construction[1];
    vertex(margin + i*scaleRatio, -consumption/heightRatio + (height - marginY));
    ellipse(margin + i*scaleRatio, -consumption/heightRatio + (height - marginY), 2, 2);
    noFill();
    //fill(255, 0, 0);
  }
  endShape();
  
  beginShape();
  for (int i = 1; i < transport.length; i++){
    stroke(255, 255, 0);
    int consumption = transport[i];
    int startPos = transport[1];
    vertex(margin + i*scaleRatio, -consumption/heightRatio + (height - marginY));
    ellipse(margin + i*scaleRatio, -consumption/heightRatio + (height - marginY), 2, 2);
    noFill();
    //fill(255, 0, 0);
  }
  endShape();
  
  beginShape();
  for (int i = 1; i < commercial.length; i++){
    stroke(50, 200, 150);
    int consumption = commercial[i];
    int startPos = commercial[1];
    vertex(margin + i*scaleRatio, -consumption/heightRatio + (height - marginY));
    ellipse(margin + i*scaleRatio, -consumption/heightRatio + (height - marginY), 2, 2);
    noFill();
    //fill(255, 0, 0);
  }
  endShape();
  
  beginShape();
  for (int i = 1; i < residential.length; i++){
    stroke(100, 200, 50);
    int consumption = residential[i];
    int startPos = residential[1];
    vertex(margin + i*scaleRatio, -consumption/heightRatio + (height - marginY));
    ellipse(margin + i*scaleRatio, -consumption/heightRatio + (height - marginY), 2, 2);
    noFill();
    //fill(255, 0, 0);
  }
  endShape();
  
  beginShape();
  for (int i = 1; i < other.length; i++){
    stroke(0);
    int consumption = other[i];
    int startPos = other[1];
    vertex(margin + i*scaleRatio, -consumption/heightRatio + (height - marginY));
    ellipse(margin + i*scaleRatio, -consumption/heightRatio + (height - marginY), 2, 2);
    noFill();
    //fill(255, 0, 0);
  }
  endShape();
}

void loadData(){
  
  String[] data_in = loadStrings("data.csv"); 
  
  agriculture = new int[data_in.length]; // make our agriculture array
  mining = new int[data_in.length]; // make our mining array 
  manufacturing = new int[data_in.length]; // make our mining array 
  generation = new int[data_in.length]; // make our mining array 
  construction = new int[data_in.length]; // make our mining array 
  transport = new int[data_in.length]; // make our mining array 
  commercial = new int[data_in.length]; // make our mining array 
  residential = new int[data_in.length]; // make our mining array 
  other = new int[data_in.length]; // make our mining array 
  
  
  for (int i = 1; i < data_in.length; i++  ){ // start at 1 - skip the first row
      // split the data apart
      String line = data_in[i]; // this line of the data
      String[] bits = line.split(","); // split this line at the commas
      
      String agricultureConsumption = bits[1];
      agriculture[i] = int(agricultureConsumption);
      
      String miningConsumption = bits[2];
      mining[i] = int(miningConsumption);
      
      String manufacturingConsumption = bits[3];
      manufacturing[i] = int(manufacturingConsumption);
      
      String generationConsumption = bits[4];
      generation[i] = int(generationConsumption);
      
      String constructionConsumption = bits[5];
      construction[i] = int(constructionConsumption);
      
      String transportConsumption = bits[6];
      transport[i] = int(transportConsumption);
      
      String commercialConsumption = bits[7];
      commercial[i] = int(commercialConsumption);
      
      String residentialConsumption = bits[8];
      residential[i] = int(residentialConsumption);
      
      String otherConsumption = bits[9];
      other[i] = int(otherConsumption);
      
      
      
      //println(bits[1]);
      
  }
  
}


