
PImage jello;
PImage eye;
PImage letrip;
PImage spinnything;
PImage fire;
PImage water;
PImage pinkman1;
PImage meditation1;
PImage glass;
PImage jello2;


//
float increment = 0.1;
float time = 1.0;
float noise1 = noise(time)*width;
float noiseincrement;


PFont times;
float x = 0;
float y = 0;
float myscale = 1;
float scaler = 0;
float myscalespeed = 0.01;
float xspeed = 1;
float yspeed = 1;
float rad = 0.0;
float opacity;

float timer = 0.0;
float s = 1.0;



void setup()
{
  size(500, 500);

  times = createFont("Times New Roman", 32);
  arial = createFont("Arial", 32);
  blackoak = createFont("Blackoak Std", 32);

  jello = requestImage("jello.png");
  jello2 = requestImage("jello2.png");
  eye = requestImage("Magic-eye.jpg");
  letrip = requestImage("letrip.gif");
  spinnything = requestImage("spinnything.png");
  fire = requestImage("fire1.jpg");
  water = requestImage("water1.png");
  pinkman1 = requestImage("pinkman1.jpg");
  meditation1 = requestImage("meditation1.jpg");
  glass = requestImage("Broken-Black-Glass-HD-Wallpapers.jpg");
  yinyang = requestImage("yinyang.jpg");

  frameRate(30);
}




//poetry strings
String a = "The Tension in you";
String b = "So vast and powerful";
String c = "unbeheld to the eye of men.";
//
String d = "Transparent yet glassy,";
String e = "your secrets remain hidden.";
//
String f = "Although most see you as fake,";
String g = "I see beyond";
//
String h = "Your hue alures me,";
String i = "And your taste is estacy";
String j = "neither could I live without";
//

String n = "my only friend";
String o = "Jello";
String p = "Yes, fucking Jello";


void draw()
{
  background(255);

  timer = timer + (1.0/30.0);
  println(timer);
  textAlign(CENTER, CENTER); //center screen text align

  time += noiseincrement;

  //Start Poem

  if (timer >=0 && timer <5) //"The Tension in you"
  {
    image(jello, 0, 0, width, height);

    float widthOfA = textWidth(a);
    if (x > width - widthOfA)
    {
      xspeed = -1;
    }
    else if (x<0);    
    {
      xspeed = 1;
    }
    x += xspeed;


    myscale += myscalespeed;

    if (myscale > 10)
    {
      myscalespeed = -myscalespeed;
    }
    else if (myscale < 1)
    {
      myscalespeed = -myscalespeed;
    }


    pushMatrix();


    translate(x, height/2);
    // scale it by myscale
    scale(myscale);
    fill(0);
    text(a, 50, 0);

    popMatrix();


    //"So vast and powerful"
    if (timer >=3 && timer < 5) 
    {
      textFont(times);
      float widthOfB = textWidth(b);
      if (x > width - widthOfB)
      {
        xspeed = -1;
      }

      pushMatrix();
      y = y + 1;
      text(b, x+100, y);
      popMatrix();
    }
  }

  //"unbeheld to the eye of men."
  if (timer >=5 && timer < 7)
  {    
    image(eye, 0, 0, width, height);
    textFont(times);
    fill(255);
    float widthOfC = textWidth(c);
    x = x - 10;
    text(c, x, height/2);
  }



  if (timer >=7 && timer < 9)
  {
    image(eye, 0, 0, width, height);
  }



  //"Transparent yet glassy,"
  if (timer >= 9 && timer < 11 )
  {
    image(letrip, 0, 0, width, height);
    textSize(50);
    fill(255);
    text(d, width/2, height/2);
  }


  //"your secrets remain hidden."
  if (timer >= 10 && timer < 15 )
  {
    image(letrip, 0, 0, width, height);
    textSize(20);
    text(e, width/2, height/2);
  }


  //"Although most see you as fake,"
  if (timer >= 13 && timer < 16 )
  {
    translate(300, height/2);
    text(f, -150, 200);
  }

  //"I see beyond"
  if (timer >= 16 && timer < 17)
  {
    image(glass, 0, 0, width, height);
    fill(0);
    translate(width/2, height/2);

    textSize(20);
    text(g, 0, 0);
    fill(30);
    text(g, 0, 10);
    fill(60);
    text(g, 0, 20);
  }



  //pause
  //"Your hue alures me,"
  if (timer >= 20 && timer < 23 )
  {
    translate(0, 0); 
    image(spinnything, 0, 0, width, height);
    fill(0, 0, 255);
    translate(width/2, 150);

    textSize(40);
    text(h, 0, 0);
  }


  if (timer >= 21 && timer < 26)
  {
    image(jello, 0, 0, width, height);
  }

  //"And your taste is estacy"
  if (timer >= 21 && timer < 24 )
  {
    fill(255, 0, 0);

    fill(0, 40, 230);
    textSize(30);
    translate(width/2, 450);
    text(i, 0, 0);
  }


  //"my only friend"
  if (timer >= 24 && timer < 28)
  {
    //translate(width/2, height/2);
    translate(width/2, height/2);

    textSize(25);
    text(n, 0, 0);
  }

  //"Jello"
  if (timer >= 26 && timer < 30)
  {

    translate(0, 0);
    image(jello2, 0, 0, width, height);
    fill(0, 50, 205);


    translate(width/2, height/2);
    textSize(70);
    fill(50, 5, 205);
    text(o, 0, 0);
    translate(0, 0);
  }


  //"Yes, fucking Jello"
  if (timer >= 33 && timer < 40)
  {
    opacity = opacity + 10;
    tint(255, 255, 255, opacity);

    //  translate(width/2, height/2);
    image(pinkman1, 0, 0, width, height);

    translate(width/2, height/2);
    textSize(30);
    fill(255);
    text(p, 0, 0);
    text("Bitch", 0, 100);
    text("Jello is some serious Shit guys", 0, 200);
  }
}



