
// Keith O'Hara <kohara@bard.edu>
// Apr 2010
// Data found here: http://manyeyes.alphaworks.ibm.com/manyeyes/datasets/plastic-surgery-procedures-per-100/versions/1

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

      textSize(surgeries*.5);
      float x = random(0, width - textWidth(country));
      float y = random(100, height - 100);
      colorMode(HSB);
      fill(surgeries, 255, 255, 128);
      text(country, x, y);

      //next line of the file
      index = index + 1;
    }
  }
}






