
int x;//point for x cord
int y;//point for y cord
int scale = 3;//scaling for lag control
int avg; //for averaging color later on

size(640, 500);
background(0);
//sets up a "2d array" in a sense and claculates position and color for all points and draws them.
  for(int i = 0; i<width/scale; i++){
    for(int j = 0; j<height/scale; j++){
      x = i*scale;//sets x based on scale
      y = j*scale;//sets y based on scale
      avg = (x+y)/2;//sets the average color of x and y
      stroke(x, y, avg);//calculates color based on location
      point(x, y);//finally draws the point
  }
}
