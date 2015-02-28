
void setup()
{
 
  size(600, 600);               //We Decided to keep only the core functions in setup
  InitialiseBackground();       //So that it's easy to divide work and it's also easy to credit individual people
  RandomSun();
  PetalCreation();
  secondmiddle();
  FlowerCentre();
  groupname ();


}



void InitialiseBackground()              //InitializeBackground was coded by Peter S
{
     background(255);
  int x1=1, y1=580, x2=1, y2=599, x3=598, y3=599, x4=598, y4=580;   //starting coordinates for a first curve placed in the bottom
  for (int i=0; i<60; i++) {                                        //background was done by a simple 'for' loop with 60 curves
    stroke(random(250), random(250), random(250), 110);             /*random colour of curve which changes in each cycle of a 'for' loop
                                                                      the reason for using random(250) instead of (256) is to prevent a curve being
                                                                      in a clear white colour which would be the same as a background colour*/
    strokeWeight(7);
    curve(x1, y1, x2, y2, x3, y3, x4, y4);
    y2=y2-10;                                                       //vertical coordinate of a curve's first point is decreasing by 10 in each cycle
    y3=y3-10;                                                       //vertical coordinate of a curve's second point is decreasing by 10 in each cycle as well
   
  }
  strokeWeight(1);
}

  void FlowerCentre()                            //FlowerCenter was coded by Lewis D and Brodie R
{
  fill(196, 172, 12);
  ellipse(width/2, height/2, width/6, height/6);
  fill(242, 160, 27);
  ellipse(width/2, height/2, width/7, height/7);
}    
void secondmiddle ()                     //secondmiddle was coded by Artur P
{
  ellipse(300, 300, 200, 200);           //Since our objective was a flower we decided 2 centers would be interesting
  int secondwidth = 200;                 //Starting from the same starting point as Lewis my objective was to create a more dense feeling outer rim to the flower center  
  for (int i=1; i<20; i++){              //Here I have attemped to create a randomly filled ellipse with other tiny ellipses to simulate a flower's center which I couldn't manage
                                         //Instead I just embrased the random nature of the flower and coded the simpler solution of a randomly individually colored ellipses within ellipses
     fill(250,150,random(150));          //The loop is done enough times to get to the actual center of the flower with each smaller ellipse having 5 pixels smaller radius than the previous 
     ellipse(300,300, secondwidth, secondwidth);
     secondwidth = secondwidth - 10;
  }
}

void RandomSun () { //RandomSun was coded by Lewis D and Brodie R. This creates a sun placed in one of three set positions on the background based on the outcome of a random number.
float RandomCalculator = random(100); //Creates a random number
fill(237, 247, 32); //Yellow fill
if (RandomCalculator < 50) //If statement determining position
{
  ellipse(500, 100, 55, 55);
}
else
{
  ellipse(100, 100, 55, 55);
}
}

void PetalCreation()                     //PetalCreation was coded by Ryan R  ; Indeed Artur-RR
{                                        
 /* float randomX=random(60), randomY=random(60);
  frameRate (100); */                    // This was originally for placing objects randomly around when it was in the looping draw function. Don't know why we left it in-RR
  stroke (random(225), random(225), random(225));   //Did this to give random colours each time to the boarders of the Petals-RR
  fillingbezier();                                  //Originally had the fill function in each time for each petal but that was made minutely more aesthetically pleasing up by using fillingbezier-RR
  bezier(300, 300,  600, 150,  600, 450, 300,300);  // Very basic and regular shape used for the petals which was written out eight times to make the eight petals at regular angles.-RR 
  fillingbezier();
  bezier(300, 300,  450, 600,  150, 600, 300,300);
  fillingbezier();
  bezier(300, 300,  0, 150,  0, 450, 300,300);
  fillingbezier();
  bezier(300, 300,  150, 0,  450, 0, 300,300);
  fillingbezier();
  bezier(300, 300,  450, 0,  600, 150, 300,300);
  fillingbezier();
  bezier(300, 300,  450, 600,  600, 450, 300,300);
  fillingbezier();
  bezier(300, 300,  0, 450,  150, 600, 300,300);
  fillingbezier();
  bezier(300, 300,  150, 0,  0, 150, 300,300);

}

void fillingbezier () {                      //Fillingbezier was an attempt at making the program cleaner which I am convinced it didn't actually help much other than it being easier to modify - Artur  
                                             //Made it easier for changing colours in the petal (not that we intend to)-RR
  fill (random(225), random(225), random(225)); //Made the petals different colours (like normal flowers) each time the program is run. -RR 
}

void groupname () {                          //groupname was coded by Artur
  text("Group 23~", 100, 100);               
}
void draw()    //Draw is empty because of the restrictions placed.
{

}
