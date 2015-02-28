
import ddf.minim.*;


Minim minim;
AudioPlayer music;
AudioSample click;



int card = 1;
boolean move = true;
boolean keyMoving = false;

//PFont font;
PImage card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, die;



//SETUP
void setup() {
  size(640, 480);
  smooth();

  minim = new Minim(this);
  music = minim.loadFile("burial.mp3");
  click = minim.loadSample("click.mp3");
  
  music.loop();
  
  card1 = loadImage("1.JPG");
  card2 = loadImage("2.JPG");
  card3 = loadImage("3.JPG");
  card4 = loadImage("4.JPG");
  card5 = loadImage("5.JPG");
  card6 = loadImage("6.JPG");
  card7 = loadImage("7.JPG");
  card8 = loadImage("8.JPG");
  card9 = loadImage("9.JPG");
  card10 = loadImage("10.JPG");
  card11 = loadImage("11.JPG");
  die = loadImage("die.gif");

  //font = loadFont("FrucadeSmallExtended-24.vlw");
  //textFont(font);
}



//DRAW
void draw() {
  background(255);
  noStroke();
  
//CARD1

//music.trigger();

  if (card == 1)
  {
    fill (255, 80);

    image(card1, 0,0);
    
    float left2 = 274;
    float right2 = 342;
    float top2 = 264;
    float bottom2 = 284;

    float left3 = 418;
    float right3 = 497;
    float top3 = 264;
    float bottom3 = 284;


    if (mouseX > left2 && mouseX < right2 && mouseY > top2 && mouseY < bottom2) {

      quad (left2, top2, right2, top2, right2, bottom2, left2, bottom2);
      if (mousePressed && move)
      {
        click.trigger();
        card = 2;
        move = false;
      }
    }

    if (mouseX > left3 && mouseX < right3 && mouseY > top3 && mouseY < bottom3) {
      quad (left3, top3, right3, top3, right3, bottom3, left3, bottom3);
      if (mousePressed && move)
      {
        click.trigger();
        card = 2;
        move = false;
      }
    }
  }


  //CARD2

  else if (card == 2)
  {
    image(card2, 0,0);
    float left = 330;
    float right = 443;
    float top = 289;
    float bottom = 310;
    
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      quad (left, top, right, top, right, bottom, left, bottom);
      if (mousePressed && move)
      {
        click.trigger();
        card = 3;
        move = false;
      }
    }
  }

  //CARD3
  else if (card == 3)
  {
    image(card3, 0,0);

    float left = 123;
    float right = 224;
    float top = 156;
    float bottom = 288;

    float left2 = 269;
    float right2 = 370;
    float top2 = 186;
    float bottom2 = 288;

    float left3 = 415;
    float right3 = 556;
    float top3 = 156;
    float bottom3 = 288;

    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom){
      quad (left, top, right, top, right, bottom, left, bottom);
      if (mousePressed && move)
      {
        click.trigger();
        card = 4;
        move = false;
      }
    }
    else if (mouseX > left2 && mouseX < right2 && mouseY > top2 && mouseY < bottom2) {
      quad (left2, top2, right2, top2, right2, bottom2, left2, bottom2);
      if (mousePressed && move)
      {
        click.trigger();
        card = 6;
        move = false;
      }
    }
    else if (mouseX > left3 && mouseX < right3 && mouseY > top3 && mouseY < bottom3){ 
      quad (left3, top3, right3, top3, right3, bottom3, left3, bottom3);
      if (mousePressed && move)
      {
        click.trigger();
        card = 10;
        move = false;
      }
    }
  }


  //CARD4
  else if (card == 4)
  {
    fill (0, 80);
    image(card4, 0,0);
    float left = 294;
    float right = 405;
    float top = 231;
    float bottom = 251;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      quad (left, top, right, top, right, bottom, left, bottom);
      if (mousePressed && move)
      {
        click.trigger();
        card = 5;
        move = false;
      }
    }
  }


  //CARD5

   else if (card == 5)
  {
    fill(255, 80);
   image(card5, 0,0);
    image(die, 275, 171);

    float left = 236;
    float right = 277;
    float top = 275;
    float bottom = 295;

    float left2 = 333;
    float right2 = 405;
    float top2 = 276;
    float bottom2 = 295;
    
   if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom){
    quad (left, top, right, top, right, bottom, left, bottom);
     if (mousePressed && move)
    {
     click.trigger();
     card = 10;
     move = false;
    }
   }
  else if (mouseX > left2 && mouseX < right2 && mouseY > top && mouseY < bottom){
   quad (left2, top2, right2, top2, right2, bottom2, left2, bottom2);
     if (mousePressed && move)
     {
      click.trigger();
      card = 6;
      move = false;
     }
   }
  }




  //CARD6
  else if (card == 6)
  {
    fill (0, 80);
    image(card6, 0,0);
    float left = 325;
    float right = 421;
    float top = 231;
    float bottom = 254;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      quad (left, top, right, top, right, bottom, left, bottom);
      if (mousePressed && move)
      {
        click.trigger();
        card = 7;
        move = false;
      }
    }
  }

  //CARD7
  else if (card == 7)
  {
    fill (255, 80);
    image(card7, 0,0);

    float left = 268;
    float right = 344;
    float top = 275;
    float bottom = 295;

    float left2 = 398;
    float right2 = 493;
    float top2 = 276;
    float bottom2 = 295;

    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      quad (left, top, right, top, right, bottom, left, bottom);
      if (mousePressed && move)
      {
        click.trigger();
        card = 9;
        move = false;
      }
    }

    else if (mouseX > left2 && mouseX < right2 && mouseY > top2 && mouseY < bottom2) {
      quad (left2, top2, right2, top2, right2, bottom2, left2, bottom2);
      if (mousePressed && move)
      {
        click.trigger();
        card = 8;
        move = false;
      }
    }
  }
  

  //CARD8
  else if (card == 8)
  {
    fill (0, 80);
    image(card8, 0,0);
    float left = 377;
    float right = 452;
    float top = 231;
    float bottom = 254;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      quad (left, top, right, top, right, bottom, left, bottom);
      if (mousePressed && move)
      {
        click.trigger();
        card = 9;
        move = false;
      }
    }
  }

  //CARD9
  else if (card == 9)
  {
    fill (255, 80);
    image(card9, 0,0);

    float left = 279;
    float right = 357;
    float top = 276;
    float bottom = 295;

    float left2 = 412;
    float right2 = 483;
    float top2 = 276;
    float bottom2 = 295;

    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      quad (left, top, right, top, right, bottom, left, bottom);
      if (mousePressed && move)
      {
        click.trigger();
        card = 10;
        move = false;
      }
    }

    else if (mouseX > left2 && mouseX < right2 && mouseY > top2 && mouseY < bottom2) {
      quad (left2, top2, right2, top2, right2, bottom2, left2, bottom2);
      if (mousePressed && move)
      {
        click.trigger();
        card = 10;
        move = false;
      }
    }
  }

  //CARD10
  else if (card == 10)
  {
    fill (0, 80);
    image(card10, 0,0);
    float left = 293;
    float right = 473;
    float top = 231;
    float bottom = 254;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      quad (left, top, right, top, right, bottom, left, bottom);
      if (mousePressed && move)
      {
        click.trigger();
        card = 11;
        move = false;
      }
    }
  }

}

void stop()
{
minim.stop();
  
}



void mouseReleased()
{
  move = true;
}


