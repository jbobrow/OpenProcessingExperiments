
//_________spinning circles//

int distance_from_point = 50;
int num_of_circles = 5;
int circle_size= 20;


//360 divided by 5 we got the 70
int my_int = 434;
float degree_step = TWO_PI/num_of_circles;//working with radius must be a float/
float angle = 0;
float starting_degree_step = 3;

//____________________________underneath bouncing balls


float circleY;
float vel = 10; //vel=speed//declare variables outside of (SETIUP)
float xpos; 
 
 void setup() {
  size(400,600);
   smooth();
   frameRate(15);
   println("first joined composition.");
   println("lets see if this works");
   colorMode(HSB,33,44,150);
   
      
}


void draw() {
  background(39,44,44);
  noStroke();
  fill(242,15,193);
  rect(8,random(400,591),29,500);
  rect(45,random(400,591),29,500);
  rect(80,random(400,591),29,500);
  rect(116,random(400,591),29,500);
  rect(152,random(400,591),29,500);
  rect(188,random(400,591),29,500);
  rect(224,random(400,591),29,500);
  rect(259,random(400,591),29,500);
  rect(294,random(400,591),29,500);
  rect(329,random(400,591),29,500);
  rect(365,random(400,591),29,500);
  
  
  

//blue recs set 1//
  
  fill(0,249,255);
  rect(8,random(200,500),29,10);
  
  fill(0,249,255);
  rect(45,random(150,500),29,10);
  
  fill(0,249,255);
  rect(80,random(200,500),29,10);
  
  fill(0,249,255);
  rect(116,random(200,500),29,10);
  
  fill(0,249,255);
  rect(152,random(200,500),29,10);
  
  fill(0,249,255);
  rect(188,random(200,500),29,10);
  
  fill(0,249,255);
  rect(224,random(200,500),29,10);
  
  fill(0,249,255);
  rect(259,random(200,500),29,10);
  
  fill(0,249,255);
  rect(294,random(200,500),29,10);
  
  fill(0,249,255);
  rect(329,random(200,500),29,10);
  
  fill(0,249,255);
  rect(365,random(200,500),29,10);//rec 1// X,Y,W,H //8 is X position=left to right//
  
  //blue recs set 2//
  
    fill(0,249,255);
  rect(8,random(130,500),29,10);
  
  fill(0,249,255);
  rect(45,random(110,500),29,10);
  
  fill(0,249,255);
  rect(80,random(98,500),29,10);
  
  fill(0,249,255);
  rect(116,random(75,500),29,10);
  
  fill(0,249,255);
  rect(152,random(65,500),29,10);
  
  fill(0,249,255);
  rect(188,random(35,500),29,10);
  
  fill(0,249,255);
  rect(224,random(160,500),29,10);
  
  fill(0,249,255);
  rect(259,random(230,500),29,10);
  
  fill(0,249,255);
  rect(294,random(210,500),29,10);
  
  fill(0,249,255);
  rect(329,random(100,500),29,10);
  
  fill(0,249,255);
  rect(365,random(160,500),29,10);
  
    //blue recs set 3//
  
    fill(0,249,255);
  rect(8,random(160,500),29,10);
  
  fill(0,249,255);
  rect(45,random(100,500),29,10);
  
  fill(0,249,255);
  rect(80,random(88,500),29,10);
  
  fill(0,249,255);
  rect(116,random(60,500),29,10);
  
  fill(0,249,255);
  rect(152,random(75,500),29,10);
  
  fill(0,249,255);
  rect(188,random(50,120),29,10);
  
  fill(0,249,255);
  rect(224,random(300,500),29,10);
  
  fill(0,249,255);
  rect(259,random(50,500),29,10);
  
  fill(0,249,255);
  rect(294,random(90,500),29,10);
  
  fill(0,249,255);
  rect(329,random(80,500),29,10);
  
  fill(0,249,255);
  rect(365,random(88,500),29,10);
  
  
  //________spinning circles//
  fill(50);
   angle = radians(starting_degree_step);
   angle += degree_step;
   
   fill(255,44,30);
   ellipse(width/2 + cos(angle) * distance_from_point, height/2 + sin(angle) * distance_from_point, circle_size, circle_size);
   angle += degree_step;
   
   fill(400,70,30);
   ellipse(width/2 + cos(angle) * distance_from_point, height/2 + sin(angle) * distance_from_point, circle_size, circle_size);
   angle += degree_step;
   
   fill(255,70,30);
   ellipse(width/2 + cos(angle) * distance_from_point, height/2 + sin(angle) * distance_from_point, circle_size, circle_size);
   angle += degree_step;
   ellipse(width/2 + cos(angle) * distance_from_point, height/2 + sin(angle) * distance_from_point, circle_size, circle_size);
   angle += degree_step;
   ellipse(width/2 + cos(angle) * distance_from_point, height/2 + sin(angle) * distance_from_point, circle_size, circle_size);
   angle += degree_step;
   ellipse(width/2 + cos(angle) * distance_from_point, height/2 + sin(angle) * distance_from_point, circle_size, circle_size);
   angle += degree_step;
   ellipse(width/2 + cos(angle) * distance_from_point, height/2 + sin(angle) * distance_from_point, circle_size, circle_size);
   angle += degree_step;
   ellipse(width/2 + cos(angle) * distance_from_point, height/2 + sin(angle) * distance_from_point, circle_size, circle_size);
   angle += degree_step;
   ellipse(width/2 + cos(angle) * distance_from_point, height/2 + sin(angle) * distance_from_point, circle_size, circle_size);
   angle += degree_step;
   ellipse(width/2 + cos(angle) * distance_from_point, height/2 + sin(angle) * distance_from_point, circle_size, circle_size);
   
   starting_degree_step+=9;//width will always be associated with the width you find in size

 
  
  

//bouncing ball--------------------------------------// click for bouncing balls//
   circleY=circleY+vel; //the same as circleY+=vel//vel=speed just a variable
  // ellipse(250,circleY,20,20); //Y=top of screen
 
   xpos = mouseX;
   PImage myImage = loadImage("bouncing4.png");//(my Image) needs to be there in order to reference the (LOADImage) 
//   image(myImage,xpos,circleY);
   image(myImage,0,circleY);
//250 is the center of the screen// Circle Y calls out the bounce above//
   
   
   if((circleY<0)||(circleY>height)){ //circle Y is the Y coordinate// //||// is or
     vel=vel*=-1;
   }//this is cosing if statement// //same as  vel*=-1;

}

void mouseClicked() { //this has to be out of everything because its own function//
//  xpos = mouseX;
}


