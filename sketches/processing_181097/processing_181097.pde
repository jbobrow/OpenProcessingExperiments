
// new snow, jared kant 2014
//
// based upon rain with
// troubleshooting thanks to http://bit.ly/1xLLPBB
// and http://bit.ly/1wkEB0I
//
// speed of fall (determined by array snowflakey[])
// increases based on size of flake, giving illusion of distance

int snowcloud = 25;
int i, j, n, x, gravity;
float snowflakex[] = new float [snowcloud];
float snowflakey[] = new float [snowcloud];
float snowflakesize[] = new float [snowcloud];
int cloudsize = 25;
float wind[] = new float [cloudsize];
float extrax[] = new float [cloudsize];
float extrasize [] = new float [cloudsize];
float extray [] = new float [cloudsize];
float snowtrajectory, extratrajectory;
String winddirection = "R";

void setup()
{
  int xwidth=800;
  int yheight=500;  
  size(xwidth, yheight);
  frameRate(20);
  snowfall();
}

void snowfall()
{
  for (i=0; i<snowcloud; i++) {
    snowflakex[i]=random(0, width);
    snowflakesize[i]=random(1, 5);
  }
}

void draw()
{
  background(0);
  smooth();
  for (int n=0; n<snowcloud; n++) {
    for (x=0; x<snowcloud; x++) {
      snowtrajectory = snowflakex[n];
      extratrajectory = extrax[n] + wind[n];
      fill(255, 255, 255);
      ellipse(snowtrajectory, snowflakey[n], snowflakesize[n], snowflakesize[n]);
      //      fill(255, 0, 0);
      ellipse(extratrajectory, extray[n], extrasize[n], extrasize[n]);
    }
    snowflakey[n] += 1 + snowflakesize[n];
    extray[n]+=1+extrasize[n];
    if (wind[n]<width && winddirection == "R") {      
      wind[n]=wind[n]+1;
      if (wind[n]>width-1) {
        winddirection="L";
      }
    }
    if (wind[n]>0 && winddirection == "L") {
      wind[n]=wind[n]-1;
      if (wind[n]<1) {
        winddirection="R";
      }
    }


    if (snowflakey[n] > 499) 
    { 
      snowflakey[n] = 0;
      extray[n]=0;
      snowflakex[n]=random(0, width);
      extrax[n] = random(0, width);
      extrasize[n] = random(1, 5);
    }
  }
}

