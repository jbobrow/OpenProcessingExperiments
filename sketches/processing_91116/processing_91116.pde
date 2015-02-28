
//Property of Derek Gryga.
//Generated 20 February 2013.
//"MicrobeBall: A Sport for Simple Aquatic Lifeforms & Protists!"
//Credit to Ben Norskov for Easing code. 
//_________________________________________________________________
int ballX = 200;
int ballXvelocity = 3;
//__________________________
float fishcoord = 0;
float fishez = 0.05;
//__________________________
void setup(){
  size(1000,1000);
  println("MicrobeBall: A Sport for Simple Aquatic Lifeforms & Protists!");
}
void draw(){
  background(255,249,214);      //Beautiful background.
  fill(3,0,0);                  //Fish tank structure color.
  rect(130,400,750,350);        //Fish tank black structure.
  fill(95,200,255);             //Fish tank water & glass color.
  rect(135,402,740,340);        //Fish tank water and glass.
  fill(255,13,29);              //shiny red ball.
  strokeWeight(2);              //shiny red ball.
  ellipse(ballX,height/2,50,50);//shiny red ball.
  fill(255);
  ballX = ballX + ballXvelocity;
  float distance = ballX - fishcoord;
  float percentageOFdistance = distance * fishez;
  fishcoord = fishcoord + percentageOFdistance;
  line (ballX,460,fishcoord,450);  // line (ballX - 10,480,fishcoord - 40,470);
  line (ballX, 400,fishcoord - 10,470);
  strokeWeight(1.5);
  line (ballX + 10,550,fishcoord - 10,580);
  
  if (ballX > 850)  {
    ballXvelocity = -2;
  }
  if (ballX < 158)  {
    ballXvelocity = 2;
  }
}
