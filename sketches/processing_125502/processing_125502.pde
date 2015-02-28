
float counter = 24;

PImage bg;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;

PFont f;                       


void setup()
{
size(700,500);

bg = loadImage("bg.png");
img1 = loadImage("BILD2.png");
img2 = loadImage("BILD7.png");
img3 = loadImage("bild8.png");
img4 = loadImage("bild9.png");
img5 = loadImage("bild6.png");

f = createFont("Georgia",20,true); // STEP 3 Create Font

}  

void draw()
{
  image(bg,0,0);
if(mousePressed == true)
{
  translate(170, 100);
  image(img2, 0, 0);
  image(img5, 130, 25);
  textFont(f,12);
  fill(220);
  textAlign(CENTER, CENTER);
  text("STAR WARS - RETURN OF PROCESSING",180,250);
}

else {
  if (mouseX <= 350)
  {
    tint(255,200);
    //background(bg);
    if (second() < 30)
    {
    image(img1,50,200);
    }
      if (second() >= 30)
      {
      image(img2,50,200);
      } 
        if (second() < 30) 
        {
        image(img5,550,20);
        }
            if(second() <= 30)
            {
            pushMatrix();
            textFont(f,50);
            fill(200,0,0);
            text("!",180,200);
            popMatrix();
            }
              if(second() < 30)
              {
              }
              
  }
  
  else if (mouseX > 350) 
  {
    //background(bg);
    translate (width/2,0);
      if (second() < 30)
      {
      image(img4,30,205);
      }
        if (second() >= 30)
        {
        image(img3,30,205); 
         } 
          if (second() < 30) 
          {
          image(img5,200,20);
          }
            if(second() <= 30)
            {
            pushMatrix();
            textFont(f,50);
            fill(134,0,0);
            text("!",140,200);
            popMatrix();
            }
              if(second() < 30)
              {
              }
              
  }
}
}//SCHLIESST VOID DRAW



