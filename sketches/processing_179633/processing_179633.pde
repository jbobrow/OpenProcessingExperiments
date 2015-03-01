
// new snow, jared kant 2014
//
// based upon rain with
// troubleshooting thanks to http://bit.ly/1xLLPBB
// and http://bit.ly/1wkEB0I
//
// speed of fall (determined by array snowflakey[])
// increases based on size of flake, giving illusion of distance
//
// object-oriented portion based upon Daniel Shiffman's
// OOP processing tutorial at http://bit.ly/1tHmyIf

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

Flake theFlake;          // oop section
float il;                // oop section


void setup()
{
  int xwidth=800;
  int yheight=500;  
  size(xwidth, yheight);
  frameRate(60);
  snowfall(); 
  theFlake = new Flake();      // oop section
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
      //      fill(255, 0, 0);            // uncomment to color code
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

    //  fill(0, 255, 0);           // uncomment to color code
    theFlake.display();            // oop section
    theFlake.flakemove();          // oop section
}


class Flake {   // constructor
  float xp, yp = random(0, 100);
  float fsize = random(1, 5);
  float whichway = 1;                // determines if the flake floats left or right
  float xoffset, xdir;
  void display()
  {
    // fill(0, 255, 0);              // uncomment to color code

    ellipse((xp+(il*8)), yp+il, fsize, fsize);
  }
  void flakemove() {
    xp = xp + xdir;
    yp = yp + xoffset + fsize;

    //    text(xdir, 10, 30);
    //    text(xp, 10, 40);        // uncomment this section to enable coordinates for sprite
    //    text(yp, 10, 50);
    //    text(fsize, 10, 60);      

    fsize=fsize+0.03;
    if (xp> width-1 || xp < 1) {
      whichway=-whichway;
      xoffset= random(0.1, 5);
      xdir = xoffset * whichway;
    }
    if (yp> height + 10) {
      yp=0;
      fsize=1;
    }
    if (yp>height + 10 && xp>width + 10) {    // bug fix
      xp=0;
    }
  }
}

