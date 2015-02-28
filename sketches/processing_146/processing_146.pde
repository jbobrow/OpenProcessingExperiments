
//initialize variables
Predator pred;
 int count = 5; 
Prey[] prey = new Prey[count];  // declaration 
int i;
int countkill=0;
///////////////////////////////////////////////////
void setup(){
 for (i=0;i<count;i++){
    prey[i] = new Prey((i+100) *2,i*40,20,20); // actual creation of prey
}

  size(900,700);
  frameRate(20);
 
  pred = new Predator(50,50,40,40);
}
//////////////////////////////////////////////////
void draw(){
   background(255,255,255);
    // count = countkill;
   countkill = pred.kill( prey [0]); ////// returns wether a kill has been made from kill function
   println(pred.kill( prey [0]));
  if (countkill == 1){
    for (int i =0; i< prey.length-1;i++){ /////////////shifts array address down one
    prey[i] = prey[i+1];}
    prey[prey.length-1] = null;}  /////////// puts null(nothing) in the last spot
     
                                                   
    for (i=0;i<prey.length;i++){ ////////////////runs the below programs
      if(prey[i] == null){ 
      i++;}
      else{
    prey[i].Markings();///////draws
    prey[i].Boundary();///////checks boiunfdry
    prey[i].Move();}/////////////changes x y pos
  }    
  pred.Markings();
  pred.Boundary();
  pred.Move();
  prey[0].markColor = 250;
  pred.stalk(prey[0]);
}




                                                      //int preyChoice(){
                                                     // if (millis() % 5000 > 0 && millis() % 5000 < 100){
                                                     //  int b =  floor (random(3));
                                                    //println(b);
  
                                                  // return b;


//////////////////////////////draw predator///////////////////////////////////////
class Predator
{
  int predXPos = 50;
  int predYPos = 50;
  int predXSpeed = 10;
  int predYSpeed = 5;
  float predPreyXDistance;
  float predPreyYDistance;
  float predPreyXDistance2; //second  check of pred/prey dist constant
  float predPreyYDistance2;
  float previousXDistance = width;
  float previousYDistance = height;
  int xwidth;
  int yheight;
  int killcount = 0;
  int kill;
       ////////////////////start variables/////////
  int boundry = 40; ///////////////the boundry padding
  int place = 45;  ///////////how far in to place off walls
  int killzone = 10; ////// how close when killed////////////
  Predator (int _x, int _y, int _xwidth, int _yheight){ // variable input to predator
    predXPos = _x;                                      // declaraction of variables in pred class
    predYPos = _y;
    xwidth = _xwidth;
    yheight = _yheight;
  }
  void  Markings (){
    fill(250,0,0);
    rectMode(CENTER);
    rect (predXPos,predYPos,xwidth,yheight);
  }
  void Move(){
    predXPos = predXPos + predXSpeed;
    predYPos = predYPos + predYSpeed;
  }

  void Boundary(){                 /////////////////////// move within walls
    if ( (predXPos >= width-boundry) || (predXPos <= boundry)){
      predXSpeed = -predXSpeed;
    }
    if (predXPos >= width - (boundry - 5) ){
      predXPos = width - place;
    }
    if  (predXPos <= 0 + (boundry - 5)){
      predXPos = 0+place;
    }

    if ( (predYPos >= height - boundry) || (predYPos <= boundry)){
      predYSpeed = -predYSpeed;
    }

    if  (predYPos >= height - (boundry -5)){
      predYPos = height - place;
    }
    if  (predYPos <= 0 + (boundry - 5)){
     predYPos = 0+place;
    }

  }


  void stalk( Prey prey){                                 //finding prey


      //check how far predator is from prey

      //ask if that distance is farther or closer than the previous distance

    if (millis() % 1000 > 0 && millis() % 1000 < 100){         // timing function divdes and finds remainder

      predPreyXDistance = dist(predXPos ,0,prey.position_x(),0);     //prey is class, .position_x is function in class that gives the position.          
      predPreyYDistance = dist(0,predYPos ,0,prey.position_y());
    }
    if (predPreyXDistance > previousXDistance) {
      predXSpeed = -predXSpeed;
    }
    if (predPreyYDistance > previousYDistance) {
      predYSpeed = -predYSpeed;
    }

    previousXDistance = predPreyXDistance;
    previousYDistance = predPreyYDistance;
//println(predPreyYDistance);
//println(predPreyXDistance);
  }
  //if the predator is farther from the prey than it was, it should move toward the prey


  //if the predator is closer to the prey, then it should keep going in the same direction
int kill( Prey prey ){ //prey is class, .position_x is function in class that gives the position.

 predPreyXDistance2 = dist(predXPos ,0,prey.position_x(),0); //constantly checks pred prey distance
 predPreyYDistance2 = dist(0,predYPos ,0,prey.position_y()); 
 println (predPreyXDistance2);
  println (predPreyYDistance2);
  killcount= 0;    //sends a no kill flag
if ( predPreyYDistance2 <= killzone && predPreyXDistance2 <= killzone ){  //if pred kills send flag
              
   killcount =+ killcount+1;}
   else {killcount= 0;}          //sends a no kill flag
   // println (killcount);
  return killcount;
}

}
//end class//////////////////////////////////////////////////////////
//draw prey
class Prey
{

  int preyXPos = 0;
  int preyYPos = 0;
  int preyXSpeed = 1;
  int preyYSpeed = 1;
  int pwidth;
  int pheight;
  int boundry = 20;
  int place = 35;
  int topspeed = 10;
  int markColor =0;
  Prey (int _x, int _y, int _pwidth, int _pheight){
    preyXPos = _x;
    preyYPos = _y;
    pwidth = _pwidth;
    pheight = _pheight;
  }
  void Markings(){
    fill(200,markColor,0);
    ellipseMode(CENTER);
    ellipse (preyXPos, preyYPos, pwidth, pheight);
  }

  //move prey
  //a constant speed
  //boundary definition and bouncing

  void Move(){
    if (floor(random(10)) == 3){
      preyXSpeed += floor(random(2));
      preyYSpeed += floor(random(2)); 
      preyXPos = preyXPos + preyXSpeed;
      preyYPos = preyYPos + preyYSpeed;
    }
    if (floor(random(10)) < 2 ){
      preyXSpeed -= floor(random(2));
      preyYSpeed -= floor(random(2)); 
      preyXPos = preyXPos + preyXSpeed;
      preyYPos = preyYPos + preyYSpeed;
    }
    if (preyXSpeed > topspeed) {preyXSpeed = 1;
     }
    if (preyYSpeed > topspeed) {preyYSpeed = 1;
     }
    else{
      preyXPos = preyXPos + preyXSpeed;
      preyYPos = preyYPos + preyYSpeed;
    }
  }      


  int position_x() {   // this function returns preys position
    return preyXPos; 
  }

  int position_y() {  // this function returns preys position
    return preyYPos; 
  }

  void Boundary(){
    if ( (preyXPos >= width - boundry) || (preyXPos <= boundry)){
      preyXSpeed = -preyXSpeed;
    }
    if ( (preyXPos >= width - boundry)){
      preyXPos = (width - place);
    }
    if ( (preyXPos <= 0 + boundry)){
      preyXPos = (0 + place);
    }
    if ( (preyYPos >= height - boundry) || (preyYPos <= boundry)){
      preyYSpeed = -preyYSpeed;
    } 
    if ( (preyYPos >= height - boundry)){
      preyYPos = (height - place);
    }
    if ( (preyYPos <= 0 + boundry)){
      preyYPos = (0 + place);
    }
  }

}

