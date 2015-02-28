
//danielle yip
//dmgs 2010 @ sci-arc
//week 09 homework #1
//expand data into 3d geometry

//use peasycam library
import peasy.*;
PeasyCam cam;

String[] livestockData;
int [] livestock;
int [] humans;

void setup() {
  size(800, 400, P3D);
  smooth();
  
   //peasycam - create an instance of the camera
  cam = new PeasyCam(this, 400, 200, 100, 500);
  
  //peasycam - set viewport distance
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  
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
  int stepSize = width/livestock.length;
  
  //draw livestock points
  for (int i=0; i<livestock.length; i++) {
    
    float pointHeight, x, y, z;
    
    //map to set height of distribution
    pointHeight = map(livestock[i], 292, 965, 50, 200);
    
    //give points motion
    pointHeight += noise(float(i)*0.5, float(frameCount)*0.03)*10;
    
    x = width/2+cos(radians(i*360/livestock.length-10))*pointHeight;
    y = height/2+sin(radians(i*360/livestock.length-2))*pointHeight;
    z = 0;
    
    stroke(0, 255, 255, 150);
    noFill();
    
    pointHeight = map(livestock[i], 292, 965, 10, 300);    
     
    //draw points and lines
    beginShape(LINES);
    vertex(width/1.8, height/1.7, pointHeight/2);
    vertex(x, y, z);
    endShape();
    ellipse(x, y, 7, 7);
            
    //if livestock population is larger than human population,
    //draw "their stomachs as full" (draw a solid dot within the circle)
    if (livestock[i] >= humans[i]){
      
      noStroke();
      fill(0, 255, 200, 200); 

      ellipse(x, y, 3, 3);
    }
    
  }
  
    //draw human points
    for (int i=0; i<humans.length; i++) {
    
    float pointHeight, x, y, z;
    
    //map to set height of distribution
    pointHeight = map(humans[i], 292, 965, 50, 200);
    
    //give points motion
    pointHeight += random(float(i)*0.05, float(frameCount)*0.005)*5;
    
    x = width/3+cos(radians(i*360/livestock.length+100))*pointHeight;
    y = height/2+sin(radians(i*360/livestock.length-25))*pointHeight;
    z = 10;
    
    stroke(255,0,255, 150);
    noFill();
    
    //draw points and lines
    beginShape(LINES);
    vertex(width/1.8, height/1.7, -pointHeight*1.5);
    vertex(x, y, z);
    endShape();
    ellipse(x, y, 15, 15);

    //if human population is larger than livestock population, 
    //draw "people overcrowding" (draw a bigger dot on top that starts to overlap the other dots)
    if (humans[i] >= livestock[i]){
            
      noStroke();
      fill(255, 0, 0, 80);
      
      ellipse(x, y, 30, 30);
    }
  }
}

