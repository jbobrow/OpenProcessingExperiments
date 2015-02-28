
// Ruth Arellano
// NFL Data Visualization (Module: Salaries)

import peasy.*;

PeasyCam cam;
String[] nameData;
String[] salaryData;
int [] person;
int [] salary;
int x = 1;
int y = 1;
int z = 1;
 
 
void setup() {
  smooth();
  size(600, 600, P3D);
  // LOAD TEST TXT FILE (currently holds one variable)
  String[] textFile = loadStrings("processing_dataTest.txt");
  person  = new int[textFile.length-1];
  salary = new int[textFile.length-1];
  // string to array (FROM TEXT FILE: salaries)
  salaryData = split(textFile[1], ',');
  for(int i = 0; i < textFile.length-1; i++){
    salaryData = split(textFile[i+1], ',');
    //  the average (3)
    salary[i] = int(salaryData[0]);
  //  person [i] = int(salaryData[0]);
  }
   
  //object distance
   cam = new PeasyCam(this, 200);
    
   // distance we can view object
   cam.setMinimumDistance(15);
   cam.setMaximumDistance(700);
 
}
 
 
void draw() {

  background(#DFF0ED);
  strokeWeight(5);
  noFill();
 
  // horizontal spacing
 
  for (int i = 0; i < person.length; i ++ ) {
    //map increase y distribution
    float barHeight = map(salary[i], 18, 62, 20, 400);
    barHeight = map(salary[i], 19, 65, 40, 400);
    x = int(width+2*sin(radians(i*360/salary.length))*barHeight);
    y = int(height+2*cos(radians(i*360/salary.length))*barHeight);
 
     
     
barHeight = map(salary[i], 19, 65, 40, 240);
 
     
     
    // CUSTOM COLOR person/athlete 
    // this can be customized once I add more variables 
    if (person [i] == 1){
           beginShape(LINES);
     stroke(0, 50);
  // bottom section
      vertex(10, 10, 10);
      vertex(x/10, y/10, barHeight/2);
      endShape();  
    }else{
      beginShape(LINES);
     stroke(0, 50);
  // bottom section
      vertex(10, 10, 10);
      vertex(-x/10, -y/10, -barHeight/2);
 
       
      endShape();  
    }
       
     
 
 
     
     
 
 
  }
}

