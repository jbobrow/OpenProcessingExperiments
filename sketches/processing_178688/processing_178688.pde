
//DECLARE
int n = 100;//Amount of Planets
int m = 500;//Amount of Stars

Planets[] myPlanet= new Planets [n];//
Stars[] myStar= new Stars[m];

int frame=20;

//SETUP
void setup (){
  size(600,600);//Size of Display
  background(0);//Black Background
  strokeWeight(2);//Thickness of Border
  
  
  //INITIALIZE/CALL
  //A FOR loop is used to go through every planet
  for(int i=0;i<myPlanet.length;i++){
    //Initialises the distance,size(radius),angle & speed of each planet
  myPlanet[i] = new Planets(i*2.5, random(0.5, 5), random(0, 360), random(0.005, 0.01));
  }
  
  //A FOR loop is used to go every star
  for(int j=0;j<myStar.length;j++){
    //Initialises the stars
    myStar[j]= new Stars();
  }
}


//DRAW
void draw(){
 
 fill(10,5,40,50);//Fills Square Dark Blue 
 stroke(255);//White Border
 rect(frame,frame,width-frame*2,height-frame*2,10,10,10,10);//Creates frame with rounded edges
 textSize(15);
  fill(255);
  text("Click to change direction of planets",180,595);
 //CALL FUNCTIONALITY
 
 for(int j=0;j<myStar.length;j++){
   //Displays The Stars
    myStar[j].display();
  }
 for (int i = 0; i < myPlanet.length; i ++ ) {
   //Displays The Planets And Its Orbit
  myPlanet[i].display();
  myPlanet[i].orbit();
  myPlanet[i].mouse();

 }
 
 
  
  
}
  
class Planets {
//VARIABLES
  color c;//color of stars
  float d; //distance of planet from sun
  float r; //planet size (radius)
  float a; //angle planet position makes with horizontal x axis
  float s; //change in angle (speed)

 
//CONSTRUCTOR
  Planets(float tempD, float tempR, float tempA, float tempS) {
    
    c = color(55+random(200),155+random(100),155+random(100));
    d=tempD;
    r=tempR;
    a=tempA;
    s=tempS;
    

  }
  
//FUNCTIONS  
void display(){

  fill(c);
  stroke(c);
  ellipse(width/2+d*cos(a), height/2+d*sin(a),r,r);
  
} 

void orbit() {
    a+=s;//Allows the planets to move when in draw function
  
}
  
 void mouse(){
   if (mousePressed==true){
     s*=-1;
   }
    
 }

}

class Stars{
//VARIABLES
  float x;//x position of stars
  float y;//y position of stars

//CONSTRUCTOR
 Stars(){
  x=random(20,width-20);//generates a random x position on screen (within the white parameters of the screen) 
  y=random(20,height-20);//generates a random y position on screen (within the white parameters of the screen)
}

//FUNCTIONS
 void display(){
  stroke(random(255));//generates a random colour between white and black
   point(x,y);//uses the random position generates to create a point/star
}


}


