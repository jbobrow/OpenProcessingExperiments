
int x, y;

void setup()
{
  size(800, 400);
  /*color*/
  colorMode(HSB);
  smooth();
  noFill();
  x = height/2;
  y = 20;
}

void draw() {
  background(0);
  strokeWeight(1);

  //creates map


  /// *****age***** ///
  int[] y_numbers = { 
    1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3
  };
  for (int i=0; i<y_numbers.length; i++)
  {
    stroke( map(y_numbers[i], 0, 7, 140, 0), 244, 244);
    ellipse(y+i*40, x, -y_numbers[i]*20, -y_numbers[i]*20); /*this scales*/
  }

  /// *****gender***** ///
  int[] g_numbers = { 
    1, 1, 2, 2, 2, 1, 1, 1, 1, 1, 2, 2, 2, 2, 1, 1, 2, 2, 1, 2, 2, 2, 2, 2
  };
  for (int j=0; j<g_numbers.length; j++)
  {
    stroke( map(g_numbers[j], 0, 5, 140, 0), 205, 255);
    ellipse(y+j*40, x, -g_numbers[j]*30, -g_numbers[j]*30); /*this scales*/
  }

  /// *****answers***** ///
  int[] a_numbers = { 
    1, 1, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2
  };
  for (int k=0; k<a_numbers.length; k++)
  {
    if (a_numbers[k]==1)
    {
      stroke(250, 0,255);
      ellipse(y+k*40, x, -a_numbers[k]*60, -a_numbers[k]*60);
    }

    if (a_numbers[k]==2)
    {
      stroke(253,167,255);
      ellipse(y+k*40, x, -a_numbers[k]*40, -a_numbers[k]*40); /*this scales*/
    }
  }

    /// *****song***** ///
    int[] s_numbers = {
      1, 2, 2, 3, 3, 4, 2, 2, 2, 5, 6, 6, 3, 3, 6, 5, 2, 2, 3, 5, 2, 2, 6, 3
    };
    for (int l=0; l<s_numbers.length; l++)
    {
      stroke( map(s_numbers[l], 0, 5, 30, 0), 205, 255);
      ellipse(y+l*40, x, -s_numbers[l]*20, -s_numbers[l]*20); /*this scales*/
    }
  } // end of draw


