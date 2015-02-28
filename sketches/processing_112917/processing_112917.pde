
PImage BACKGROUND;
PImage BG;
PImage bg1;
PImage pinkdot;
PImage pinkcurl;
PImage multi;
PImage orange;
PImage yellow;
PImage feather;
PImage multi2;
PImage pinkdot2;



void setup()

{

  bg1= loadImage( "bg1.jpg" );
  pinkcurl= loadImage( "pink-curl.png" );
  pinkdot= loadImage( "pink-dot.png" );
  multi= loadImage( "multi.png" );
  feather=loadImage( "feather.png");
  yellow= loadImage( "yellow.png" );
  orange=loadImage( "orange.png" );
    multi2=loadImage( "multi2.png" );
        pinkdot2=loadImage( "pink-dot2.png" );


  size (600, 600);
  smooth();
}

void draw ()
{
  image(bg1, random(0,2),random(0,2));
  float x= random(width);
  float y= random(height);
  float d= random(15, 40);
  float i= random(600, 600);


  image(multi, -50, -30, 500, 500);
  image(pinkdot, 10, y*.05, 600, 600);
  image(pinkdot2, 15, 430, 60, 50);
  image(feather, y*0.005, 200, 700, 700);
  image(orange, 80, 250, 500, 500);
  image(yellow, x*.050, 150, 400, 400);
  image(pinkcurl, y*0.005/2, 150, 500, 500);

  image(pinkcurl, 250, -80, 700, random(680,700));


  image(pinkcurl, 410, 300, 1000, 1000);

    image(pinkcurl, 150, 360, 1000, random(980,1000));

  image(multi2, 200, 300, 250, random(240,250));





  frameRate (3);
}



