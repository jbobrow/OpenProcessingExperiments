
import arb.soundcipher.*;
import arb.soundcipher.constants.*;



//Librarys 

import guicomponents.*;

SoundCipher note = new SoundCipher(this);

//guicomponents library, declaring buttons and sliders

GButton btnclear, btnreset, btnstroke, btnfill, btntrails, btnsound;
GVertSlider alphaslider, diameterslider, numslider;

//Declare arraylist

ArrayList balls;

//declare integers
int numsliderval;
int numcircles = 10; //number of circles created
//integer for the array index

int previousvalue;
int z;

boolean playsounds = false;
boolean showtrails = false;
boolean showstroke = true;
boolean showfill = false;


void setup() {

  balls = new ArrayList(); //Create and empty array list

    setupinputs();

  background(255);
  size(1000,600);

  for ( int i = 0; i < numcircles; i++ ) 
  {    
    Circle ball = new Circle(800/2,height/2,random(-2,2),random(-2,2));//Create ball objects
    balls.add(ball); //add ball to the array list
  }

  smooth();

}

void draw(){

  checkShowTrails();
  for (int i = balls.size()-1; i >=0 ;i--)
  {
    Circle ball = getBall(i);
    ball.moveCircle();
    ball.drawCircle();    
  }

  if (numberisdifferent()){
    addballs();
  }
  
  if (playsounds == true){
  makesomenoises();
  }

}



void handleButtonEvents(GButton button) {
  if (btnreset == button && button.eventType == GButton.CLICKED) {
    setup();
  }
  if (btnclear == button && button.eventType == GButton.CLICKED) {
    background(255);
  }
  if (btntrails == button && button.eventType == GButton.CLICKED) {
    showtrails = !showtrails;
  }
  if (btnfill == button && button.eventType == GButton.CLICKED) {
    showfill = !showfill;
  }
  if (btnstroke == button && button.eventType == GButton.CLICKED) {
    showstroke = !showstroke;
  }
  if (btnsound == button && button.eventType == GButton.CLICKED) {
    playsounds = !playsounds;
  }
}



Circle getBall(int _number) {
  return (Circle)balls.get(_number);
} 

void checkShowTrails(){

  if (showtrails == false){
    background(255);
  }
}

void setupinputs(){

  GComponent.globalColor = GCScheme.getColor(this,  GCScheme.BLUE_SCHEME);
  GComponent.globalFont = GFont.getFont(this, "Arial", 12);

  btnclear = new GButton(this,"Clear",825,25,70,10);
  btnreset = new GButton(this,"Reset",825,50,70,10);
  btnstroke = new GButton(this,"Stroke",825,490,70,10);
  btnfill = new GButton(this,"Fill",825,515,70,10);
  btntrails = new GButton(this,"Trails",825,540,70,10);
  btnsound = new GButton(this,"Sound",900,25,70,10);

  //Slider shit

  alphaslider = new GVertSlider(this,825,75,20,400);
  alphaslider.setLimits(150,0,300);

  diameterslider = new GVertSlider(this,850,75,20,400);
  diameterslider.setLimits(50,0,100);

  numslider = new GVertSlider(this,875,75,20,400);
  numslider.setLimits(10,0,200);
}




boolean numberisdifferent(){

  numsliderval = int(numslider.getValue());

  if (numsliderval != numcircles){

    return true;
  }

  else {

    return false;  

  }

}

void addballs(){


  for (int j = balls.size()  ; j < numslider.getValue() ; j++){

    Circle ball = new Circle(800/2,height/2,random(-2,2),random(-2,2));//Create ball objects
    balls.add(ball); //add ball to the array list

  }

  for (int j = balls.size() - 1 ; j >= numslider.getValue()  ; j--){

    balls.remove(j);
  }


  numcircles = numsliderval;


}

void makesomenoises(){

  for (int j = balls.size() - 1 ; j >= 0 ; j-- ){

    Circle ball = getBall(j);

    for (int i = balls.size() -1 ; i >= 0; i-- ){

      Circle ball2 = getBall(i);

      if ( i != j ){

        if ( dist(ball.x,ball.y,ball2.x,ball2.y) < ball.diameter/2 + ball2.diameter/2 && ball.isplaying==false) {

          ball.playNote();
         

        }


      }
    }
  }
}











