
//set globa variables
PImage bg;
//left_stars
int starY1, starY2, starY3, starY4, starY5 = 0;
int vel1 = 2;
int vel2 = 5;
int vel3 = 3;
int vel4 = 1;
int vel5 = 6;

//right_stars
int starY6, starY7, starY8, starY9, starY10 = -10;
int vel6 = 2;
int vel7 = 5;
int vel8 = 3;
int vel9 = 1;
int vel10 = 6;


//setup bg&canvas;
void setup(){
  size(500,500);
  smooth();
  bg = loadImage("mount.jpg"); 
}

//draw stars & lazers
void draw(){
  background(bg); 
  fill(255);
  noStroke();

  //setting the "hit" line
  for(int i=0; i<width; i+=5){
    fill(0, 255, 255);
    ellipse(i, 400, 2, 2);
  }

  //stars&beams rebound action
  fill(255, 255, 255, 90);
  noStroke();
   if (starY1 >= 400){
    vel1 *=-1;
  } 
  if (starY2 >= 400){
    vel2 *=-1;
  }
  if (starY3 >= 400){
    vel3 *=-1;
  }
  if (starY4 >= 400 || starY4 < 0){
    vel4 *=-1;
  }
  if (starY5 >= 400){
    vel5 *=-1;
  }
  if (starY6 >= 400){
    vel6 *=-1;
  } 
  if (starY7 >= 400){
    vel7 *=-1;
  }
  if (starY8 >= 400){
    vel8 *=-1;
  }
  if (starY9 >= 400 || starY9 < 0){
    vel9 *=-1;
  }
  if (starY10 >= 400){
    vel10 *=-1;
  }
  
  //star_left
  starY1 += vel1;
  starY2 += vel2;
  starY3 += vel3;
  starY4 += vel4;
  starY5 += vel5;

  ellipse(250, starY1, 3, 3);
  vel1 *=1;
  ellipse(240, starY2, 3, 3);
  vel2 *=1;
  ellipse(230, starY3, 3, 3);
  vel3 *=1;
  ellipse(260, starY4, 3, 3);
  vel4 *=1;
  ellipse(270, starY5, 3, 3);
  vel5 *=1;

  //lazers
  stroke(255, 255, 255, 90);

  line(230, starY3, 0, 500);
  line(240, starY2, 0, 500);
  line(250, starY1, 0, 500);
  line(260, starY4, 0, 500);
  line(270, starY5, 0, 500);

  //star_right
  starY6 += vel6;
  starY7 += vel7;
  starY8 += vel8;
  starY9 += vel9;
  starY10 += vel10;

   ellipse(250, starY8,3, 3);
   vel6 *=1;
   ellipse(240, starY7, 3, 3);
   vel7 *=1;
   ellipse(230, starY6, 3, 3);
   vel8 *=1;
   ellipse(260, starY9, 3, 3);
   vel9 *=1;
   ellipse(270, starY10, 3, 3);
   vel10 *=1;
    
  //lazers
  stroke(255, 255, 255, 90);
  line(230, starY6, 500, 500);
  line(240, starY7, 500, 500);
  line(250, starY8, 500, 500);
  line(260, starY9, 500, 500);
  line(270, starY10, 500, 500);
}

