
PImage[] images = new PImage[4];
PImage[] tweets = new PImage[15];
PImage img = new PImage();
PImage silla;
PImage logo;
PImage eltweet;
PImage share;
float x;
float y;
int r;
int a = 190, b = 10, c= (1028/2), d=(188/2), e=500, f=180, g=1140;
int boton =4;
PFont laletra;

void setup()
{
  size(1280, 760);
  smooth();
  for (int i = 0; i < images.length; i ++)
  {
    images[i] = loadImage( i +".jpg");
  }


  for (int i = 4; i < tweets.length; i ++)
  {
    tweets[i] = loadImage( i +".png");
  }


  for (int i=0; i  < images.length; i ++)
  {
    images[i].resize(a, a);
  }

  laletra = loadFont("AkzidenzGroteskBE-Cn-48.vlw");

  textFont(laletra, 32);

  logo = loadImage("logo.png");
  silla = loadImage("silla.png");
  eltweet = loadImage("eltweet.png");
  share = loadImage("share.png");



  /* for (int j=0; j<4; j++) {
   for (int b=0; b<=760; b=b+190) {
   image(images[j], 0, b);
   }
   }
   */
}
void draw()
{
  //background(255);
  //ellipseMode(CORNER);


  //Botones


  //Boton0
  if (boton==0) {
    if (mousePressed == true) {

      if ( (mouseY<a) &&
        (mouseY>=0) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=0;
      }
      if ( (mouseY<2*a) &&
        (mouseY>=a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=1;
      }
      if ( (mouseY<3*a) &&
        (mouseY>=2*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=2;
      }
      if ( (mouseY<4*a) &&
        (mouseY>=3*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=3;
      }
      if ((mouseY<110) &&
        (mouseY>=40) &&
        (mouseX>width-100-30) &&
        (mouseX<=width-50)) {
        boton=4;
      }
      if ((mouseY<a-40+d+100) &&
        (mouseY>=a-40+100) &&
        (mouseX>720) &&
        (mouseX<=720+c)) {
        boton=7;
      }

      if ( (mouseY<(2*a)-40+d) &&
        (mouseY>=(2*a)-40) &&
        (mouseX>720) &&
        (mouseX<=720+c)) {
        boton=8;
      } 
      if ( (mouseY<(2*a)-40+d+100) &&
        (mouseY>=(2*a)-40+100) &&
        (mouseX>720) &&
        (mouseX<=720+c)) {
        boton=13;
      }
    }

    if ( (mouseY<760) &&
      (mouseY>=0) &&
      (mouseX>0) &&
      (mouseX<=a) ||

      (mouseY<a-40+d+100) &&
      (mouseY>=a-40+100) &&
      (mouseX>720) &&
      (mouseX<=720+c) ||

      (mouseY<(2*a)-40+d) &&
      (mouseY>=(2*a)-40) &&
      (mouseX>720) &&
      (mouseX<=720+c) ||

      (mouseY<110) &&
      (mouseY>=40) &&
      (mouseX>width-100-30) &&
      (mouseX<=width-50) ||

      (mouseY<(2*a)-40+d+100) &&
      (mouseY>=(2*a)-40+100) &&
      (mouseX>720) &&
      (mouseX<=720+c)

    ) 
    {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }


    background(255);

    fill(255, 102, 0);
    noStroke();
    rect(0, 0, width, 150);

imageMode(CORNER);
    image(silla, 1150, 30);
    image(logo, 200, 30);
    image(images[0], 0, 0);
    image(images[1], 0, a);
    image(images[2], 0, 2*a);
    image(images[3], 0, 3*a);

    imageMode(CENTER);
    image(images[0], (width/2)-200, (height/2), 400, 400);
    image(tweets[6], (width)-300, (a+100), c, 227/2);
    image(tweets[7], (width)-300, (2*a), c, 152/2);
    image(tweets[10], (width)-300, (2*a)+100, c, d);

    fill(0);
    textSize(36);
    String t = "Elija un tweet";
    text(t, width-400, height-100);
    noFill();
  }

  //Boton1
  if (boton==1) {

    background(255);
    //ellipse(width-50, 50, 60, 60);
    fill(255, 102, 0);
    noStroke();
    rect(0, 0, width, 150);
    imageMode(CORNER);
    image(silla, 1150, 30);
    image(logo, 200, 30);

    imageMode(CORNER);
    image(images[0], 0, 0);
    image(images[1], 0, a);
    image(images[2], 0, 2*a);
    image(images[3], 0, 3*a);


    imageMode(CENTER);
    image(images[1], (width/2)-200, (height/2), 400, 400);
    image(tweets[4], (width)-300, (a+100), c, d);
    image(tweets[8], (width)-300, (2*a), c, 160/2);
    image(tweets[9], (width)-300, (2*a)+100, c, 226/2);

    fill(0);
    textSize(36);
    String t = "Elija un tweet";
    text(t, width-400, height-100);
    noFill();

    //Mano

    if ( (mouseY<760) &&
      (mouseY>=0) &&
      (mouseX>0) &&
      (mouseX<=a) ||

      (mouseY<a-40+d+100) &&
      (mouseY>=a-40+100) &&
      (mouseX>720) &&
      (mouseX<=720+c) ||

      (mouseY<(2*a)-40+d) &&
      (mouseY>=(2*a)-40) &&
      (mouseX>720) &&
      (mouseX<=720+c) ||

      (mouseY<110) &&
      (mouseY>=40) &&
      (mouseX>width-100-30) &&
      (mouseX<=width-50) ||

      (mouseY<(2*a)-40+d+100) &&
      (mouseY>=(2*a)-40+100) &&
      (mouseX>720) &&
      (mouseX<=720+c)

    ) 
    {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }

    //OtrosBotones 
    if (mousePressed == true) {

      if ( (mouseY<a) &&
        (mouseY>=0) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=0;
      }
      if ( (mouseY<2*a) &&
        (mouseY>=a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=1;
      }
      if ( (mouseY<3*a) &&
        (mouseY>=2*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=2;
      }
      if ( (mouseY<4*a) &&
        (mouseY>=3*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=3;
      }

      if ((mouseY<a-40+d+100) &&
        (mouseY>=a-40+100) &&
        (mouseX>720) &&
        (mouseX<=720+c)) {
        boton=5;
      }

      if ( (mouseY<(2*a)-40+d) &&
        (mouseY>=(2*a)-40) &&
        (mouseX>720) &&
        (mouseX<=720+c)) {
        boton=6;
      } 
      if ((mouseY<110) &&
        (mouseY>=40) &&
        (mouseX>width-100-30) &&
        (mouseX<=width-50)) {
        boton=4;
      }
      if ( (mouseY<(2*a)-40+d+100) &&
        (mouseY>=(2*a)-40+100) &&
        (mouseX>720) &&
        (mouseX<=720+c)) {
        boton=14;
      }
    }
  }


  //Boton2
  if (boton==2) {

    if (mousePressed == true) {

      if ( (mouseY<a) &&
        (mouseY>=0) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=0;
      }
      if ( (mouseY<2*a) &&
        (mouseY>=a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=1;
      }
      if ( (mouseY<3*a) &&
        (mouseY>=2*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=2;
      }
      if ( (mouseY<4*a) &&
        (mouseY>=3*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=3;
      }
      if ((mouseY<110) &&
        (mouseY>=40) &&
        (mouseX>width-100-30) &&
        (mouseX<=width-50)) {
        boton=4;
      }
      if ((mouseY<a-40+d+100) &&
        (mouseY>=a-40+100) &&
        (mouseX>720) &&
        (mouseX<=720+c)) {
        boton=9;
      }

      if ( (mouseY<(2*a)-40+d) &&
        (mouseY>=(2*a)-40) &&
        (mouseX>720) &&
        (mouseX<=720+c)) {
        boton=10;
      } 
      if ( (mouseY<(2*a)-40+d+100) &&
        (mouseY>=(2*a)-40+100) &&
        (mouseX>720) &&
        (mouseX<=720+c)) {
        boton=15;
      }
      if ((mouseY<height-110+40) &&
        (mouseY>=height-110) &&
        (mouseX>width-210) &&
        (mouseX<=width-210+a-20)) {
        boton=18;
      }
    }

    if ( 

    (mouseY<760) &&
      (mouseY>=0) &&
      (mouseX>0) &&
      (mouseX<=a) ||

      (mouseY<a-40+d+100) &&
      (mouseY>=a-40+100) &&
      (mouseX>720) &&
      (mouseX<=720+c) ||

      (mouseY<(2*a)-40+d) &&
      (mouseY>=(2*a)-40) &&
      (mouseX>720) &&
      (mouseX<=720+c) ||

      (mouseY<110) &&
      (mouseY>=40) &&
      (mouseX>width-100-30) &&
      (mouseX<=width-50) ||

      (mouseY<(2*a)-40+d+100) &&
      (mouseY>=(2*a)-40+100) &&
      (mouseX>720) &&
      (mouseX<=720+c)

    ) 
    {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }


    background(255);
    // ellipse(width-50, 50, 60, 60);

    fill(255, 102, 0);
    noStroke();
    rect(0, 0, width, 150);
    imageMode(CORNER);
    image(silla, 1150, 30);
    image(logo, 200, 30);
    imageMode(CORNER);
    image(images[0], 0, 0);
    image(images[1], 0, a);
    image(images[2], 0, 2*a);
    image(images[3], 0, 3*a);

    imageMode(CENTER);
    image(images[2], (width/2)-200, (height/2), 400, 400);
    image(tweets[13], (width)-300, (a+100), c, d);
    image(tweets[5], (width)-300, (2*a), c, d);
    image(tweets[14], (width)-300, (2*a)+100, c, d);
    fill(0);
    textSize(36);
    String t = "Elija un tweet";
    text(t, width-400, height-100);
    noFill();
  }
  //Boton3
  if (boton==3) {

    if (mousePressed == true) {

      if ( (mouseY<a) &&
        (mouseY>=0) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=0;
      }
      if ( (mouseY<2*a) &&
        (mouseY>=a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=1;
      }
      if ( (mouseY<3*a) &&
        (mouseY>=2*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=2;
      }
      if ( (mouseY<4*a) &&
        (mouseY>=3*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=3;
      }
      if ((mouseY<110) &&
        (mouseY>=40) &&
        (mouseX>width-100-30) &&
        (mouseX<=width-50)) {
        boton=4;
      }
      if ((mouseY<a-40+d+100) &&
        (mouseY>=a-40+100) &&
        (mouseX>720) &&
        (mouseX<=720+c)) {
        boton=11;
      }

      if ( (mouseY<(2*a)-40+d) &&
        (mouseY>=(2*a)-40) &&
        (mouseX>720) &&
        (mouseX<=720+c)) {
        boton=12;
      }
      if ((mouseY<height-110+40) &&
        (mouseY>=height-110) &&
        (mouseX>width-210) &&
        (mouseX<=width-210+a-20)) {
        boton=18;
      }
    }

    if ( (mouseY<760) &&
      (mouseY>=0) &&
      (mouseX>0) &&
      (mouseX<=a) ||

      (mouseY<a-40+d+100) &&
      (mouseY>=a-40+100) &&
      (mouseX>720) &&
      (mouseX<=720+c) ||

      (mouseY<(2*a)-40+d) &&
      (mouseY>=(2*a)-40) &&
      (mouseX>720) &&
      (mouseX<=720+c) ||

      (mouseY<110) &&
      (mouseY>=40) &&
      (mouseX>width-100-30) &&
      (mouseX<=width-50) ||

      (mouseY<(2*a)-40+d+100) &&
      (mouseY>=(2*a)-40+100) &&
      (mouseX>720) &&
      (mouseX<=720+c)

    ) 
    {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }



    background(255);

    fill(255, 102, 0);
    noStroke();
    rect(0, 0, width, 150);
    imageMode(CORNER);
    image(silla, 1150, 30);
    image(logo, 200, 30);

    imageMode(CORNER);
    image(images[0], 0, 0);
    image(images[1], 0, a);
    image(images[2], 0, 2*a);
    image(images[3], 0, 3*a);

    imageMode(CENTER);
    image(images[3], (width/2)-200, (height/2), 400, 400);
    image(tweets[12], (width)-300, (a+100), c, d);
    image(tweets[11], (width)-300, (2*a), c, 224/2);
    //ellipse(width-50, 50, 60, 60);

    fill(0);
    textSize(36);
    String t = "Elija un tweet";
    text(t, width-400, height-100);
    noFill();
  }

  if (boton==4) {
    //ellipse(width-50, 50, 60, 60);
    if (((mouseY<760) &&
      (mouseY>=0) &&
      (mouseX>0) &&
      (mouseX<=a)) 
      ) 


    {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }

    if (mousePressed == true) {

      if ( (mouseY<a) &&
        (mouseY>=0) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=0;
      }
      if ( (mouseY<2*a) &&
        (mouseY>=a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=1;
      }
      if ( (mouseY<3*a) &&
        (mouseY>=2*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=2;
      }
      if ( (mouseY<4*a) &&
        (mouseY>=3*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=3;
      }
      if ((mouseY<110) &&
        (mouseY>=40) &&
        (mouseX>width-100-30) &&
        (mouseX<=width-50)) {
        boton=4;
      }
      if ((mouseY<height-110+40) &&
        (mouseY>=height-110) &&
        (mouseX>width-210) &&
        (mouseX<=width-210+a-20)) {
        boton=18;
      }
    }
    //FinBotones

    background(255);
    fill(255, 102, 0);
    noStroke();
    rect(0, 0, width, 150);
    imageMode(CORNER);
    image(silla, 1150, 30);
    image(logo, 200, 30);
    //image(tweet, width/2, height/2);
    image(images[0], 0, 0);
    image(images[1], 0, a);
    image(images[2], 0, 2*a);
    image(images[3], 0, 3*a);

    fill(0);
    textFont(laletra);
    textSize(76);
    String s = "Mezcle una imagen y un tweet y logre un meme político al instante.";
    text(s, width/2-200, height/2-200, 400, 500);
    textSize(36);
    String t = "Elija un personaje";
    text(t, width-400, height-100);
    noFill();

    //ellipse(width-50, 50, 60, 60);
  }

  if (boton==5) {


    if (((mouseY<760) &&
      (mouseY>=0) &&
      (mouseX>0) &&
      (mouseX<=190)) ||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-20) &&
      (mouseX<=width-20+a-20))||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-200) &&
      (mouseX<=width-200+a-40)) ||

      (mouseY<110) &&
      (mouseY>=40) &&
      (mouseX>width-100-30) &&
      (mouseX<=width-50)



    )
    {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }

    if (mousePressed == true) {

      if ( (mouseY<a) &&
        (mouseY>=0) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=0;
      }
      if ( (mouseY<2*a) &&
        (mouseY>=a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=1;
      }
      if ( (mouseY<3*a) &&
        (mouseY>=2*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=2;
      }
      if ( (mouseY<4*a) &&
        (mouseY>=3*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=3;
      }

      if ( (mouseY< height-100+40) &&
        (mouseY>=height-100) &&
        (mouseX>width-20) &&
        (mouseX<=width-20+a-20)) {
        boton=7;
      }
      if ((mouseY<110) &&
        (mouseY>=40) &&
        (mouseX>width-100-30) &&
        (mouseX<=width-50)) {
        boton=4;
      }
      if ((mouseY<height-110+40) &&
        (mouseY>=height-110) &&
        (mouseX>width-210) &&
        (mouseX<=width-210+a-20)) {
        boton=18;
      }
    }

    background(255);

    fill(255, 102, 0);
    noStroke();
    rect(0, 0, width, 150);
    imageMode(CORNER);
    image(silla, 1150, 30);
    image(logo, 200, 30);

    imageMode(CORNER);
    image(images[0], 0, 0);
    image(images[1], 0, a);
    image(images[2], 0, 2*a);
    image(images[3], 0, 3*a);

    fill(255, 102, 0);
    noStroke();
    rect(width-210, height-110, a-20, 40);
    stroke(1);

    imageMode(CENTER);
    image(images[1], (width/2), (height/2), 400, 400);
    fill(0);
    textFont(laletra);
    textSize(26);
    String s = "Pobre AUV no quiero imaginar cuanto debe gastar en regalos para todos sus amigos ''secretos''. #ColombianCircus !!!!";
    text(s, width/2-200, height-160, 400, 200);



    textSize(26);
    String t = "Salvar y Compartir";
    text(t, width-200, height-100, a-20, 40);
    //rect(width-200, height-100, a-20, 40);
    noFill();
  }

  if (boton==6) {


    if (((mouseY<760) &&
      (mouseY>=0) &&
      (mouseX>0) &&
      (mouseX<=190)) ||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-20) &&
      (mouseX<=width-20+a-20))||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-200) &&
      (mouseX<=width-200+a-40))



    )
    {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }

    if (mousePressed == true) {

      if ( (mouseY<a) &&
        (mouseY>=0) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=0;
      }
      if ( (mouseY<2*a) &&
        (mouseY>=a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=1;
      }
      if ( (mouseY<3*a) &&
        (mouseY>=2*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=2;
      }
      if ( (mouseY<4*a) &&
        (mouseY>=3*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=3;
      }

      if ( (mouseY< height-100+40) &&
        (mouseY>=height-100) &&
        (mouseX>width-20) &&
        (mouseX<=width-20+a-20)) {
        boton=7;
      }
      if ((mouseY<110) &&
        (mouseY>=40) &&
        (mouseX>width-100-30) &&
        (mouseX<=width-50)) {
        boton=4;
      }
      if ((mouseY<height-110+40) &&
        (mouseY>=height-110) &&
        (mouseX>width-210) &&
        (mouseX<=width-210+a-20)) {
        boton=18;
      }
    }

    background(255);

    fill(255, 102, 0);
    noStroke();
    rect(0, 0, width, 150);
    imageMode(CORNER);
    image(silla, 1150, 30);
    image(logo, 200, 30);

    imageMode(CORNER);
    image(images[0], 0, 0);
    image(images[1], 0, a);
    image(images[2], 0, 2*a);
    image(images[3], 0, 3*a);

    fill(255, 102, 0);
    noStroke();
    rect(width-210, height-110, a-20, 40);
    stroke(1);

    imageMode(CENTER);
    image(images[1], (width/2), (height/2), 400, 400);
    fill(0);
    textFont(laletra);
    textSize(26);
    String s = "A este paso, mis errores tendrán que aprender de mí.";
    text(s, width/2-200, height-160, 415, 200);



    textSize(26);
    String t = "Salvar y Compartir";
    text(t, width-200, height-100, a-20, 40);
    //rect(width-200, height-100, a-20, 40);
    noFill();
  }

  if (boton==14) {


    if (((mouseY<760) &&
      (mouseY>=0) &&
      (mouseX>0) &&
      (mouseX<=190)) ||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-20) &&
      (mouseX<=width-20+a-20))||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-200) &&
      (mouseX<=width-200+a-40))



    )
    {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }

    if (mousePressed == true) {

      if ( (mouseY<a) &&
        (mouseY>=0) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=0;
      }
      if ( (mouseY<2*a) &&
        (mouseY>=a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=1;
      }
      if ( (mouseY<3*a) &&
        (mouseY>=2*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=2;
      }
      if ( (mouseY<4*a) &&
        (mouseY>=3*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=3;
      }

      if ( (mouseY< height-100+40) &&
        (mouseY>=height-100) &&
        (mouseX>width-20) &&
        (mouseX<=width-20+a-20)) {
        boton=7;
      }
      if ((mouseY<110) &&
        (mouseY>=40) &&
        (mouseX>width-100-30) &&
        (mouseX<=width-50)) {
        boton=4;
      }
      if ((mouseY<height-110+40) &&
        (mouseY>=height-110) &&
        (mouseX>width-210) &&
        (mouseX<=width-210+a-20)) {
        boton=18;
      }
    }

    background(255);

    fill(255, 102, 0);
    noStroke();
    rect(0, 0, width, 150);
    imageMode(CORNER);
    image(silla, 1150, 30);
    image(logo, 200, 30);

    imageMode(CORNER);
    image(images[0], 0, 0);
    image(images[1], 0, a);
    image(images[2], 0, 2*a);
    image(images[3], 0, 3*a);

    fill(255, 102, 0);
    noStroke();
    rect(width-210, height-110, a-20, 40);
    stroke(1);

    imageMode(CENTER);
    image(images[1], (width/2), (height/2), 400, 400);
    fill(0);
    textFont(laletra);
    textSize(26);
    String s = "Mentiras amiguitos comediantes, ustedes son chéveres como un pimpón y nos hacen morir de risa.";
    text(s, width/2-200, height-160, 415, 200);



    textSize(26);
    String t = "Salvar y Compartir";
    text(t, width-200, height-100, a-20, 40);
    //rect(width-200, height-100, a-20, 40);
    noFill();
  }

  if (boton==7) {


    if (((mouseY<760) &&
      (mouseY>=0) &&
      (mouseX>0) &&
      (mouseX<=190)) ||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-20) &&
      (mouseX<=width-20+a-20))||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-200) &&
      (mouseX<=width-200+a-40))



    )
    {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }

    if (mousePressed == true) {

      if ( (mouseY<a) &&
        (mouseY>=0) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=0;
      }
      if ( (mouseY<2*a) &&
        (mouseY>=a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=1;
      }
      if ( (mouseY<3*a) &&
        (mouseY>=2*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=2;
      }
      if ( (mouseY<4*a) &&
        (mouseY>=3*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=3;
      }

      if ( (mouseY< height-100+40) &&
        (mouseY>=height-100) &&
        (mouseX>width-20) &&
        (mouseX<=width-20+a-20)) {
        boton=7;
      }
      if ((mouseY<110) &&
        (mouseY>=40) &&
        (mouseX>width-100-30) &&
        (mouseX<=width-50)) {
        boton=4;
      }
      if ((mouseY<height-110+40) &&
        (mouseY>=height-110) &&
        (mouseX>width-210) &&
        (mouseX<=width-210+a-20)) {
        boton=18;
      }
    }

    background(255);

    fill(255, 102, 0);
    noStroke();
    rect(0, 0, width, 150);
    imageMode(CORNER);
    image(silla, 1150, 30);
    image(logo, 200, 30);

    imageMode(CORNER);
    image(images[0], 0, 0);
    image(images[1], 0, a);
    image(images[2], 0, 2*a);
    image(images[3], 0, 3*a);

    fill(255, 102, 0);
    noStroke();
    rect(width-210, height-110, a-20, 40);
    stroke(1);

    imageMode(CENTER);
    image(images[0], (width/2), (height/2), 400, 400);
    fill(0);
    textFont(laletra);
    textSize(26);
    String s = "Procurador ya q en Colombia se rifan los cargos publicos, x q no pide la embajada en el Vaticano? Usted seria feliz y mis derechos efectivos";
    text(s, width/2-200, height-160, 400, 200);



    textSize(26);
    String t = "Salvar y Compartir";
    text(t, width-200, height-100, a-20, 40);
    //rect(width-200, height-100, a-20, 40);
    noFill();
  }

  if (boton==8) {


    if (((mouseY<760) &&
      (mouseY>=0) &&
      (mouseX>0) &&
      (mouseX<=190)) ||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-20) &&
      (mouseX<=width-20+a-20))||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-200) &&
      (mouseX<=width-200+a-40))



    )
    {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }

    if (mousePressed == true) {

      if ( (mouseY<a) &&
        (mouseY>=0) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=0;
      }
      if ( (mouseY<2*a) &&
        (mouseY>=a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=1;
      }
      if ( (mouseY<3*a) &&
        (mouseY>=2*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=2;
      }
      if ( (mouseY<4*a) &&
        (mouseY>=3*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=3;
      }

      if ( (mouseY< height-100+40) &&
        (mouseY>=height-100) &&
        (mouseX>width-20) &&
        (mouseX<=width-20+a-20)) {
        boton=7;
      }
      if ((mouseY<110) &&
        (mouseY>=40) &&
        (mouseX>width-100-30) &&
        (mouseX<=width-50)) {
        boton=4;
      }
      if ((mouseY<height-110+40) &&
        (mouseY>=height-110) &&
        (mouseX>width-210) &&
        (mouseX<=width-210+a-20)) {
        boton=18;
      }
    }

    background(255);

    fill(255, 102, 0);
    noStroke();
    rect(0, 0, width, 150);
    imageMode(CORNER);
    image(silla, 1150, 30);
    image(logo, 200, 30);

    imageMode(CORNER);
    image(images[0], 0, 0);
    image(images[1], 0, a);
    image(images[2], 0, 2*a);
    image(images[3], 0, 3*a);

    fill(255, 102, 0);
    noStroke();
    rect(width-210, height-110, a-20, 40);
    stroke(1);

    imageMode(CENTER);
    image(images[0], (width/2), (height/2), 400, 400);
    fill(0);
    textFont(laletra);
    textSize(26);
    String s = "No, no, no ! Digan si al #Aborto pero de #Ordoñez";
    text(s, width/2-200, height-160, 415, 200);



    textSize(26);
    String t = "Salvar y Compartir";
    text(t, width-200, height-100, a-20, 40);
    //rect(width-200, height-100, a-20, 40);
    noFill();
  }

  if (boton==13) {


    if (((mouseY<760) &&
      (mouseY>=0) &&
      (mouseX>0) &&
      (mouseX<=190)) ||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-20) &&
      (mouseX<=width-20+a-20))||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-200) &&
      (mouseX<=width-200+a-40))



    )
    {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }

    if (mousePressed == true) {

      if ( (mouseY<a) &&
        (mouseY>=0) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=0;
      }
      if ( (mouseY<2*a) &&
        (mouseY>=a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=1;
      }
      if ( (mouseY<3*a) &&
        (mouseY>=2*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=2;
      }
      if ( (mouseY<4*a) &&
        (mouseY>=3*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=3;
      }

      if ( (mouseY< height-100+40) &&
        (mouseY>=height-100) &&
        (mouseX>width-20) &&
        (mouseX<=width-20+a-20)) {
        boton=7;
      }
      if ((mouseY<110) &&
        (mouseY>=40) &&
        (mouseX>width-100-30) &&
        (mouseX<=width-50)) {
        boton=4;
      }
      if ((mouseY<height-110+40) &&
        (mouseY>=height-110) &&
        (mouseX>width-210) &&
        (mouseX<=width-210+a-20)) {
        boton=18;
      }
    }

    background(255);

    fill(255, 102, 0);
    noStroke();
    rect(0, 0, width, 150);
    imageMode(CORNER);
    image(silla, 1150, 30);
    image(logo, 200, 30);

    imageMode(CORNER);
    image(images[0], 0, 0);
    image(images[1], 0, a);
    image(images[2], 0, 2*a);
    image(images[3], 0, 3*a);

    fill(255, 102, 0);
    noStroke();
    rect(width-210, height-110, a-20, 40);
    stroke(1);

    imageMode(CENTER);
    image(images[0], (width/2), (height/2), 400, 400);
    fill(0);
    textFont(laletra);
    textSize(26);
    String s = "Me preocupa que Ordoñez se vaya a enterar del embarazo de Shakira... a el no le gustan esos casos";
    text(s, width/2-200, height-160, 415, 200);



    textSize(26);
    String t = "Salvar y Compartir";
    text(t, width-200, height-100, a-20, 40);
    //rect(width-200, height-100, a-20, 40);
    noFill();
  }

  if (boton==9) {


    if (((mouseY<760) &&
      (mouseY>=0) &&
      (mouseX>0) &&
      (mouseX<=190)) ||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-20) &&
      (mouseX<=width-20+a-20))||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-200) &&
      (mouseX<=width-200+a-40))



    )
    {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }

    if (mousePressed == true) {

      if ( (mouseY<a) &&
        (mouseY>=0) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=0;
      }
      if ( (mouseY<2*a) &&
        (mouseY>=a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=1;
      }
      if ( (mouseY<3*a) &&
        (mouseY>=2*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=2;
      }
      if ( (mouseY<4*a) &&
        (mouseY>=3*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=3;
      }

      if ( (mouseY< height-100+40) &&
        (mouseY>=height-100) &&
        (mouseX>width-20) &&
        (mouseX<=width-20+a-20)) {
        boton=7;
      }
      if ((mouseY<110) &&
        (mouseY>=40) &&
        (mouseX>width-100-30) &&
        (mouseX<=width-50)) {
        boton=4;
      }
      if ((mouseY<height-110+40) &&
        (mouseY>=height-110) &&
        (mouseX>width-210) &&
        (mouseX<=width-210+a-20)) {
        boton=18;
      }
    }

    background(255);

    fill(255, 102, 0);
    noStroke();
    rect(0, 0, width, 150);
    imageMode(CORNER);
    image(silla, 1150, 30);
    image(logo, 200, 30);

    imageMode(CORNER);
    image(images[0], 0, 0);
    image(images[1], 0, a);
    image(images[2], 0, 2*a);
    image(images[3], 0, 3*a);

    fill(255, 102, 0);
    noStroke();
    rect(width-210, height-110, a-20, 40);
    stroke(1);

    imageMode(CENTER);
    image(images[2], (width/2), (height/2), 400, 400);
    fill(0);
    textFont(laletra);
    textSize(26);
    String s = "''A rich country is not one where the poor have cars, but where the rich use public transportation.''--Bogota Mayor Gustavo Petro";
    text(s, width/2-200, height-160, 400, 200);



    textSize(26);
    String t = "Salvar y Compartir";
    text(t, width-200, height-100, a-20, 40);
    //rect(width-200, height-100, a-20, 40);
    noFill();
  }

  if (boton==10) {


    if (((mouseY<760) &&
      (mouseY>=0) &&
      (mouseX>0) &&
      (mouseX<=190)) ||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-20) &&
      (mouseX<=width-20+a-20))||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-200) &&
      (mouseX<=width-200+a-40))



    )
    {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }

    if (mousePressed == true) {

      if ( (mouseY<a) &&
        (mouseY>=0) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=0;
      }
      if ( (mouseY<2*a) &&
        (mouseY>=a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=1;
      }
      if ( (mouseY<3*a) &&
        (mouseY>=2*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=2;
      }
      if ( (mouseY<4*a) &&
        (mouseY>=3*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=3;
      }

      if ( (mouseY< height-100+40) &&
        (mouseY>=height-100) &&
        (mouseX>width-20) &&
        (mouseX<=width-20+a-20)) {
        boton=7;
      }
      if ((mouseY<110) &&
        (mouseY>=40) &&
        (mouseX>width-100-30) &&
        (mouseX<=width-50)) {
        boton=4;
      }
      if ((mouseY<height-110+40) &&
        (mouseY>=height-110) &&
        (mouseX>width-210) &&
        (mouseX<=width-210+a-20)) {
        boton=18;
      }
    }

    background(255);

    fill(255, 102, 0);
    noStroke();
    rect(0, 0, width, 150);
    imageMode(CORNER);
    image(silla, 1150, 30);
    image(logo, 200, 30);

    imageMode(CORNER);
    image(images[0], 0, 0);
    image(images[1], 0, a);
    image(images[2], 0, 2*a);
    image(images[3], 0, 3*a);

    fill(255, 102, 0);
    noStroke();
    rect(width-210, height-110, a-20, 40);
    stroke(1);

    imageMode(CENTER);
    image(images[2], (width/2), (height/2), 400, 400);
    fill(0);
    textFont(laletra);
    textSize(26);
    String s = "Cuando uno lanza frases como 'las cosas no podrían estar peor', el universo se lo toma al instante como un reto personal.";
    text(s, width/2-200, height-160, 415, 200);



    textSize(26);
    String t = "Salvar y Compartir";
    text(t, width-200, height-100, a-20, 40);
    //rect(width-200, height-100, a-20, 40);
    noFill();
  }

  if (boton==15) {


    if (((mouseY<760) &&
      (mouseY>=0) &&
      (mouseX>0) &&
      (mouseX<=190)) ||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-20) &&
      (mouseX<=width-20+a-20))||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-200) &&
      (mouseX<=width-200+a-40))



    )
    {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }

    if (mousePressed == true) {

      if ( (mouseY<a) &&
        (mouseY>=0) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=0;
      }
      if ( (mouseY<2*a) &&
        (mouseY>=a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=1;
      }
      if ( (mouseY<3*a) &&
        (mouseY>=2*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=2;
      }
      if ( (mouseY<4*a) &&
        (mouseY>=3*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=3;
      }

      if ( (mouseY< height-100+40) &&
        (mouseY>=height-100) &&
        (mouseX>width-20) &&
        (mouseX<=width-20+a-20)) {
        boton=7;
      }
      if ((mouseY<110) &&
        (mouseY>=40) &&
        (mouseX>width-100-30) &&
        (mouseX<=width-50)) {
        boton=4;
      }
      if ((mouseY<height-110+40) &&
        (mouseY>=height-110) &&
        (mouseX>width-210) &&
        (mouseX<=width-210+a-20)) {
        boton=18;
      }
    }

    background(255);

    fill(255, 102, 0);
    noStroke();
    rect(0, 0, width, 150);
    imageMode(CORNER);
    image(silla, 1150, 30);
    image(logo, 200, 30);

    imageMode(CORNER);
    image(images[0], 0, 0);
    image(images[1], 0, a);
    image(images[2], 0, 2*a);
    image(images[3], 0, 3*a);

    fill(255, 102, 0);
    noStroke();
    rect(width-210, height-110, a-20, 40);
    stroke(1);

    imageMode(CENTER);
    image(images[2], (width/2), (height/2), 400, 400);
    fill(0);
    textFont(laletra);
    textSize(26);
    String s = "Bogota tiene un problema de movilidad cerebral. Si yo fuera @petrogustavo me quitaba la boina. Lo que no sirve que no estorbe";
    text(s, width/2-200, height-160, 415, 200);



    textSize(26);
    String t = "Salvar y Compartir";
    text(t, width-200, height-100, a-20, 40);
    //rect(width-200, height-100, a-20, 40);
    noFill();
  }

  if (boton==11) {


    if (((mouseY<760) &&
      (mouseY>=0) &&
      (mouseX>0) &&
      (mouseX<=190)) ||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-20) &&
      (mouseX<=width-20+a-20))||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-200) &&
      (mouseX<=width-200+a-40))



    )
    {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }

    if (mousePressed == true) {

      if ( (mouseY<a) &&
        (mouseY>=0) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=0;
      }
      if ( (mouseY<2*a) &&
        (mouseY>=a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=1;
      }
      if ( (mouseY<3*a) &&
        (mouseY>=2*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=2;
      }
      if ( (mouseY<4*a) &&
        (mouseY>=3*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=3;
      }

      if ( (mouseY< height-100+40) &&
        (mouseY>=height-100) &&
        (mouseX>width-20) &&
        (mouseX<=width-20+a-20)) {
        boton=7;
      }
      if ((mouseY<110) &&
        (mouseY>=40) &&
        (mouseX>width-100-30) &&
        (mouseX<=width-50)) {
        boton=4;
      }
      if ((mouseY<height-110+40) &&
        (mouseY>=height-110) &&
        (mouseX>width-210) &&
        (mouseX<=width-210+a-20)) {
        boton=18;
      }
    }

    background(255);

    fill(255, 102, 0);
    noStroke();
    rect(0, 0, width, 150);
    imageMode(CORNER);
    image(silla, 1150, 30);
    image(logo, 200, 30);

    imageMode(CORNER);
    image(images[0], 0, 0);
    image(images[1], 0, a);
    image(images[2], 0, 2*a);
    image(images[3], 0, 3*a);

    fill(255, 102, 0);
    noStroke();
    rect(width-210, height-110, a-20, 40);
    stroke(1);

    imageMode(CENTER);
    image(images[3], (width/2), (height/2), 400, 400);
    fill(0);
    textFont(laletra);
    textSize(26);
    String s = "Papi, Si Santos y Capriles se reunen y se ponen de acuerdo cual es más traidor?";
    text(s, width/2-200, height-160, 420, 200);



    textSize(26);
    String t = "Salvar y Compartir";
    text(t, width-200, height-100, a-20, 40);
    //rect(width-200, height-100, a-20, 40);
    noFill();
  }

  if (boton==12) {


    if (((mouseY<760) &&
      (mouseY>=0) &&
      (mouseX>0) &&
      (mouseX<=190)) ||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-20) &&
      (mouseX<=width-20+a-20))||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-200) &&
      (mouseX<=width-200+a-40))



    )
    {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }

    if (mousePressed == true) {

      if ( (mouseY<a) &&
        (mouseY>=0) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=0;
      }
      if ( (mouseY<2*a) &&
        (mouseY>=a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=1;
      }
      if ( (mouseY<3*a) &&
        (mouseY>=2*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=2;
      }
      if ( (mouseY<4*a) &&
        (mouseY>=3*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=3;
      }

      if ( (mouseY< height-100+40) &&
        (mouseY>=height-100) &&
        (mouseX>width-20) &&
        (mouseX<=width-20+a-20)) {
        boton=7;
      }
      if ((mouseY<110) &&
        (mouseY>=40) &&
        (mouseX>width-100-30) &&
        (mouseX<=width-50)) {
        boton=4;
      }
      if ((mouseY<height-110+40) &&
        (mouseY>=height-110) &&
        (mouseX>width-210) &&
        (mouseX<=width-210+a-20)) {
        boton=18;
      }
    }

    background(255);

    fill(255, 102, 0);
    noStroke();
    rect(0, 0, width, 150);
    imageMode(CORNER);
    image(silla, 1150, 30);
    image(logo, 200, 30);

    imageMode(CORNER);
    image(images[0], 0, 0);
    image(images[1], 0, a);
    image(images[2], 0, 2*a);
    image(images[3], 0, 3*a);

    fill(255, 102, 0);
    noStroke();
    rect(width-210, height-110, a-20, 40);
    stroke(1);

    imageMode(CENTER);
    image(images[3], (width/2), (height/2), 400, 400);
    fill(0);
    textFont(laletra);
    textSize(26);
    String s = "Presidente lo que si tengo claro es que si no reeligen a Ordoñez tenemos que contratarlo de abogado defensor, que berraco tan hábil";
    text(s, width/2-200, height-160, 415, 200);



    textSize(26);
    String t = "Salvar y Compartir";
    text(t, width-200, height-100, a-20, 40);
    //rect(width-200, height-100, a-20, 40);
    noFill();
  }

  if (boton==18) {
    //background(255);
    if (((mouseY<760) &&
      (mouseY>=0) &&
      (mouseX>0) &&
      (mouseX<=190)) ||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-20) &&
      (mouseX<=width-20+a-20))||

      ((mouseY< height-100+40) &&
      (mouseY>=height-100) &&
      (mouseX>width-200) &&
      (mouseX<=width-200+a-40))



    )
    {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }
    
    if (mousePressed == true) {

      if ( (mouseY<a) &&
        (mouseY>=0) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=0;
      }
      if ( (mouseY<2*a) &&
        (mouseY>=a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=1;
      }
      if ( (mouseY<3*a) &&
        (mouseY>=2*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=2;
      }
      if ( (mouseY<4*a) &&
        (mouseY>=3*a) &&
        (mouseX>0) &&
        (mouseX<=a)) {
        boton=3;
      }

      if ( (mouseY< height-100+40) &&
        (mouseY>=height-100) &&
        (mouseX>width-20) &&
        (mouseX<=width-20+a-20)) {
        boton=7;
      }
    }

    fill(255, 102, 0);
    noStroke();
    rect(0, 0, width, 150);
    imageMode(CORNER);
    image(silla, 1150, 30);
    image(logo, 200, 30);

    imageMode(CORNER);
    image(images[0], 0, 0);
    image(images[1], 0, a);
    image(images[2], 0, 2*a);
    image(images[3], 0, 3*a);
    imageMode(CENTER);
    //image(share, (width/2)-100+400, height/2, 165, 153);
    image(eltweet, (width/2), height/2);
  }
}


