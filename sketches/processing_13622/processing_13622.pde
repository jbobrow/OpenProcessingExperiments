
int[] years; // integer array for storing birthdates
float[][] dataArray;
String[] dataName;
color[] colors;
int numberOfYears = 3;
int numberOfItems = 12;

//int scale = 20;
int startyear = 2007;
int margin = 50;
int ymargin = 35;//grid
int bottommargin = 20;//text
float yinterval = 2.65;
int xinterval = 100;
int startprice = 100;
int textoffset = 40;
int dotoffset = xinterval/2;

PFont font;

void setup() {
  size(600,600);
  background(255);
  smooth();
  font = createFont("Arial",12);
  textFont(font,12);
  loadData();
}

void draw() {
  background(255);
  fill(0,100);

  for (int y=startyear; y < 2010; y ++) { // year gridlines
    text(y,margin + (y - startyear)*xinterval+xinterval+textoffset, height-bottommargin);
    stroke(0,20);
    line(margin + (y - startyear)*xinterval+xinterval, height-ymargin, margin + (y - startyear)*xinterval+xinterval, 10);
  }

  for (int ht = startprice; ht < 310; ht += 5) { // height gridlines 
    text(ht,margin+textoffset,height-ymargin-(ht-startprice)*yinterval);
    stroke(0,20);
    line(margin,height-ymargin-(ht-startprice)*yinterval,width-50,height-ymargin-(ht-startprice)*yinterval);
  }

  for (int i=0; i<numberOfItems; i++){
    stroke(0);
    noFill();
    beginShape();
    vertex(margin + ((years[0]-startyear)*xinterval)+xinterval+dotoffset, height-ymargin-(dataArray[0][i]-startprice)*yinterval);
    vertex(margin + ((years[1]-startyear)*xinterval)+xinterval+dotoffset, height-ymargin-(dataArray[1][i]-startprice)*yinterval);
    vertex(margin + ((years[2]-startyear)*xinterval)+xinterval+dotoffset, height-ymargin-(dataArray[2][i]-startprice)*yinterval);
    endShape();
  }

  for (int i=0; i<years.length; i++) {
    int date = years[i]; 
    for(int j=0; j<numberOfItems; j++){
      float xpos = margin + ((date-startyear)*xinterval)+xinterval+dotoffset;
      ellipseMode(CENTER);

      fill(colors[j]);
      ellipse(xpos, height-ymargin-(dataArray[i][j]-startprice)*yinterval, 10, 10);   
    }   
  }
    
  color c = get(mouseX,mouseY);
  if(c==colors[0]){
    drawLabel(0);
  } else if(c==colors[1]){
    drawLabel(1);
  } else if(c==colors[2]){
    drawLabel(2);
  } else if(c==colors[3]){
    drawLabel(3);
  } else if(c==colors[4]){
    drawLabel(4);
  } else if(c==colors[5]){
    drawLabel(5);
  } else if(c==colors[6]){
    drawLabel(6);
  } else if(c==colors[7]){
    drawLabel(7);
  } else if(c==colors[8]){
    drawLabel(8);
  } else if(c==colors[9]){
    drawLabel(9);
  } else if(c==colors[10]){
    drawLabel(10);
  } else if(c==colors[11]){
    drawLabel(11);
  }
}

void drawLabel(int itemI){
  int stringlength = dataName[itemI].length();
  rect(mouseX+13, mouseY-5, stringlength*7,20);
  fill(0);
  text(dataName[itemI],mouseX+16, mouseY+10);
}

void loadData() {

  String[] data_in = loadStrings("data.csv"); 
  numberOfYears = data_in.length;
  years = new int[data_in.length];
  dataArray = new float[numberOfYears][numberOfItems];
  dataName = new String[numberOfItems];
  colors = new color[numberOfItems];

  // gives us a String array, one line per element

  for ( int i = 0; i < data_in.length; i++) { // start at 1 - skip the first row
    // split the data apart
    String line = data_in[i]; // this line of the data
    String[] bits = line.split(","); // split this line at the commas 
    years[i] = int(bits[0]);
    for (int j = 0; j < numberOfItems; j++){
      dataArray[i][j] = float(bits[j+1]);
    }
  }

  dataName[0] = "food";
  dataName[1] = "alcohol";
  dataName[2] = "clothing";
  dataName[3] = "housing";
  dataName[4] = "services";
  dataName[5] = "health";
  dataName[6] = "transportation";
  dataName[7] = "communication";
  dataName[8] = "recreation";
  dataName[9] = "education";
  dataName[10] = "financial";
  dataName[11] = "all";

  colors[0]=color(247,182,15);
  colors[1]=color(72,70,64);
  colors[2]=color(255,180,207);
  colors[3]=color(30,92,245);
  colors[4]=color(252,18,49);
  colors[5]=color(27,170,33);
  colors[6]=color(157,78,3);
  colors[7]=color(170,234,24);
  colors[8]=color(155,2,173);
  colors[9]=color(240,255,85);
  colors[10]=color(198,8,97);
  colors[11]=color(200,200,200);
  
}


