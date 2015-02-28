
//scatter_plot
color [] palette = {#f2f2f2,#c6e070,#91c46c,#287d7d,#1c344c};

Table fodNumbers;
int rowCount;
int d = 20;

//setup///////////////////////////////////////////////////////
void setup(){
  size(600,600);
  fodNumbers = new Table( "Tabular Data - Sheet1.tsv");
  rowCount = fodNumbers.getRowCount();
  println("rowCount = " + rowCount);  
  smooth();
  
}
//draw////////////////////////////////////////////////////////
void draw(){
  background(palette[0]);
  stroke(palette[1]);
  fill(palette[2]);
  strokeWeight(5);
  textAlign(CENTER);
  line(100,550,550,550);
  text("NUMBER SOLD", width/2, 570);
  
  textAlign(RIGHT);
  line(100,550,100,50);
  text("TOTAL SOLD", 90, height/2);
  
  for (int row = 0; row< rowCount; row++){
    String flavor = fodNumbers.getString(row,0);
    
    float numberSold = fodNumbers.getFloat(row,1);
    float x = map(numberSold,50,1700,100,550);
    
    float totalSold = fodNumbers.getFloat(row,2);
    float y = map(totalSold,100,4600,550,50);
    
    noStroke();
    fill(palette[3],150);
    ellipse(x*2.5+5,y-200,d,d);
    
   

  
}
}

