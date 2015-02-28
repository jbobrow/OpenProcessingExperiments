

class DataCircles
{
  DataReader reader;
  float r;
  color [] c = new color[amount];
  
  

  public DataCircles(String document)
  {
    reader = new DataReader(document);
    
    r = 0;
  }

  public void dataColors()
  {
    reader.readData();
    for (int i = 0; i < amount; i++)
    {
      c[i] = color(random(50), 100, 80);
    }
  } 


  public void drawCircles(int _x, int _y)
  {
    int [] value = {reader.val1, reader.val2, reader.val3, reader.val4, reader.val5};
    translate(_x, _y);
    rotate(r);
    for (int i = 0; i < 5; i++)
    {
      rotate(r*i);
      fill(c[i]);
      
      ellipse(75+10*i, 75+10*i, map(value[i], reader.minVal, reader.maxVal, 0, 30), map(value[i], reader.minVal, reader.maxVal, 0, 30));
    }
    r+= 0.001;
    resetMatrix();
  }
  
  public void displayLegend()
  {
    fill(100);
    int [] value = {reader.val1, reader.val2, reader.val3, reader.val4, reader.val5};    
    String s = " %s %";
    for (int i = 0; i < amount; i++)
    {
      float p = value [i] * 100 / (reader.val1 + reader.val2 + reader.val3 + reader.val4 + reader.val5);
      fill(c[i]);
      stroke(100);
      rect(50, 50 + 50 * i, 15, 15);
      text(p + "%", 95, 65 + 50 * i);
      noStroke();
    }
  }
}


