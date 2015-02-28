
float radius;
int timespressed,last;
PImage Loss;
PImage title;
PImage title2;
PFont test;


float s = 0;
boolean gameplay = true;

void setup()
{
  size(480,320);
  radius=10;
  smooth();
  Loss = loadImage("GameLoss.gif");
  title = loadImage("GameTitle.gif");
  title2 = loadImage("GameTitle2.gif");
  test = loadFont("AmericanTypewriter-48.vlw");
  float s = second();
}

void draw ()
{

  background(0);
  //gameplay = false;
  if (key!= 98)
  {
   // text ("press d", 10,150);
  }
 
  if(key == 100)
  {
    gameplay = false;
    image(title, 0,0, 480,320);
  }

  if (key== ENTER)
  {
    image(title2,0,0,  480,320);
  }

  if (key== 98)
  {
    gameplay = true;
   //rect(0,0, 10, 150);
  }

  //  if ((key != 98))
  //  { 
  //    gameplay= false;
  //  }

  if(gameplay== true)
  {

    ellipse(width/2,height/2,radius*1.6,radius*1.6);

    radius++;
    //rect(0,0, 150,150);
  }

  if(radius > 205  )
  {
    image(Loss, 0,0, 480,320);
    //radius%=width/2;
  }
}

void keyPressed()
{

  println(radius);



  if(key== 97)
  {
    gameplay = true;

    timespressed++;
    if(timespressed>last) {
      radius=0;
      last=timespressed;
      timespressed=0;




//      pushMatrix();
//      fill(0);
//      text("press d", 150, 150);
//      popMatrix();
    }
  }
}




//a huge thanks to Michael and Jonathan for a great year and to all of the people on the processing forum for helping 
//me to learn from my mistakes ans to tom for sitting next to me 


