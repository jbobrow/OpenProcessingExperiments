
// new snow, jared kant 2014, 2015
//
// based upon rain with
// troubleshooting thanks to http://bit.ly/1xLLPBB
// and http://bit.ly/1wkEB0I
//
// speed of fall (determined by array snowflakey[])
// increases based on size of flake, giving illusion of distance
//
// object-oriented portion based upon Daniel Shiffman's
// OOP processing tutorial at http://bit.ly/1tHmyIf, 
// with a nod to stackoverflow at http://bit.ly/1K8oCha

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
  float fsize = random(3, 5);
  float whichway = 1;
  float xoffset, xdir, middleoffset;
  float time;

  void display()
  {
    ellipse(xp+middleoffset, yp, fsize, fsize);
  }
  void flakemove() {
    if (yp>height && time>100) {        // if object is out of frame entirely
      time=0;
      fsize = random(3, 5);
    } else {
      time+=0.1;
    }
    if (time>200) {
      time=0;
    }
    xp = xp + (time * sin(time))/70;  // * xdir
    yp = yp + 3;
//    text(xdir, 10, 30);      // uncomment to see coordinates
//    text(xp, 10, 40);
//    text(yp, 10, 50);
//    text(time, 10, 60);
    if (xp> width-1 || xp < 1) {
      whichway=-whichway;
      xoffset= random(0.1, 5);
      xdir = xoffset * whichway;
      //      fsize+=0.1;
    }
    if (yp > height) {
      yp=0;
      middleoffset=random(50, 600);
    }
    if (yp>height + 10 && xp>width + 10) {    // bug fix, keeps within bounds
      xp=0;
    }
  }
}

