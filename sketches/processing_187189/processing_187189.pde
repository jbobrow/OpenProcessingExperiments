
/* Jake Meth Homework */
/* Due: February 25, 2015 */

// DATA
int[] myStats;
String[] myCities;

// LAYOUT
//top, right, bottom, left
float[] margins = { 750, 750, 750, 750 };
float scaleWidth(int i){
      return map(i,
                 0, max(myStats),
                 650, width - margins[1] - margins[3]);
    }
    
float scaleHeight(int i){
      return map(i,
                 0, max(myStats),
                650, height - margins[0] - margins[2]);
    }
    
    

void setup(){
  size(800,800);
  smooth();

  myCities = loadStrings("lesson_4_cities.txt");
  
  String[] statsData = loadStrings("lesson_4_population.txt");
  myStats = new int[statsData.length];
  
  for(int i = 0; i <= statsData.length - 1; i += 1){
    myStats[i] = parseInt(statsData[i]); 
  }}
  
  void draw(){
    drawCircles();
    println(myStats);
    colorMode(HSB, 100);
    noLoop();
    
  }
  
  void drawCircles(){
    for(int i = 0; i <= myStats.length - 1; i += 1){
      float circleWidth = scaleWidth(myStats[i]);
      float circleHeight = scaleHeight(myStats[i]);
      float x = 400;
      float y = 400;
            fill(0, 102, 153);
      textAlign(CENTER, TOP);
      text(myCities[i], x, (height - circleHeight)/2);
      fill(255);
  
      
      ellipse(x, y, circleWidth, circleHeight);
    }}


