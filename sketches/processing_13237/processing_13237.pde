
//choose location with curser and 
//enter your initial to be projected on the building


Star[] stars = new Star[0];

initial[] initials = new initial[0];

PFont fontA;

int counter = 0;




void setup() {
  size(1066,936);
 background(0);
  smooth();
  frameRate(30);
 
 
   fontA = loadFont("CourierNew36.vlw");
  textAlign(CENTER);
  // Set the font and its size (in units of pixels)
  textFont(fontA, 32);
 
}
void draw () {
 
}
 
void keyPressed() {
  
 
  
  Star b = new Star(mouseX,mouseY,10);

  char initial;
  initial = char(key);
   text(initial, mouseX,mouseY);
 
  stars = (Star[]) append(stars,b);
  //println("stars:" + stars.length + "x:" + b.x + "y:" + b.y);
 
//has to go through this list of if statements in order. If the letter pressed isnt the letter wanted, the counter is incremented, if it is the desired letter, the counter is reset
 if ((initial == 's')|| (initial == 'S')){
   //reset the counter
             //counter=0;
             println (counter);
             
             
             if ((initial == 'y')|| (initial == 'Y')){
  
      line(stars[(stars.length - counter)].x,stars[(stars.length - counter)].y,
        b.x,b.y);
   //reset the counter
    counter=0;
          
          
             
         if ((initial == 'd')|| (initial == 'D')){
  
      line(stars[(stars.length - counter)].x,stars[(stars.length - counter)].y,
        b.x,b.y);
        //reset the counter
            counter=0;
             
                            
         if ((initial == 'n')|| (initial == 'N')){
      
      line(stars[(stars.length - counter)].x,stars[(stars.length - counter)].y,
        b.x,b.y);
        //reset the counter
     counter=0;
          
             
             
      if ((initial == 'e')|| (initial == 'E')){
  
      line(stars[(stars.length - counter)].x,stars[(stars.length - counter)].y,
        b.x,b.y);
        //reset the counter
     counter=0;
             
      
      if ((initial == 'y')|| (initial == 'Y')){
  
      line(stars[(stars.length - counter)].x,stars[(stars.length - counter)].y,
        b.x,b.y);
        //reset the counter
     counter=2;
     
             
              }else{
      //increment counter
      counter++;
      println (counter);
 // loop();
 }
             
    
  
}}}}}}
 
class initial {

    char initial;

  }

class Star {
  float x;
  float y;
  float speed;
  float w;
 
  Star(float tempX, float tempY, float tempW){
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
  }
 
 
 
  void display() {
     
    fill(255);
    noStroke();
    char initial;
    initial = char(key);
    text(initial,x,y);
   

    
   
     

  
  }

}


