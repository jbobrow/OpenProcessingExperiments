
Table dataTable;

int rowCount;
int[] colors = { 0, 127, 255, 0, 65};
float[] numbers1, zeros1, dxs1;
float[] numbers2, zeros2, dxs2;
float[] numbers3, zeros3, dxs3;

float easing=0.05;

void setup() {
  frameRate(30);
  size(600, 600);
  background(212);
   
  dataTable = new Table("DatasetInternetToegang.tsv");
  rowCount = dataTable.getRowCount();
    
   numbers1 = new float[rowCount];
   numbers2 = new float[rowCount];
   numbers3 = new float[rowCount];
   zeros1 = new float[rowCount];
   zeros2 = new float[rowCount];
   zeros3 = new float[rowCount];
   dxs1 = new float[rowCount];
   dxs2 = new float[rowCount];
   dxs3 = new float[rowCount];
   
   for(int r = 1; r < rowCount; r++){
     numbers1[r]=dataTable.getFloat(r, 1)*4;
     numbers2[r]=dataTable.getFloat(r, 2)*4;
     numbers3[r]=dataTable.getFloat(r, 3)*4;
     zeros1[r]=0;
     zeros2[r]=0;
     zeros3[r]=0;
   } 
}

void draw() {
smooth();
background(212);
 for (int row = 1; row < rowCount; row++) {
   
   dxs1[row] = numbers1[row]-zeros1[row];
   dxs2[row] = numbers2[row]-zeros2[row];
   dxs3[row] = numbers3[row]-zeros3[row];
   
   noStroke();
    int Year = dataTable.getInt(row, 0);
    float x1 = dataTable.getFloat(row, 1)*4;
    float x2 = dataTable.getFloat(row, 2)*4;
    float x3 = dataTable.getFloat(row, 3)*4;


if(dxs1[row]>.1){
  zeros1[row] += dxs1[row] * easing;
}

  fill(colors[1]);
  rect(100, row*50, zeros1[row], 25);//Percentage met internettoegang thuis
  
if(dxs2[row]>.1){
  zeros2[row] += dxs2[row] * easing;
}

  fill(colors[2]);
  rect(100+numbers1[row], row*50, zeros2[row], 25);//Percentage met internettoegang elders
  
if(dxs3[row]>.1){
  zeros3[row] += dxs3[row] * easing;
}

  fill(colors[3]);
  rect(100+numbers1[row]+numbers2[row], row*50, zeros3[row], 25);//Percentage zonder internettoegang  
  
  if (mouseX>100 && mouseX<100+numbers1[row] && mouseY>row*50 && mouseY<row*50+25){
    fill(colors[4]);
    text(int(numbers1[row]/4)+"%",mouseX-10,mouseY);
  }
  if (mouseX>100+numbers1[row] && mouseX<100+numbers1[row]+numbers2[row] && mouseY>row*50 && mouseY<row*50+25){
    fill(colors[4]);
    text(int(numbers2[row]/4)+"%",mouseX-10,mouseY);
  }
  if (mouseX>100+numbers1[row]+numbers2[row] && mouseX<100+numbers1[row]+numbers2[row]+numbers3[row] && mouseY>row*50 && mouseY<row*50+25){
    fill(colors[4]);
    text(int(numbers3[row]/4)+"%",mouseX-10,mouseY);
  }
  
    
    fill(colors[0]);
    text(Year, 50, row*50+17);

    noFill();
    stroke(0);
    rect(100, row*50, 400, 25); //blok van 100%
  }
  drawLegenda();
}

void drawLegenda(){
  PFont smallFont = createFont("FFScala", 15);
  textFont(smallFont);
  
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
  
  PFont titleFont = createFont("FFScala", 20);
  textFont(titleFont);
  text("Internettoegang bevolking Nederland", 10, 25);
}


