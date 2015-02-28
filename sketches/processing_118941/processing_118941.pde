
//Data Visualization Sketch Assignment
//Due 4 November 2013

//Brian Abbott
//ITEC3450 Section 01

//create two int arrays, one for the stock, and one to check how much the stock is changing over a certain period of time
int[] stocks = new int[100];
int[] speedStocks = new int[100];

//all colors used in program
color[] palette = {#FFFFFF, #00FF00, #FF0000, #9900FF, #000000, #CCCCCC};

//final consistant variables
final int maxStock = 200;
final float valueStock = (maxStock * 0.90);
final int minStock = 0;
final int volatileStock = 20;
final int wide = 1000;
final int graphWide = 900;
final int high = 300;
final int rectangleWidth = 8;

//evenly distribute rectangles
final int n = 100;
final float xPosition = graphWide / n;

//rate used to in checkVolatileStock() method to set when to put new stocks[] data into speedStocks[]
float rate = 0;

boolean areStocksCreated = false;

int numValueStock = 0;
int numVolatileStock = 0;

void setup() {  
  //size(wide, high);
  size(1000, 300);
  background(palette[0]);
  
  //set framerate so that data updates one time per second
  frameRate(1);
}

void draw() {
  //since rectMode is center, move over 4.5 pixels to make graph centered
  translate(100, 0);
  background(palette[0]);
  
  //draw key
  rectMode(CENTER);
  
  //key for normal stock, black
  fill(palette[4]);
  rect(-50, 20, 20, 20);
  text("Normal stock", -30, 25);
  
  //key for valuable stock, green
  fill(palette[1]);
  rect(100, 20, 20, 20);
  fill(palette[4]);
  text("Valuable stock", 120, 25);
  
  //key for volatile stock, red
  fill(palette[2]);
  rect(250, 20, 20, 20);
  fill(palette[4]);
  text("Volatile stock", 270, 25);
  
  //key for both valuable and volatile stock
  fill(palette[3]);
  rect(400, 20, 20, 20);
  fill(palette[4]);
  text("Valuable and Volatile stock", 420, 25);
  
  //draw lines and labels for graph
  stroke(palette[5]);
  fill(palette[5]);
  for (int i = 0; i <= 10; i++) {
    line(-50, high - (i * 20), wide, high - (i * 20));
    text( (20 * i), -50, high - (i * 20));
  }
  text("(value line)", -20, (high-valueStock) - 2);
  
  //how much of each type of stock (valuable, volatile)
  fill(palette[4]);
  text("# of Value Stock = " + numValueStock, -50, 60);
  text("# of Volatile Stock = " + numVolatileStock, -50, 80);
   
  //initialize stock data once
  if (areStocksCreated == false) {
    createStocks();
    //initiaze speedStocks to equal stocks in the beginning
    for(int i = 0; i < stocks.length; i++) {
      speedStocks[i] = stocks[i];
    }
  }
    
  //call to methods to check if stock is volatile, to update the stock retangles, and to draw the rectangles
  drawStocks();
  
  stockChange();
  rate += .05;
  if (rate >= 1) {
    if ((int)(rate % 1) == 0) {
      checkVolatileStock();
      rate = 0;  
    }
  }
}

//method to initialize the stock values inbetween the minstock and maxstock values
void createStocks() {
  areStocksCreated = true;
  for(int i = 0; i < stocks.length; i++) {
    stocks[i] = int(random(minStock, maxStock));
  }
}
  
//method to draw the stocks  
void drawStocks() {
  rectMode(CENTER);
  noStroke();
  
  //used to keep track of how many valuable and volatile stocks there are on the graph
  int numTempValueStock = 0;
  int numTempVolatileStock = 0;
  
  //loop to check if retangle is both of value and volatile, if of value, if volatile, or normal stock
  for(int i = 0; i < stocks.length; i++) {
    //println("abs=" + Math.abs((speedStocks[i] - stocks[i])) + ", volatileStock=" +  volatileStock + ", rate=" + rate + ", speed stocks=" + speedStocks[i]);
    
    if (stocks[i] >= valueStock && Math.abs((speedStocks[i] - stocks[i])) > volatileStock) {
      fill(palette[3]);
      numTempValueStock++;
      numTempVolatileStock++;
    }
    else if (stocks[i] >= valueStock) {
      fill(palette[1]);
      numTempValueStock++;
    }
    else if (Math.abs((speedStocks[i] - stocks[i])) > volatileStock) {
      fill(palette[2]);
      //println(Math.abs(speedStocks[i] - stocks[i]));
      numTempVolatileStock++;
    }
    else {
      fill(palette[4]);
    }
    
    //draw rectangle(s)
    rect(xPosition * i, high - (stocks[i] / 2), rectangleWidth, stocks[i]);
    numValueStock = numTempValueStock;
    numVolatileStock = numTempVolatileStock;
  }
}

void stockChange() {
  //for loop to randomly increase or decrease each stock
  for(int i = 0; i < stocks.length; i++) {
    stocks[i] += int(random(-5, 5));
    
    //check to see if stock is below 0 or above the maxStock value
    if (stocks[i] < minStock) {
      stocks[i] = 0;
    }
    else if (stocks[i] > maxStock) {
      stocks[i] = maxStock;
    }
    else {
      stocks[i] = stocks[i];
    }
  }
}

//checks if stocks are volatile
void checkVolatileStock() {
  for(int i = 0; i < stocks.length; i++) {            
    speedStocks[i] = stocks[i];
  }
}



