
// == Array to hold the lines of the post codes
String lines[];

// == Index of which post code is being used
// == This is the variable the allows the script to print one post code at a time.
int ProcessPostcodeNumber=0;

void setup() {
  size(500, 760);
  background(0);
  fill(255);
  noStroke();
  smooth();
  
  // == Loads each line of postCodes.csv into lines array
  lines = loadStrings("postCodes.csv");
  
 // == This code has no function in the script
 // == It is only here to output the data to the debug window so you can get a better idea of what it is.
  for(int i=0; i<lines.length; i++){
    println(lines[i]);
  }
}


void draw() {
  float x=0;
  float y=0;
  int originalX;
  int originalY;
  
  // == checks if the current ProcessPostcodeNumber is less than the total post codes available
  if(ProcessPostcodeNumber<lines.length){
    // == splits the current entry by commas (See debug window to view the structure)
    String currentPostCode[] = split(lines[ProcessPostcodeNumber],",");
    
    // == converts the x and y from the csv file to integers
    originalX = int(currentPostCode[2]);
    originalY = int(currentPostCode[3]);
    
    // == maps the x and y from the csv to coords that will fit on the screen
    x = map(originalX, 22600, 653500, 0, width-100)+50;
    y = map(originalY, 8200, 1160900, height-40, 0)+20;
    
    // == creates the point
    ellipse(x,y,2,2);
    
    // == moves on to the next post code
    ProcessPostcodeNumber++;
  }
  
}



