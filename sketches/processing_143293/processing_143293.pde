
int[] pointsx;
int[] pointsy;

void setup() {  //setup function called initially, only once
  size(600, 600);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode

  int num_points = 5;
  pointsx = new int[num_points];
  pointsy = new int[num_points];
  
  
  for (int i = 0; i < num_points; i++)
  {
      pointsx[i] = int(random(width));
      pointsy[i] = int(random(height));
  }
  
  //draw points
  fill(50);
  for (int i = 0; i < pointsx.length; i++)
  {
      ellipse(pointsx[i],pointsy[i],3,3);
  }
  
  //perpendicular bisectors
  for (int i = 0; i < pointsx.length; i++)
  {
      for (int j = i+1; j < pointsx.length; j++)
      {
          float midx = (1.0*pointsx[i]+pointsx[j])/2.0;
          float midy = (1.0*pointsy[i]+pointsy[j])/2.0;
          
          float slope = (1.0*pointsy[i]-pointsy[j])/(1.0*pointsx[i]-pointsx[j]);
          slope = -1.0 / slope;
          float x1 = midx + width;
          float x2 = midx - width;
          float y1 = midy + height*slope;
          float y2 = midy - height*slope;
          line(x1,y1,x2,y2);
         
       }
  }

      
}

void draw() {  //draw function loops 

}

void mouseClicked()
{
    setup();
}
