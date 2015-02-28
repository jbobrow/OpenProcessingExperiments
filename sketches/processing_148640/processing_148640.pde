
/*This sets up the window */
void setup()
{
  size(600,200);
}

void draw()
{
  /* This gets the correct data from the file and trims out unnessecary formatting such as spaces */
  String lines[] = loadStrings("durhamdata.txt");
  lines = subset(lines, 7);
  lines = trim(lines);
  /* creates 3 arrays the length of lines */ 
  float rain[] = new float[lines.length];
  
  for(int i=0 ; i<lines.length ; i++)
  {
    /* body of loop */
    String fields[] = splitTokens(lines[i]);
    float values[] = float(fields);
    /*Gets the specific value from each line */
    rain[i] = values[5];
  }
  
  /* The data will take 1200 samples starting from the first point */
  int data_start = 0;
  int data_length = 1200;
  
  textAlign(CENTER);
  fill(0, 0, 0);
  text("A graph to show rainfall for Durham ", width/2, 25);
 
  
  /* the plotset starts from the 1st item in rain and goes through 1200 items */
  float plotsetrain[] = subset(rain, data_start, data_length);
  /*this plots the data on a y co-ordinate and moves along the x co ordinate of the screen*/
  for ( int i=0 ; i<plotsetrain.length; i++ )
  {
    float point_x = map(i,0,plotsetrain.length,0,600);
    float Pmax = max(plotsetrain);
    float Pmin = min(plotsetrain);
    float point_y = map(plotsetrain[i],Pmin,Pmax,200,50);
    line( point_x, point_y, point_x, 200);
  }
}


