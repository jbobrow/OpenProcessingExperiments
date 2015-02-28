
//QuakeLakes
//by Marilynn Barr, Art & Code--Project 2

String[] lines;  // array to contain each line of text file
int sz = 0; //  creates a variable to hold the .length value of lines array (number of cells in array, equal to number of lines in text file)

PFont font;
String yearString = "1962";
int textX;

Volcano[] volcanoes;  // Declare array of Volcano objects, one for each line in text file

String[] data0;  // Declare array to hold year
float[] data4;  // Declare array to hold latitudes
float[] data5;  // Declare array to hold longitudes
float[] data6;  // Declare array to hold Richter scale reading
float[] data7;  // Declare array to hold depth

int j = 0;  // counter to step through volcanoes array

int y = 0;  // counter to step through vertical motion of .move method

int g = 0;  // counter to step through size change of .grow method


void setup()
{
  size(1200, 600);
  background(0);
  smooth();
  frameRate (60);  

  lines = loadStrings("quakedata2.txt");   // loads each line of text file into a cell of the lines array
  sz = lines.length;  

  data0 = new String[sz]; //Creates the data array, with the same number of cells as the lines array; String datatype for year to be used as text on screen
  data4 = new float[sz]; //Creates the data array, with the same number of cells as the lines array
  data5 = new float[sz]; //Same as above
  data6 = new float[sz]; //Same as above
  data7 = new float[sz]; //Same as above


  for (int i = 0; i < sz; i++)  // this for loop allows us to step through the lines array
  {
    String [] pieces = split(lines[i], ';');  // Each cell of the lines array is split at the semicolons, with each element placed into a cell of the newly created pieces array

    data0[i] = pieces[0]; // The data0 array is left as a String array, as it's just holding the year values to be used as on-screen text
    data4[i] = float(pieces[4]);   // The data4 array is filled with the value, converted to a float by the float() function, in the 4th cell of the pieces array

    // data5 needs to correct for longitudes that are negative; if statement below does this
    if (float(pieces[5]) < 0) { //test if values of longitude are negative
      data5[i] = map(float(pieces[5]), -180., 0., width/4, width);  // use map to place neg numbers in left quarter of screen
    } 
    else {
      data5[i] = map(float(pieces[5]), 165., 180., 0, width/4);  //or else use map to place pos numbers in right three quarters of screen
    } 

    data6[i] = float(pieces[6]);  //Same as above
    data7[i] = float(pieces[7]);  //Same as above
  }


  volcanoes = new Volcano[sz];  // Creates new volcanoes array, of Volcano objects, of same length as the lines array
  for (int i=0; i < sz; i++) {  // this for loop lets us fill the volcanoes array one at a time
    volcanoes[i] = new Volcano(data4[i], data5[i], data6[i], data7[i]);  // the variables within the parens let us create each Volcano object in the array with the corresponding values from the data arrays
  }

  font = loadFont("FranklinGothic-Book-20.vlw");   //puts the chosen font info into the variable "font"
}

void draw()
{
  smooth();

  if (j < sz) {   // this is the first loop, that lets us step through the volcanoes array, on at a time

    if (volcanoes[j].startPos - y > volcanoes[j].posY) {         // this is the second loop, that increments the y variable which drives vertical movement if the volcanoes[] object's starting position
      // is less than the final (posY) position
      volcanoes[j].move();     // calls the move method from the Volcano class
      y+=5;
    } 
    else if (volcanoes[j].dia + g < volcanoes[j].endSize) {     // third loop, starts after second loop is finished, which increments the g variable if the object's dia is less than the endSize
      noStroke();
      mountainsDisplay(g);   // calls all of the mountains drawing code, passes the value of g into the alph variable of the function
      volcanoes[j].grow();   // calls the grow method from the Volcano class 
      g+=20;
    } 
    else {
      println (j + "; " + volcanoes[j].posY + "; " +volcanoes[j].posX + "; " +volcanoes[j].dia + "; " +volcanoes[j].dep + "; " +volcanoes[j].startPos);  // testing variable values
      textFont (font, 20);
      j++;   //increments j
      y = 0;    //resets y
      g = 0;    //resets g

      if ((data0[j].equals(yearString)) == false) {
        if (textX + 50 < width) {
          textX += 50;
        } 
        else {
          textX = 50;
        }
      }
      text (data0[j], textX, height - 50);
      yearString = data0[j];
    }
      noStroke();
      fill(0, 3);  //translucent fill for big rectangle
      rect(0, 0, width, height);  //screen size rectangle that "erases" screen
      fill(255);   // white fill for text
    }
      else {
      j = 0;    // resets j
    }
}

class Volcano {
  float posY, posX, dia, dep, startPos, endSize;   // class variables for the four main data array values, plus two new variables for starting Y position and end size

    Volcano(float lat, float lon, float richter, float depth) {  // this is the class Constructor, which lets us pass values into the class, one from each of the main data arrays
    posX = lon;
    posY = map(lat, 70, 0, 75, height);  // map used to spread values across the window height
    dia = richter;
    dep = depth;
    startPos = posY + 2.5 * dep;    // just some math to make the starting position higher (lower on screen) than the posY value, based on the dep value
    endSize = (200 - dep)/10 * dia;   // similar math to make the final size a product of the richter value (dia) x the dep value
  }

  void move() {    // method that draws the rising ellipse
    noStroke();
    fill (199, 0, 255, 20 + y);
    ellipse (posX, startPos - y, dia+=.0625, dia+=.0625);   // ellipse starts at startPos, grows just a little
  }

  void grow() {    // method that draws the rapidly expanding ellipses once we reach posY
    stroke(0);
    strokeWeight(2);
    fill (199, 0 + 2*g, 255 - 3*g, 30);
    ellipse (posX, startPos - y, dia * g, dia * g);    //
  }
}

void moonDisplay() {
  fill (255, 30); //white - moon glow
  //  fill (255, 255, 255, 60); //yellow - sun glow
  ellipse (width/16.*15., height/16.*-.1, 3000, 3000);

  fill (255, 40); //white - moon glow
  //  fill (255, 255, 255, 60); //yellow - sun glow
  ellipse (width/16.*15., height/16.*-.1, 2300, 2300);

  fill (255, 57); //white - moon glow
  //  fill (255, 255, 255, 60); //yellow - sun glow
  ellipse (width/16.*15., height/16.*-.1, 1200, 1200);

  fill (255, 74); //white - moon glow
  //  fill (255, 255, 255, 60); //yellow - sun glow
  ellipse (width/16.*15., height/16.*-.1, 760, 760);

  fill (255, 90); //white - moon glow
  //  fill (255, 255, 255, 60); //yellow - sun glow
  ellipse (width/16.*15., height/16.*-.1, 480, 480);

  fill (255, 150); //moon glow
  //  fill (255, 234, 0, 150); //yellow - sun
  ellipse (width/16.*15., height/16.*-.1, 250, 250);


  fill (255, 230); //moon
  //  fill (255, 234, 0, 200); //yellow - sun
  ellipse (width/16.*15., height/16.*-.1, 120, 120);
}

void mountainsDisplay(int alph) {
  fill (183, 3, 255, alph); //purple - mountain - majesty
  triangle (75., 10., 30., 75., 120., 75.);

  fill (12, 234, 91, alph); //green - mountain
  triangle (37.5, 30., 75., 75., 0., 75.);

  fill (183, 3, 255, alph); //purple - mountain - majesty
  triangle (120., 5., 70., 75., 180., 75.);

  fill (183, 3, 255, alph); //purple - mountain - majesty
  triangle (575., 10., 430., 75., 720., 75.);

  fill (222, 168, 31, alph); //purple - mountain - majesty
  triangle (637.5, 30., 575., 75., 800., 75.);

  fill (12, 234, 91, alph); //green - mountain
  triangle (790., 5., 720., 75., 880., 75.);
}


