
/*@pjs preload="cloud1.png";*/
/*@pjs preload="cloud2.png";*/
/*@pjs preload="cloud3.png";*/
/*pjs preload="owl1.png";*/

float rad = 0.0;
float time = 1.0;
float timer = 0.0;
float s = 0.5;
float counter;
float increment = 0.1;
PImage cloud1;
PImage cloud2;
PImage cloud3;
PImage owl1;
PImage majora;


float r = random(901);//use for lines



void setup()
{

  size(900, 900);
  cloud1 = loadImage("cloud1.png");
  cloud2 = loadImage("cloud2.png");
  cloud3 = loadImage("cloud3.png");
  owl1   = loadImage("owl1.png");
  majora = loadImage("majora.png");
  smooth();
  background(random(255), random(255), random(255));
  frameRate(30);
}

void draw()
{

  float noise1 = noise(time)*width;
  time+=increment;

  rad = rad + 0.1;
  s = s + 0.001;

  float snoise = (noise1*s);


  timer = timer+(1.0/30.0);
  println(timer);
  if (timer >=0&& timer <15)
  {

    colorMode(HSB);

    fill(random(255), random(255), random(255), 255);
    rectMode(CENTER);


    tint(random(255), random(255), random(255), random(50));

    //image(cloud3,0,0,width,height);

    //center circle boom

    fill(random(255), random(255), random(255), 255);


    fill(0, 0, 0, 0);
    strokeWeight(3);
    stroke(random(255), random(255), random(255), random(255));
    ellipse(height/2, width/2, noise1, noise1);



    colorMode(RGB);
    tint(random(255), random(255), random(255), random(20));


    image(owl1, 0, 0, height, width);






    //central cc square
    pushMatrix();

    translate(width/2, height/2);
    rotate(-rad);
    scale(-s);

    tint(random(255), random(255), random(255), random(100));

    image (cloud1, 0, 0, width, height);


    popMatrix();



    //outer square
    tint(random(255), random(255), random(255), random(100));
    translate(width/2, height/2);
    rotate(counter*TWO_PI/360);
    translate(-cloud2.width/2, -cloud2.height/2);
    scale(s);


    image (cloud2, 0, 0, width/2, height/2);




    counter++;
    translate(width/2, height/2);
    rotate(counter*TWO_PI/360);
    translate(-cloud2.width/2, -cloud2.height/2);
    image(cloud2, noise1, noise1);
  }
  if (timer >=15 && timer<=19)
  {
    colorMode(HSB);
    imageMode(CENTER);
    fill(random(255), random(255), random(255), 255);
    pushMatrix();
    scale(s);
    ellipseMode(CENTER);
    ellipse(width/2, height/2, 2*noise1, 2*noise1);
    popMatrix();
  }

  if (timer >=20)
  {
       fill(#000000);
   
   rectMode(CORNERS);
   rect (0,0,900,900);
    strokeWeight(3);
    stroke(random(255), random(255), random(255), random(255));
    ellipse(height/2, width/2, noise1, noise1);



    colorMode(RGB);
    tint(random(255), random(255), random(255), random(20));


    image(majora, width/2, height/2, noise1, noise1);
  }

if(timer>=25)
{
imageMode(CENTER);
image (owl1, width/2,height/2);
}

if(timer>=30)
{
//central cc square
   colorMode(HSB);
    pushMatrix();

    translate(width/2, height/2);
    rotate(-rad);
    scale(-s);

    tint(random(255), random(255), random(255), random(100));

    image (cloud1, 0, 0, width, height);


    popMatrix();

    
}

  //  rad = rad -0.1;
  //   pushMatrix();

  //   pushMatrix();

  //pushMatrix();

  //  translate(100, 100);
  //  rotate(radians(45));
  //  scale(2);
  //  rectMode(CENTER);
  // rect(0, 0, 100, 100);

  // popMatrix();
}



