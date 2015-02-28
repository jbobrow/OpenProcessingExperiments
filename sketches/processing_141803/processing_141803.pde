
Sprite[] sprites; //object name[] name of array

void setup(){
  frameRate(60);
  size(500,800);
  background(17,188,178);
  ellipseMode(CENTER);
  strokeWeight(2);
  
 
  //background lines
  for (int i=0; i<width; i+=20) {
  line(i,0,i,800);
  stroke(255,45);
  strokeWeight(2);
  }
  
  sprites= new Sprite[0];
}

void draw(){
  background(17,188,178);
   //background lines
  for (int i=0; i<width; i+=20) {
  line(i,0,i,800);
  stroke(255,45);
  strokeWeight(2);
  }
  
for(int i=0; i<sprites.length; i++){
  sprites[i].display();
  sprites[i].fall();
}
}


void mouseClicked(){
  //initialize Sprite object
  Sprite mySprite= new Sprite(mouseX,mouseY);
  sprites=(Sprite[])append(sprites, mySprite);
}

class Sprite { 

  //variables
  int cx;
  int cy;
  int diameter;
  int radius;
  int x;
  int y;
  int angle;
  boolean armDown=true;
  
  //constructor--> define above variables
  Sprite(int centerX,int centerY) { //defines center point x to use the mouseX location and y that is stated above in mouse clicked
     cx= centerX;
     cy= centerY;
     diameter= 160;
     radius= 70;
     angle= -45;
    // here is where you will add an integer about a random sprite and then use if else statements in display
  }
  
  void display() {
  //body
  fill(176,255,155);
  noStroke();
  ellipse(cx,cy,diameter,diameter);
  
  //eyes
  for(int i=0; i<2; i++){ //I want 2 eyes
    fill(255); //fill it with white
    ellipse(cx-40+i*80,cy-20,65,65); //draw an ellipse 40 pixels subtracted from x and 20 subtracted from y at 60 by 60. Then tell it to add 80 pixels inbetween both eyes (i*80 is the space inbetween each eyes center point)
  }
  
  //pupil
  for(int i=0; i<2; i++){
    fill(0);
    ellipse(cx-40+i*80,cy-20,20,20);
  }

  //evebrows
  for(int i=0; i<2; i++){
    stroke(74,106,65);
    strokeWeight(15);
    line(cx-65+i*80,cy-60,cx-15+i*80,cy-60);
  }
  
   //arms
   /*if(frameCount % 1*60 ==0){
     
   }*/
    
    x= cos(radians(angle))*radius;
    y= sin(radians(angle))*radius;
    
     
    stroke(74,106,65);
    strokeWeight(7);
    line(cx-10-radius,cy,cx-radius-x,cy+y); //draws the line that will move
    line(cx+10+radius,cy,cx+radius+x,cy+y); 
  
   if(armDown){
     angle=angle-8;
   }
   else{
     angle=angle+10;
   }
   
   if(angle>= 50){
     armDown=true;
   }
   else if (angle<= -30){
     armDown=false;
   }
   
  //legs
    stroke(74,106,65);
    strokeWeight(7);
    line(cx-40,cy+70,cx-60,cy+100);
    line(cx+40,cy+70,cx+60,cy+100);

  }
  
  void fall(){
    if (cy < height+120) {
      cy= cy+2.5;
    }
    else{cy=-120;}
 
  }
} //end of class



