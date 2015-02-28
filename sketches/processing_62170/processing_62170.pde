
String[] countries; 
float[][] countriesValues; // Two-dimensional array. Stores an array of values for each country
String[] yearNames;  // Store the name of the years


void setup() {
  size(500, 500);
  smooth();

  /* Read data */
  String lines[] = loadStrings("data.csv");

  String firstLine = lines[0];
  String[] firstLinePieces = split(firstLine, ";");

  /* Initialize arrays to hold the data */
  int numberOfCountries = lines.length - 1;  // Skip first row 
  int numberOfYears = firstLinePieces.length  - 1;

  countries = new String[numberOfCountries];
  countriesValues = new float[numberOfCountries][numberOfYears];
  yearNames = new String[numberOfYears];


  /* Read the first line (name of the years) separately */
  for (int i = 0; i < numberOfYears; i++) {
    yearNames[i] = firstLinePieces[i+1];  // +1 because first field is empty
  }


  /* Go through the file line by line */
  for (int i = 0; i < numberOfCountries; i++) {

    String line = lines[i+1];
    String[] pieces = split(line, ";");

    countries[i] = pieces[0]; 

    for (int j = 0; j < numberOfYears; j++) {
      countriesValues[i][j] = float(pieces[j + 1]);
    }
  }
} 



void draw() {
  background(0);

  stroke(128);
  noFill();
  strokeWeight(1);

  /* Draw a grid with the years */
  for (int i = 0; i < yearNames.length; i++) {
    float x = map(i, 0, yearNames.length - 1, 0, width);

    line(x, 50, x, height);
    
    pushMatrix();
    text( yearNames[i],x, 20.0);
    popMatrix();
  }



  /* Draw the values (connected) for each country */
  strokeWeight(3);
  stroke(255);

  for (int i = 0; i < countries.length; i++) {

    beginShape();

    float[] values = countriesValues[i];

    for (int j = 0; j < values.length; j++) {

      float x = map(j, 0, values.length - 1, 0, width);
      float valueHeight = height - values[j] * 10;

      vertex(x, valueHeight);
    }

    endShape();
  }
}


