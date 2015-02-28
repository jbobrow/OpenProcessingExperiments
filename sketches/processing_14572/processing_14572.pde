
//WEEK 8 DMGS FALL 2010 Filipa Valente exercise 02

//Reading tidal data information for sea level and temperature
//Used a portion of a data information text file on tide and sea levels and used it to create a pattern
//based on drawing different shapes and fills

//setting up arrays to store the text file information
String[] tidalData;
float [] seaLevels;
float[] temperature;

void setup() {
  
  size(500, 500);
  smooth();
  
  
 // The text from the file is loaded into an array. 
  String[] textFile = loadStrings("Tidaldata3.txt");
  seaLevels = new float[textFile.length-1];
  
   // Convert String into an array of integers using ',' as a delimiter
  tidalData = split(textFile[1], '\t');
  println(tidalData);

//print the data for each line of the text file
  for(int i=0; i<textFile.length-1; i++){
    
    tidalData = split(textFile[i+1], '\t');
    
    seaLevels[i] = float(tidalData[0]);
    println(seaLevels[i]);
  }

}

void draw() {
  
  background(0);
 
 // calculate how large the bars in the graph should be
 int stepSize = width/seaLevels.length;
 
 //draw shapes based on vertex points 
  for (int i = 0; i < seaLevels.length; i ++ ) {

   beginShape();
    
    stroke(255);
    fill(seaLevels[i], 50,50,50); 
    //noFill(); 
  
     // draw shapes
     
     vertex(i*stepSize,seaLevels[i]*100);
     vertex(i*stepSize*2,height);
     vertex(i*stepSize,seaLevels[i]*170);
      
    line(i*stepSize,seaLevels[i]*100,i*stepSize,seaLevels[i]*100+100);
    
     endShape();
     
     stroke(255);
     strokeWeight(0.1);
     
     //draw ellipses following the sealevel data change
     fill(255);
     ellipse(i*stepSize,seaLevels[i]*100,2,4);
     
     //draw ellipses following the sealevel data change
     fill(255);
     ellipse(i*stepSize,seaLevels[i]*100+200,2,4);
     
     //draw rectangles following the sealevel data change
     fill(255);
     rect(i*stepSize,seaLevels[i]*100+100,5,5);
  
     
  
   //draw some bezier shapes and fill them to create a pattern
  
   beginShape();
    
    fill(seaLevels[i], 50,50,50);
    stroke(seaLevels[i], 50,50,50);
    
    bezier(i*stepSize,seaLevels[i]*100,i*stepSize,seaLevels[i]*200,i*stepSize,seaLevels[i]*300,i*stepSize+50,seaLevels[i]*460);
    bezier(i*stepSize+50,seaLevels[i]*460,i*stepSize,seaLevels[i]*200,i*stepSize,seaLevels[i]*300,i*stepSize,seaLevels[i]*100);
      
    endShape();

  }

}


