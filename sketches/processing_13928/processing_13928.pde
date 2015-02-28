
// Energy Consumption in Australia by Industry

int[] agricultureData;
int[] miningData;
int[] manufacturingData;
int[] generationData;
int[] constructionData;
int[] transportData;
int[] commercialData;
int[] residentialData;
int[] otherData;
int[] totalData;
Bar[] agricultureBars; //delcare the object
Bar[] miningBars; //delcare the object
Bar[] manufacturingBars; //delcare the object
Bar[] generationBars; //delcare the object
Bar[] constructionBars; //delcare the object
Bar[] transportBars; //delcare the object
Bar[] commercialBars; //delcare the object
Bar[] residentialBars; //delcare the object
Bar[] otherBars; //delcare the object
Bar[] totalBars; //delcare the object

int w = 20;
int widthRatio = 13;
int startX = 50;
int startY = 550;
PFont font;
PFont fontBold;
color c;
boolean over = false;


void setup(){
  size(800, 600);
  background(255);
  smooth();
  font = createFont("MyriadPro-Regular",12);
  fontBold = createFont("MyriadPro-Semibold",12);
  
  String[] data_in = loadStrings("data.csv");   // loading in the csv file

  // creating a new arrays
  agricultureData = new int[data_in.length]; 
  miningData = new int[data_in.length]; 
  manufacturingData = new int[data_in.length]; 
  generationData = new int[data_in.length]; 
  constructionData = new int[data_in.length];  
  transportData = new int[data_in.length];  
  commercialData = new int[data_in.length];  
  residentialData = new int[data_in.length];
  otherData = new int[data_in.length];
  totalData = new int[data_in.length];
  
  for (int i = 1; i < data_in.length; i++){// start at 1 - skip the first row
     String thisLine = data_in[i]; // split the data apart into lines
     String[] bits = thisLine.split(","); // split this line at the commas
     
     String agricultureConsumption = bits[1]; 
     agricultureData[i] = int(agricultureConsumption); // store this line into the agricultureData array

     
     String miningConsumption = bits[2];
     miningData[i] = int(miningConsumption); // store this line into the miningData array
     
     String manufacturingConsumption = bits[3];
     manufacturingData[i] = int(manufacturingConsumption);
     
     String generationConsumption = bits[4];
     generationData[i] = int(generationConsumption);
      
    String constructionConsumption = bits[5];
    constructionData[i] = int(constructionConsumption);
      
    String transportConsumption = bits[6];
    transportData[i] = int(transportConsumption);
    
    String commercialConsumption = bits[7];
    commercialData[i] = int(commercialConsumption);
      
    String residentialConsumption = bits[8];
    residentialData[i] = int(residentialConsumption);
      
    String otherConsumption = bits[9];
    otherData[i] = int(otherConsumption);
    
    String totalConsumption = bits[10];
    totalData[i] = int(totalConsumption);
  }
  
  agricultureBars = new Bar[19];
  for (int i = 1; i < agricultureBars.length; i++){
    agricultureBars[i] = new Bar(startX + w*i + i*2, startY, agricultureData[i]);  
  }
  miningBars = new Bar[19];
  for (int i = 1; i < miningBars.length; i++){
    miningBars[i] = new Bar(startX + w*i + i*2, startY - agricultureData[i]/widthRatio, miningData[i]); 
  }
  manufacturingBars = new Bar[19];
  for (int i = 1; i < manufacturingBars.length; i++){
    manufacturingBars[i] = new Bar(startX + w*i + i*2, startY - agricultureData[i]/widthRatio - miningData[i]/widthRatio, manufacturingData[i]);  
  }
  generationBars = new Bar[19];
  for (int i = 1; i < generationBars.length; i++){
    generationBars[i] = new Bar(startX + w*i + i*2, startY - agricultureData[i]/widthRatio - miningData[i]/widthRatio - manufacturingData[i]/widthRatio, generationData[i]);
  }
  constructionBars = new Bar[19];
  for (int i = 1; i < constructionBars.length; i++){
    constructionBars[i] = new Bar(startX + w*i + i*2, startY - agricultureData[i]/widthRatio - miningData[i]/widthRatio - manufacturingData[i]/widthRatio - generationData[i]/widthRatio, 
    constructionData[i]);
  }  
  transportBars = new Bar[19];
  for (int i = 1; i < transportBars.length; i++){
    transportBars[i] = new Bar(startX + w*i + i*2, startY - agricultureData[i]/widthRatio - miningData[i]/widthRatio - manufacturingData[i]/widthRatio - generationData[i]/widthRatio 
    - constructionData[i]/widthRatio, transportData[i]);
  }
  commercialBars = new Bar[19];
  for (int i = 1; i < commercialBars.length; i++){
    commercialBars[i] = new Bar(startX + w*i + i*2, startY - agricultureData[i]/widthRatio - miningData[i]/widthRatio - manufacturingData[i]/widthRatio - generationData[i]/widthRatio 
    - constructionData[i]/widthRatio - transportData[i]/widthRatio, commercialData[i]);
  }
  residentialBars = new Bar[19];
  for (int i = 1; i < residentialBars.length; i++){
    residentialBars[i] = new Bar(startX + w*i + i*2, startY - agricultureData[i]/widthRatio - miningData[i]/widthRatio - manufacturingData[i]/widthRatio - generationData[i]/widthRatio 
    - constructionData[i]/widthRatio - transportData[i]/widthRatio - commercialData[i]/widthRatio, residentialData[i]);
  }
  otherBars = new Bar[19];
  for (int i = 1; i < otherBars.length; i++){
    otherBars[i] = new Bar(startX + w*i + i*2, startY - agricultureData[i]/widthRatio - miningData[i]/widthRatio - manufacturingData[i]/widthRatio - generationData[i]/widthRatio 
    - constructionData[i]/widthRatio - transportData[i]/widthRatio - commercialData[i]/widthRatio - residentialData[i]/widthRatio, otherData[i]);
  }
  totalBars = new Bar[19];
  for (int i = 1; i < totalBars.length; i++){
    totalBars[i] = new Bar(startX + w*i + i*2, startY, totalData[i]);
    }
    
    
    

}

void draw(){
  background(255);
  graph();
  startText(); 
  legendText();

    
  for (int i = 1; i < agricultureBars.length; i++){
    c = color(0);
    fill(c);
    agricultureBars[i].render();  
  }
  for (int i = 1; i < miningBars.length; i++){
    c = color(98, 77, 69);
    fill(c);
    miningBars[i].render();  
  }
  for (int i = 1; i < manufacturingBars.length; i++){
    c = color(144, 87, 69);
    fill(c);
    manufacturingBars[i].render();  
  }
  for (int i = 1; i < generationBars.length; i++){
    c = color(190, 79, 56);
    fill(c);
    generationBars[i].render();
  }
  for (int i = 1; i < constructionBars.length; i++){
    c = color(237, 28, 36);
    fill(c);
    constructionBars[i].render();
  }
  for (int i = 1; i < transportBars.length; i++){
    c = color(241, 91, 64);
    fill(c);
    transportBars[i].render();
  }
  for (int i = 1; i < commercialBars.length; i++){
    c = color(245, 132, 102);
    fill(c);
    commercialBars[i].render();
  }
  for (int i = 1; i < residentialBars.length; i++){
    c = color(249, 170, 143);
    fill(c);
    residentialBars[i].render();
  }
  for (int i = 1; i < otherBars.length; i++){
    c = color(252, 211, 193);
    fill(c);
    otherBars[i].render();
  }

}




