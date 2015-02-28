
int x, y;
int [] y_numbers;
int [] s_numbers;

void setup()
{
  size(1600, 400);
  /*color*/
  colorMode(HSB);
  smooth();
  noFill();
  x = height/2;
  y = 20;
  y_numbers = int(loadStrings("age.txt"));
  s_numbers = int(loadStrings("genre.txt"));
}

void draw() {
  background(0);
  strokeWeight(1);


  //creates map
    /// *****age***** ///
  for (int i=0; i<y_numbers.length; i++)
   {
     stroke( map(y_numbers[i], 0, 7, 140, 0), 244, 244);
    ellipse(i*40, x, -y_numbers[i]*20, -y_numbers[i]*20); /*this scales*/
  }

  /// *****genre***** ///

  for (int l=0; l<s_numbers.length; l++)
  {
    stroke( map(s_numbers[l], 0, 5, 30, 0), 205, 255);
    ellipse(l*40, x, -s_numbers[l]*60, -s_numbers[l]*60); /*this scales*/
  }
} // end of draw


