
/////////////////////////// Project_ DANCING CURVES \\\\\\\\\\\\\\\\
///////////////////////// YOUSUFOLIO/PROCESSING/2013\\\\\\\\\\\\\\\\
////////////////////////////////// ENJOY\\\\\\\\\\\\\\\\\\\\\\\\\\\\

//////////////click mouse n experience infinte possibilities\\\\\\\\


float x;
float y;
float speedX=2;
float speedY= 3;


void setup(){
size(600,600);
smooth();
background(0);
}

void draw(){

  display();
move();
bounce();
gravity();
  
}

void display(){
  
for(int i=0;i<200;i +=1){  
ellipse(i*x,i*y,x*3,y*5);
noFill();
strokeWeight(.1);
stroke(i/x+y,i/y+x,x+y);
}
}

void move(){
  x +=speedX;
  y +=speedY;
  
    }

void bounce(){
  if(x>width){
    speedX = speedX*-1;
  }
  
  if(x<0){
    speedX = speedX*-1;
  }
  
  if(y>height){
    speedY = speedY*-1;
  }
  
  if(y<0){
    speedY = speedY*-1;
  }
  
}

void gravity(){
  speedY +=.03;

}

void  mousePressed(){

background(255);
}


/////////////////////////// Project_ DANCING CURVES \\\\\\\\\\\\\\\\\\\\\\\\\
///////////////////////// YOUSUFOLIO/PROCESSING/2013\\\\\\\\\\\\\\\\
////////////////////////////////// ENJOY\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

//////////////click mouse n experience infinte possibilities\\\\\\\\

