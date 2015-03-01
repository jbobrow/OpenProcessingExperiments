
int height = 200;
int width = 200;
int circleSize = 100; 
 
 
size(width, height);
background(200);  //set background white



ellipseMode(CENTER);
//Circle 1
fill(255,255,0);
//ellipse(width/2,height/2,circleSize,circleSize);
arc(width/2,height/2,circleSize,circleSize,PI/4,7*PI/4);
//arc(100,100,100,100,0.8,6);

//Circle 2
fill(0,0,0);
ellipse(110,65,8,8);
  
