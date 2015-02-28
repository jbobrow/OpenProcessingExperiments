
//danielle yip
//dmgs 2010 @ sci-arc
//week 08 homework #1
//importing data - livestock and human populations in Africa from 1961-2007

String[] livestockData;
int [] livestock;
int [] humans;

float minPop;
float maxPop;

void setup() {
  size(800, 400);
  smooth();
  
  //load text from file into an array
  String[] textFile = loadStrings("livestockAfrica.txt");
  livestock = new int[textFile.length-1];
  humans = new int[textFile.length-1];

  //one array from the livestock string
  //convert the strings into array of integers using 'tab' as delimiter
  livestockData = split(textFile[1], '\t');
  //println(livestockData);
  
  for(int i=0; i<textFile.length-1; i++){
    livestockData = split(textFile[i+1], '\t');
    
    //get the number of livestock (column 1) and humans (column 2)
    livestock[i] = int(livestockData[1]);
    humans[i] = int(livestockData[2]);
    println(livestock);
    }
}

void draw() {
  background(0);
  noStroke();
  
  //calculate width
  int stepSize = width/(livestock.length);
  
  //draw livestock points
  for (int i=0; i<livestock.length; i++) {
    
    //map to set height of distribution
    float pointHeight = map(livestock[i], 292, 965, 50, 200);
    
    stroke(0, 255, 255, 150);
    noFill();
        
    //draw points from bottom
    ellipse(i*stepSize, height-2*pointHeight, 7, 7);
            
    //if livestock population is larger than human population,
    //draw "their stomachs as full" (draw a solid dot within the circle)
    if (livestock[i] >= humans[i]){
      
      noStroke();
      fill(0, 255, 200, 200); 

      ellipse(i*stepSize, height-2*pointHeight, 3, 3);
    }
    
  }
  
    //draw human points
  for (int i=0; i<humans.length; i++) {
    
    //map to set height of distribution
    float pointHeight = map(humans[i], 292, 965, 50, 200);
    
    stroke(255,0,255, 150);
    noFill();
    
    //draw points from bottom
    ellipse(i*stepSize, height-2*pointHeight, 15, 15);

    //if human population is larger than livestock population, 
    //draw "people overcrowding" (draw a bigger dot on top that starts to overlap the other dots)
    if (humans[i] >= livestock[i]){
            
      noStroke();
      fill(255, 0, 0, 80);
      
      ellipse(i*stepSize, height-2*pointHeight, 30, 30);
    }
  }
}

