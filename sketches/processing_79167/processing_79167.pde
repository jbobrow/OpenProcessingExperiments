
//global variables 
int x =0; //position of x
int speed=5;//speed of x
int y=20;
int yspeed=5;

int test=0;// global variable this function changes the size of the mans fist and leg

//set the size of the window 
void setup(){
size (250,250);
background(0);
smooth();

}

void draw(){
  background( random(0,255), 100, random(100,255) );// iv randomised the red and green in this function
  
if (mousePressed){//when mouse is pressed man will stop and punch and kick
   x = mouseX;
   test = 75;
  } else { 
    test = 0;
    
  }
 
  
   for (int x = 0; x < width; x+=25) {//the distance between each rect on the grid 
  for (int y = 0; y < height; y+=30) {
    noStroke();
    fill(0);
    rect(x,y,20,20);// the size of each rect on the grid
  }
}
  
  //this function is for making the man move across the width of the screen only to return
 
  x=x+speed;//
  if((x>width)||(x< 0)){
    speed=speed*-1;
 
  }
  
  
  y=y+yspeed;
  if (( y > height) || (y<0) ){
    yspeed=yspeed*-1;
  }
  
 stroke(0);
 fill(255,0,0);
 ellipse(50,y,50,50);
  
//draw mans body
stroke( random(0,255),120, random(75,255));
fill(255);
rect(x,mouseY,50,100);
smooth();

//draw mans head
stroke(0);
fill(255);
ellipse(x,mouseY-50,80,80);
smooth();

//draw mans arms
rectMode(CENTER);
stroke(255);
fill(0);
rect(x-38,mouseY,25+test,25+test); // left arm int variable used in this to add size 
rect(x+38,mouseY,25,25); // right arm

smooth();

//draw mans eyes
fill(test);
ellipse(x-10,mouseY-75,15,15);
ellipse(x+10,mouseY-75,15,15);
smooth();

//draw mans nose
fill(255,0,0);
ellipse(x,mouseY-55,20,20);
smooth();

//draw mans legs
fill(255);
rect(x-15,mouseY+84,20,75);
rect(x+14,mouseY+84,20,75);
smooth();

//draw mans feet
stroke(255);
fill(0);
ellipse(x+20,mouseY+120,30,30);
ellipse(x-23,mouseY+120,35,30+test);//int variable 
smooth();

}


