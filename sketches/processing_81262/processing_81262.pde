

//*  IAT 800 Instructed by Phillipe Pasquire
//*  submitted by AYINUERGULI KADEER (Aynur Kadir)
//*  Date: 8th, November, 2012
//*  email: akadir@sfu.cav
//*  A3_3. Find a real world dataset (with at least a hundred data) and read it in your program.
//*  Using an OOP approach, provide a visualization of the dataset that is appropriate (include
//*  textual information on screen as needed).

//* World AIDS Day is coming soon in 1 of December, I have worked as a valunteer to red cross in 2008. 
//* with this graphic I want to highlight how fast these HIV carrier increasing in last 20 years.
//* Data on the size of the epidemic: Number of people (all ages) living with HIV.
//* Data comes from:  http://apps.who.int/gho/data/#  I selected 6 countries among them.
//* Nigeria ---- Light Blue
//* India   ---- Yellow
//* United State ----- Blue
//* Russian Federation ---- Purple
//* France ---- Green
//* Canada ---- Red

String[] eachYear;  // Store the name of the years
color[] colourArray; // give each country different color

String graphName; // display the title

country[] countryArray; // hold my country object
void setup() {
  size(600, 600);
  smooth();

  /* Read data */
  String lines[] = loadStrings("HIV of different countries.csv");// open up our data file

  String[] first = split(lines[0], ","); //split the first line 
  graphName = first[0]; //get the graph name from the first element


  countryArray = new country[lines.length -2]; //create a array to hold all our country object. 
  //start at 2 because we dont need title or years
  for (int i=2; i<lines.length; i++) // Count the number of rows in the file.
  {
    String[] tempArray = split(lines[i], ","); // split each line up into an array
    country tempCountry = new country( tempArray ); //create a new country object and give it is data array

      countryArray[i-2] = tempCountry; // add each country to the holder array
  }

  //give each country a seperate colour
  countryArray[0].countryColour = color(255, 0, 0); // color of line for Canada
  countryArray[1].countryColour = color( 0, 255, 0 ); //color of line for France
  countryArray[2].countryColour = color( 0, 0, 255 ); // color of line for United State
  countryArray[3].countryColour = color( 255, 255, 0); // color of line for India
  countryArray[4].countryColour = color(255, 0, 255 );//color of line for Russian Federation
  countryArray[5].countryColour = color( 0, 255, 255 ); // color of line for Nigeria


  //years
  String firstLine = lines[1];//Load the file
  String[] firstLinePieces = split(firstLine, ","); // For each line split values separated by columns into pieces

  int differentYears = firstLinePieces.length  - 1; // count the number of years needed

  eachYear = new String[differentYears]; //set the size of the holder array


  // loop through the number of year
  for (int i = 0; i < differentYears; i++) {
    eachYear[i] = firstLinePieces[i+1];  // assign each year
    // +1 because first field is empty
  }
} 



void draw() {
  background(250);

  stroke(128);
  noFill();
  strokeWeight(1);

  // Draw a grid with the years
  for (int i = 0; i < eachYear.length; i++) 
  {
    float x = map(i, 0, eachYear.length - 1, width - 20, 50);

    line(x, 50, x, height - 100);

    fill(0);
    textSize( 8);
    text( eachYear[i], x, 50);
    noFill(); // set back to no fill
  }

  //display the graph name
  fill(0);
  textSize( 15);
  text( graphName, 20, 20);
  noFill();

  //loop through and render out each country object
  for ( int i = 0; i< countryArray.length; i++ )
  {
    countryArray[i].render();
  }
}

// this is the country class. it is used to store an data array and display a lines based on the data
class country
{
  String countryName;
  float[] hivPopulation;
  color countryColour;

  //countructor
  country( String[] inputHIVArray )
  {
    //retrieve the country name
    countryName = inputHIVArray[0];

    // create a temp array to organize the data. 
    float[] tempArray = new float[inputHIVArray.length - 1];

    //start at one because we dont need the name
    for ( int i =1; i< inputHIVArray.length; i++)
    {
      tempArray[i-1] = float(inputHIVArray[i]); //convert the data to float
    }

    hivPopulation = tempArray; //assign the organized data to the holder array
  }

  void render()
  {

    /* Draw the values (connected) for each country */
    strokeWeight(3);
    stroke(255);

    beginShape();
    stroke(0);

    stroke( countryColour); // set the colour


      for (int i = 0; i < hivPopulation.length; i++) { //loop through each data point

      float x = map(i, 0, hivPopulation.length - 1, width-20, 50);

      float valueHeight =  hivPopulation[i] / 10000; // adjust the data

      vertex(x, height - valueHeight - 100);
    }

    endShape();
  }
}



