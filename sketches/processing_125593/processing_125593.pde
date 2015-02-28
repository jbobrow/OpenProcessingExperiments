
//hw10
//Stephanie Park
//Data Representation

//String [] year = { "1960", "2000", "2010" }
//float [] popul = {6624, 4030, 3744};
float [] popul = { 600, 365 , 339 }; //population above represented in perecentage x 6
float [] place = { 0, 250,400};
PImage mvmap, person;

void setup ()
{
  size ( 600, 600 );
  mvmap = loadImage ("millvale1960.jpg");
  person = loadImage ("person.png");
}

void draw ()
{
  background (255);
  population ();
  title ();
  mouseFunction ();

}

void population ()
{
  for (int i = 0; i < popul.length; i++)
  {
    image(mvmap , place[i], 0 , width/4, popul[i] );
  }
   
}

void title ()
{
  textMode (CORNER);
  textSize(30);
  fill(0);
  text("MILLVALE POPULATION", 210, 450); 
  fill ( 240, 2, 2);
  textSize(60);
  text( "DECLINE", 300,500);

}

void mouseFunction()
{
  if (mouseX < 200)
  {
    textMode (CENTER);
    textSize (30);
    fill ( 240, 2, 2);
    text ("1960", 100, 100);
    textSize(20);
    fill (0);
    text ("  6624", 100, 150);
    
    image( person , 550 , 510 , 30, 50);
    translate ( -30, 0 );
    image( person , 550 , 510 , 30, 50);
    translate ( -30, 0 );
    image( person , 550 , 510 , 30, 50);
    translate ( -30, 0 );
    image( person , 550 , 510 , 30, 50);
    translate ( -30, 0 );
    image( person , 550 , 510 , 30, 50);
    translate ( -30, 0 );
    image( person , 550 , 510 , 30, 50);
    translate ( -30, 0 );
    image( person , 550 , 510 , 30, 50);
    translate ( -30, 0 );
    image( person , 550 , 510 , 30, 50);
    translate ( -30, 0 );
    image( person , 550 , 510 , 30, 50);
    translate ( -30, 0 );
    image( person , 550 , 510 , 30, 50);

    
  }
  else if (mouseX > 200 && mouseX < 400 )
  {
    textMode (CENTER);
    textSize (30);
    fill ( 240, 2, 2);
    text ("2000", 300, 100);
    textSize(20);
    fill (0);
    text ("  4030", 300, 150);

    image( person , 550 , 510 , 30, 50);
    translate ( -30, 0 );
    image( person , 550 , 510 , 30, 50);
    translate ( -30, 0 );
    image( person , 550 , 510 , 30, 50);
    translate ( -30, 0 );
    image( person , 550 , 510 , 30, 50);
    translate ( -30, 0 );
    image( person , 550 , 510 , 30, 50);
    translate ( -30, 0 );
    image( person , 550 , 510 , 30, 50);

  }
  else if ( mouseX> 400)
  {
   textMode (CENTER);
   textSize (30);
   fill ( 240, 2, 2);
   text ("2010", 450, 100);
   textSize(20);
   fill (0);
   text ("  3744", 450, 150);
   
   image( person , 550 , 510 , 30, 50);
   translate ( -30, 0 );
   image( person , 550 , 510 , 30, 50);
   translate ( -30, 0 );
   image( person , 550 , 510 , 30, 50);
   translate ( -30, 0 );
   image( person , 550 , 510 , 30, 50);
   translate ( -30, 0 );
   image( person , 550 , 510 , 30, 50);

    
  }
}






