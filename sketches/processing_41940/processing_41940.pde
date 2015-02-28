
//3d test. Using lights and shapes
//Copyright, Felipe Castelblanco. October 8, 2011

//simple animation

PFont a;//font
PImage img; //image 1
PImage africa; //image 2
PImage asia; //image 3
PImage fire; //image 4

float x = 0;//variable for moving box

void setup()
{
  size(600, 600, P3D); 
 
  img = loadImage("americas.png");
  africa = loadImage( "africa.png");
  asia = loadImage("asia-oceania.png");
  fire = loadImage("fire.png");
  
  a = loadFont("fonta.vlw");
  textFont(a, 32);
  
  noStroke();
  smooth();
}
void draw()
{
  directionalLight(151, 102, 126, -1, 0, 0); //set lights to purple
  
  dimg( );
  tex ();
  starts();
   
}

void starts()//controls box bouncing aroun
{
  x = x + .5; //loop that increases x by 50%
  if (x >= 200) { //goes from 0 till 250
    x = 0;
  }
  fill(10,x,x,x);
  pushMatrix();
  translate(x +.2*width,x + .3*height,200);
  rotateX(radians(frameCount/2));
  rotateZ(radians(frameCount/2));
    fill(x,x,x,x);//random color
    box(x/2);
    
  popMatrix();
  
}

void dimg( )
{
  
   background(20); 
   
   //draws maps /// It was hard to play with proportions due to the positioning or images
 pushMatrix();
   
    translate(width/2, height/2, 0);//set to middle
    rotateY(radians(frameCount));//rotates everything in Y
    rotateX(radians(frameCount));//rotates everything in X

      pushMatrix();
        translate(-100,0,-100);
        image(img, -60, -60, 200,200); 
      popMatrix();
      pushMatrix();
        translate(30,0,-30);
        rotateY(radians(90));
        image(africa, -60, -60, 200,200); 
      popMatrix();
       pushMatrix();
       translate(-30,0,30);
        rotateY(radians(180));
        image(asia, -60, -60, 200,200); 
      popMatrix();
   pushMatrix();
        translate(-120,0,30);
        rotateY(radians(90));
        image(fire, -60, -60, 180,180); 
      popMatrix();
     
     translate(.3*width,.3*height,0);
      rotateY(radians(frameCount*2));
     
     
     //moon and sun
     noStroke();
      fill(255);
      sphere(10);
   translate(.2*width,.2*height,50);
   rotateX(radians(frameCount/2));
   fill(255,255,10);
   sphere(30);
   popMatrix();
  
}

void tex ()

{
  translate(width/4,height/4,-50);
  rotateY(radians(frameCount));
  fill(200);
  text("1491...",0,0);
  
}

