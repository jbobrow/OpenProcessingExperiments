
float vy,vx,x,y,frictiony,frictionx,gravity,codeath,ellipsex,ellipsey,score;
int mode = 0;

/*
spacebar to begin, click to bounce. ghost in the machine.
*/ 

/*
ball bounces off right wall and changes color. it can bounce off both walls after x bounces it matches the background
ie you lose. if you hit one of the sphere targets, which move each time you hit a wall, your color takes a step in the other
direction
*/


void setup(){
  size(900,900);
  smooth();
  noFill();
  strokeWeight(.5);
  codeath = 0;
  ellipsex = 750;
  ellipsey = 500;
  vy = 0; //gravity starts at 0
  vx = 2; //movind 2 pixels per frame starting value
  x = 10;
  y = 10;
  score = 0;
  frictiony = -.6+random(-.05,.05); //only happens at bounce, and speed is cut in half
  frictionx = .999-random(.001-.005); // resistance so x doesnt just continue going forever
  gravity = .04;
  
}

void draw(){
  stroke(codeath);
  if(mode == 0){
    startScreen();
  } else if (mode == 1){
    fun();
  }
   
}

void mouseReleased(){
   vy -= 4;
}

void keyPressed(){
  if(mode ==0){
  mode += 1;
  }else {
  mode -= 1;
  }
}

void startScreen(){
  background(110);
  text("space to start/restart. click to jump.", 350,500);
  codeath = 0;
  ellipsex = 750;
  ellipsey = 500;
  vy = 0; //gravity starts at 0
  vx = 2; //movind 2 pixels per frame starting value
  x = 10;
  y = 10;
  frictiony = -.6+random(-.05,.05); //only happens at bounce, and speed is cut in half
  frictionx = .999-random(.001-.005); // resistance so x doesnt just continue going forever
  gravity = .04;
}
  
void fun(){
  background(110);
  ellipse(ellipsex,ellipsey,20,20);
  vy += gravity; //force that pulls down every frame
  vx *= frictionx;
  x += vx;
  y += vy;
  if(y > height){
    y = height;
    vy *= frictiony;
  }
  if(x > width){
    x = width;
    vx = -2;
  }
  if((x == width) && (codeath < 110)){
    codeath += 10;
  }
  if(x < 0){
    x = 0;
    vx = +2;
  }
  if((x == 0) && (codeath < 110)){
    codeath += 10;
  }
  
 
  if(dist(x,y,ellipsex,ellipsey)<10){
    codeath -= 30;
    //vx = 2;
    score += 1;
    ellipsex = (random(250, 750));
    ellipsey = (random(250, 750));
    
    
    
  }
  ellipse(x,y,5,5);
  text(score,850,20);
}

