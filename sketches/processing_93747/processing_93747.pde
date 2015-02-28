
//Dot Plots
color [] palette = {#39555c,#e8daa6,#ffb688,#c98161,#8a4c3a};

Table fodNumbers;
int rowCount;
int d = 20;

//Setup////////////////////////////////////////////////////////
void setup(){
  size (700,200);
fodNumbers = new Table ("Tabular Data - Sheet1.tsv");
rowCount = fodNumbers.getRowCount();
println("rowCount =" + rowCount);
}

void draw(){
  smooth();
 background(palette[0]);
 
//flavor//////////////////////////////////////////////
noStroke();
for (int row = 0; row < rowCount; row++){
  String flavor = fodNumbers.getString(row,0);
 //numberSold/////////////////////////////////////////
float numberSold = (fodNumbers.getFloat(row,1));
fill(palette[1],160);
ellipse(numberSold, height*1/4,d,d);
if(dist(numberSold,height*1/4,mouseX,mouseY)<(d/2)){
    text( flavor, numberSold, height*1/4-10);
    }
//totalSold////////////////////////////////////////////
float totalSold = (fodNumbers.getFloat(row,2));
fill(palette[2],160);
ellipse(totalSold, height*2/4,d,d);
if(dist(totalSold,height*2/4,mouseX,mouseY)<(d/2)){
    text( flavor, numberSold, height*2/4-10);
    }
//percentSold
float percentSold = (fodNumbers.getFloat(row,3));
fill(palette[3],160);
ellipse(totalSold*2, height*3/4,d,d);
if(dist(totalSold*2,height*3/4,mouseX,mouseY)<(d/2)){
    text( flavor, numberSold, height*3/4-10);
    }
 }
}


