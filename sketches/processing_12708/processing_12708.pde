
Table dataTable;

int rowCount;
int[] colors = { 0, 127, 255, 0};

void setup() {
  size(550, 600);
  background(212);
  
  dataTable = new Table("DatasetInternetToegang.tsv");
  rowCount = dataTable.getRowCount();
  
  drawBars();
  drawLegenda();
}

void drawBars() {
smooth();
  for (int row = 1; row < rowCount; row++) {
    noStroke();
    int Year = dataTable.getInt(row, 0);
    float x1 = dataTable.getFloat(row, 1)*4;
    float x2 = dataTable.getFloat(row, 2)*4;
    float x3 = dataTable.getFloat(row, 3)*4;
    
    fill(colors[0]);
    text(Year, 50, row*50+17);
    
    fill(colors[1]);
    rect(100, row*50, x1, 25); //Percentage met internettoegang thuis
    fill(colors[2]);
    rect(100+x1, row*50, x2, 25);//Percentage met internettoegang elders
    fill(colors[3]); 
    rect(100+x1+x2, row*50, x3, 25); //Percentage zonder internettoegang
    noFill();
    stroke(0);
    rect(100, row*50, 400, 25); //blok van 100%
  }
}

void drawLegenda(){
  for (int c=1; c < 4; c++){
    stroke(0);
    fill(colors[c]);
    rect(250, rowCount*50+(c-1)*30, 25, 25); //legenda boxjes met kleur
    fill(colors[0]);
    text(dataTable.getString(0, c), 280, rowCount*50+(c-1)*30+17); //legenda info
  }
  text("Bron: CBS", 20, 10+rowCount*50);
  text("0%", 100, 48);
  text("100%", 500, 48);
  
  PFont myFont = createFont("FFScala", 20);
  textFont(myFont);
  text("Internettoegang bevolking Nederland", 10, 25);
}


