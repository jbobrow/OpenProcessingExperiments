
//declare 3 empty arrays
String [] country;
float [] age;
float [] money;

int marginX = 100 ;
int marginY = 100; 

PFont font;

void setup() {
  size(900,600);
  background(40);
  smooth();
  
  //Create the font object to make text with
  font = loadFont ("Futura-Medium-48.vlw");
  
  
  //Load the .csv
  String[] input = loadStrings("HealthComparisons.csv");
  
  //create arrays to associate with all the data
  country = new String[input.length - 1];
  money = new float[input.length-1];
  age = new float[input.length-1];
  
  
 // println(input);
   
  for (int i = 1; i < input.length; i++) {
    noStroke();
    String[] splits = input[i].split(",");
    country[i - 1] = splits[0];
    age[i - 1] = float(splits[1]);
    money[i - 1] = float(splits[2]);
 
    } 
    

   drawBarGraph();

}

void draw () {
   
}


void drawBarGraph() {
  
  smooth();
  
  float minAge = min(age);
  float maxAge = max(age);
  
  float minMoney = min(money);
  float maxMoney = max(money);
  
  //we've normalized the arrays, start at 0, working with our own arrays
  for ( int i = 0; i < country.length; i++) {
    
    float x = width/2;
    float y = height;
    float newX = map (age[i], minAge, maxAge, marginX + 20, width - marginX);
    float newY = map (money[i], minMoney, maxMoney, height - (marginY + 20), marginY);     
    
    
    fill(random(255), map(newY, 0, height, 255, 100), map(newX, 0, width, 255, 125), 100 ); 
    noStroke();
    ellipse(x, 0, newY, newY); //Money
    ellipse(x, y, newX, newX); //Age
    textFont (font, 14);
  }
}





