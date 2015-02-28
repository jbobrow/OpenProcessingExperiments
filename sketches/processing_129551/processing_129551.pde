

PImage sb; //background image
float robo=300;
float gun= 300;
float speed =0.1;
float gravity =3;
int score=0;
PFont f;//font


void setup(){
size(600,375);//window size
sb = loadImage("space.jpg");//background image
f = loadFont("Arial-Black-20.vlw");//font type
}

void draw() {
  background(0);
  image(sb,0,0);//background image
  textFont(f,20);
  fill(255);
  textAlign(CENTER);
  text("Walle",300,22);


  
  if (robo <=29) { //my robot will not go out of the barrier left of the screen
    robo=30;}
    
  if (robo >=571) {//my robot will not go out of the barrier left of the screen
     robo=570;}
     //MINI ROCKETS
fill(0,0,255);
 rect(300,gun,10,30);
 fill(255,0,0);
  rect(500,gun-300,10,30);
   fill(0);
    rect(10,gun,10,30);
     rect(450,gun-100,10,30);
     fill(255);
     ellipse(gun,50,10,10);
     line(gun,gun,gun,gun);
     //STARS
     ellipse(gun,gun,10,10);
     ellipse(gun+100,gun,10,10);
     ellipse(gun,gun-100,10,10);
     //MORE ROCKETS
     fill(0);
      rect(100,gun-500,10,30);
       rect(300,gun-500,10,30);
        rect(50,gun-400,10,30);
         rect(500,gun-600,10,30);
          rect(100,gun-700,10,30);
           rect(250,gun-650,10,30);
             fill(0);
      rect(100,gun-800,10,30);
       rect(300,gun-600,10,30);
        rect(50,gun-1000,10,30);
         rect(500,gun-850,10,30);
          rect(100,gun-900,10,30);
           rect(250,gun-920,10,30);
           
     //rockets
     fill(0);
     rect(100,gun-50,10,30);
     fill(255);
     rect(105,gun-60,5,10);
     rect(100,gun-65,5,15);
     fill(255,0,0);
     triangle(105,gun+5,110,gun-22,100,gun-22);
   
 
   //SPEED AND GRAVITY
   gun = 200 + speed;

speed = speed + gravity;

if (gun > 1000){
  gun=-10;
  speed = speed *-0.95;   
}

     
     
//drawing the antana
stroke(0);
fill(193); //light gray interior
rect(robo,240,3,30); // antanna gets attached to the head  
fill(255,0,0); // colour red
ellipse(robo+2,240,6,6); // circle gets attached to top of rect 


// drawing the Head
stroke(0); //black outline
fill(193); // light gray head
rect(robo-30,263,60,60);

//drawing the legs
stroke(0);
fill(108); // gray
rect(robo-12,323,25,13); // Part of the legs gets attached to heah
rect(robo-7,336,15,13); // another part of the legs are attached
rect(robo-3,349,6,13); // another part is attached
fill(0,0,255);
ellipse(robo,362,16,16); // last part of the legs are attached

//drawing the face
stroke(0);
fill(255); //black interior
ellipse(robo+15,280,16,16); //circuler eyes
ellipse(robo-15,280,16,16); //circuler eye

stroke(0);
fill(0); // colour black
ellipse(robo+15,280,5,5); //black pupils
ellipse(robo-15,280,5,5); //black pupils
stroke(255); //colour white
fill(0); // colour black
rect(robo-5,290,5,5); //nose
rect(robo+5,290,5,5); //nose
rect(robo,300,5,10); //mouth

//MOVES RIGHT
  if(keyPressed == true) {
    if(keyCode == RIGHT){
      robo=(robo+7);}

  //MOVES LEFT
      if(keyPressed == true) 
        if(keyCode == LEFT){
          robo=(robo-7);}

  }
    }




