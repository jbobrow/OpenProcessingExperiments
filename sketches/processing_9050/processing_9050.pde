
//Oliver Switzer
//Visualiztion Project
//4/21/10
//Interactive Computing
//Keith O'Hara
 
String[] lines; 
int index = 0; 
 
void setup()  
{ 
  size(600, 600); 
  background(24); 
  stroke(255); 
  textFont(loadFont("Serif-64.vlw")); 
  lines = loadStrings("plasticSurgery.txt"); 
  smooth(); 
} 
 
void draw()  
{    
  filter(BLUR, 2);
  frameRate(1); 
  if (index < lines.length)  
  { 
    println(index + " " + lines[index]); 
    // split the line into its components (delimited by tabs) 
    String[] pieces = split(lines[index], '\t'); 
 
    if (pieces.length == 2) 
    { 
      String country = pieces[0]; 
      float surgeries = float(pieces[1]); 
      println(country + ": " + surgeries); 
    
      textSize(25); 
      float x = width - (surgeries + 250);
      float y = map(surgeries, 0.2, 250, height-40, 0); 
      fill(255); 
      text(country + " " + surgeries, x, y); 
 
      //next line of the file 
      index = index + 1; 
      
    } 
  } 
} 
 
 
 


