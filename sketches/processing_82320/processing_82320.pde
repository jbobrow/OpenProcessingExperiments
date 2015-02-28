
int click;
PImage selfie;
PImage jump;
PImage colorwheel;
PImage hourglass;
PImage error1;
PImage error2;
PImage error3;
PImage error4;
float radius;
float xA,yA;
float angle;
float glowLight;
float cX, cY;

float x;                                      //variables for the floating colorwheels
float y;
float directionX;
float directionY;
 
float x2;                                     //
float y2;
float directionX2;
float directionY2;
 
float x3;                                    //
float y3;
float directionX3;
float directionY3;
 
float x4;                                    //
float y4;
float directionX4;
float directionY4;
 
float x5;                                   //
float y5;
float directionX5;
float directionY5;

float vy = 0;
float x6 = 0;
float y6 = 20;
float frictionx = .998;
float frictiony = -.75;          //the default setting
float gravity = .03;
float sec = 0;
float y7;                        //variable for self-portrait coordinate

void setup(){                     //SETUP
  size(1500,1000);
  xA = 0;
  yA = 0;
  cX = width/2;
  cY = height/2;
  angle = 0;
  smooth();
  //background(255);
  imageMode(CENTER);
click = 0;
  
selfie = loadImage ("Annette_portrait.gif");
jump = loadImage ("annetteJump.gif");
colorwheel = loadImage ("colorwheel_of_doom.gif");
hourglass = loadImage ("Windows-Hourglass.gif");
error1 = loadImage ("error01.gif");
error2 = loadImage ("error2.gif");
error3 = loadImage ("error3.gif");
error4 = loadImage ("error4.gif");
   
x = 100;                                 //initial coordinates for the floating colorwheels, their starting point
  y = 700;
   
  x2 = 200;                             //
  y2 = 700;
   
  x3 = 450;                             //
  y3 = 700;
   
  x4 = 650;                            //
  y4 = 700;
   
  x5 = 750;                            //
  y5 = 700;
   
  directionY = random(4,10);                    //the speed for the colorwheels. Set at random for each time they re-appear on the screen
   
  directionY2 = random(2,6);                    //
   
  directionY3 = random(4,10);                  //
   
  directionY4 = random(2,6);                   //
   
  directionY5 = random(4,10);                  //

  y7 = 1500;
}

void draw(){                          //DRAW
  //background(255);
 

  
  
  image (colorwheel,cX,cY);                                          //starting image of the sketch
  
  if(click == 1){                                                    //when mouse is clicked, the trig function starts
    //background(255);
    
    
   xA = 1500*cos(radians(angle/20))*sin(radians(angle));            //
  yA = 1500*sin(radians(angle))*cos(radians(angle*35));
  image(colorwheel,xA+width/2,yA+height/2);
  
  glowLight = abs(255*sin(radians(angle)));
  fill(glowLight,12,56,98);
  //ellipse(width/2,height/2,190,190);
  angle+=2;
    
  }
  
  if(click == 2){                                                 //enter the hourglass
    background(255);
    cX = 5000;
   image(hourglass,width/2,height/2);
  }
  
  if(click == 4){                                                //enter error1
    background(255);
    
   image(error1,width/2,height/2);
  }
  
  if(click == 5){                                               //enter error2
    background(255);
    
    image(error2,width/2,height/2);
  }
  
  if(click == 6){                                               //enter error3
    background(255);
    
    image(error3,width/2,height/2);
  }
  
  if(click == 7){                                              //enter error4
    background(255);
    
    image(error4,width/2,height/2);
  }
  
  if(click == 8){                                              //hysteric mix with color and all the error images
    background(random(255),random(255),random(255));
    
    image(error1,random(0,1500),random(0,1000));
    image(error2,random(0,1500),random(0,1000));
    image(error3,random(0,1500),random(0,1000));
    image(error4,random(0,1500),random(0,1000));
  }
  
  if(click >= 9){                                              //game: escaping the wheels of doom
    background(255);
    
 phys();
  image(colorwheel,x,y);
  image(colorwheel,x2,y2);
  image(colorwheel,x3,y3);
  image(colorwheel,x4,y4);
  image(colorwheel,x5,y5);
  //x -= directionX;
  y -= directionY;
  y2 -= directionY2;
  y3 -= directionY3;
  y4 -= directionY4;
  y5 -= directionY5;
   
if(y < 0){                                                    //all the color wheels are set to reset to a random coordinate when reaching the top(or '0').
 x = random(50,1500);                                         //but still staying within the coordinates 50,1500. All y coordinates have the full range(1000) 
 y = 1000;           
}
   
if(y2 < 0){                                                   //
 x2 = random(50,1500);
 y2 = 1000;
} 
 
if(y3 < 0){                                                  //
 x3 = random(50,1500);
 y3 = 1000;
}
 
if(y4 < 0){                                                 //
 x4 = random(50,1500);
 y4 = 1000;
}
 
if(y5 < 0){                                                //
 x5 = random(50,1500);
 y5 = 1000;
}
 
  
  }
}
  

  
void mouseClicked(){
  click = click +1;
}

void phys(){                                //PHYS
  vy += gravity;
  y6 += vy;
  if(y6 > height){                            //if mini-Annette falls down, self-portrait will show up.
    fill(255,0,0);
  image(selfie,width/2,y7);
  y7-= 2;                                    //the speed of the self-portrait is controlled by the same conditional, moving it up from outside the screen
  if(y7 <= 600){
    y7 = 600;
  }
   
}
if(dist(x6,y6,x,y)<= 100){                       //controlles the interaction between the figure and the color wheels.
  //y6 = height;
    vy *= frictiony;
    vy -= 1.4;
}
 
if(dist(x6,y6,x2,y2)<= 100){                    //
  //y6 = height;
    vy *= frictiony;
    vy -= 1.4;
}
 
if(dist(x6,y6,x3,y3)<= 100){                   //
  //y6 = height;
    vy *= frictiony;
    vy -= 1.4;
}
 
if(dist(x6,y6,x4,y4)<= 100){                  //
  //y6 = height;
    vy *= frictiony;
    vy -= 1.4;
}
 
if(dist(x6,y6,x5,y5)<= 100){                 //
  //y6 = height;
   vy *= frictiony;
    vy -= 1.4;
}
   fill(123,12,85,35);
  image(jump,x6,y6-50);
 // fill(123,12,85,35);
  
 if((keyPressed ==true) && (keyCode == LEFT)){
   x6 -= 2;
    
 }
  
  if((keyPressed ==true) && (keyCode == RIGHT)){
   x6 += 2;
    
 }
}
  

  


