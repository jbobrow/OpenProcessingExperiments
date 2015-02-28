
import peasy.*;

// use the peasycam library
// downloaded from http://mrfeinberg.com/peasycam/
PeasyCam cam;



String[] ageData;
String[] smokingData;
int [] smoker;
int [] age;
int x = 1;
int y = 1;
int z = 1;


void setup() {
  smooth();
  size(600, 400, P3D);
  // TEXT FILE TO ARRAY
  String[] textFile = loadStrings("smoking.txt");
  smoker = new int[textFile.length-1];
  age = new int[textFile.length-1];
  // STRING TO ARRAY
  ageData = split(textFile[1], '\t');
  for(int i=0; i<textFile.length-1; i++){
    ageData = split(textFile[i+1], '\t');
    // get the average temperature (col 3)
    age[i] = int(ageData[2]);
    smoker[i] = int(ageData[0]);
  }
  
  // create an instance of our camera 
   // first argument is the distance of the object
   cam = new PeasyCam(this, 200);
   
   // set the view port distance (how close/far we can see objects)
   cam.setMinimumDistance(50);
   cam.setMaximumDistance(500);

}


void draw() {
//  translate(width/2, height/2);
  background(#ffff00);
  strokeWeight(5);
  noFill();

  // HORIZONTAL SPACING

  for (int i = 0; i < smoker.length; i ++ ) {
    //MAP TO INCREASE Y DISTRUBUTION
    float barHeight = map(age[i], 18, 62, 20, 400);
    barHeight = map(age[i], 19, 65, 40, 400);
    x = int(width+2*sin(radians(i*360/age.length))*barHeight);
    y = int(height+2*cos(radians(i*360/age.length))*barHeight);

    
    
barHeight = map(age[i], 19, 65, 40, 240);

    
    
    // PINK SMOKER
    if (smoker[i] == 1){
           beginShape(LINES);
     stroke(#ff00ff, 50);
  // bottom section
      vertex(10, 10, 0);
      vertex(x/10, y/10, barHeight/2);
      endShape();   
    }else{
      beginShape(LINES);
     stroke(#000000, 50);
  // bottom section
      vertex(10, 10, 0);
      vertex(-x/10, -y/10, -barHeight/2);

      
      endShape();   
    }
      
    


    
    


  }
}






