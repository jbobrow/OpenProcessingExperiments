
//Kitty Kwan, 4-5, Magic Eight Ball

PImage img;
int x=30;
int x1=200;

String words="";


void setup ()
{
  size (300, 300);
  img=loadImage ("background.jpg");
  text ("",50,50);
}

void draw ()
{
  image (img, 0, 0);
  fill (0);
  ellipse (150, 150, 200, 200);
  fill (255);

  ellipse (150, 150, 100, 100);
  fill (84, 47, 95);

  fill (0);
  textAlign (CENTER);
  if (click)
  {
    fill (147, 99, 99);
    triangle (110, 120, 190, 120, 150, 195);
    fill (0);

    text (words, 150, 145);
  }
  if (click==false)
  {

    noFill ();
    strokeWeight (5);
    ellipse (150, 130, 30, 30);
    ellipse (150, 165, 40, 40);
  }
}

String [] answers= {
  "yes", "no", "maybe", "definitely", "you're a\nwinner!", "tell me\nmore"
};
boolean click=false;

void mousePressed ()
{
  if (mouseX>100 && mouseX<200 &&mouseY; >100 &&mouseY;<200)
  {
    click=true;
    words= answers[int(random(6))];
  }
}

