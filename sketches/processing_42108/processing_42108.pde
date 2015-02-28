
// minutes will be sheep, seconds will be stars , hours will be moon moving across
int totalpoints =60;// 60 seconds
int []x=new int [totalpoints];//
int []y = new int [totalpoints];//
int s; 
int m; 
int h;

float moon1=-100;
float  moon2=100;

void setup ( ) {
  size(800, 800); 
  smooth ( ) ;
  s=second ( ); //seconds
  m= minute ( ); // minutes
  h= hour ( ); // hours
  
  
  frameRate (1);
    
}

void draw ( ) {
  background (#060C29);
  s=second ( );
  m=minute ( ) ; 
  h = hour ( ) ; 


  fill (255);
  noStroke ( );//------ stars
    
    for (int i=x.length-1; i>0; i--) {
      x[i]= x [i-1];
      y [i]= y [i-1];
    }
    x [0]= int(random(0, 800));
    y [0]= int(random(0, 570));
  


  for (int i=x.length-1; i>0; i--) {
    if (i< s) {
      ellipse (x [i], y [i], 5, 5);
    }
//
////    else {
////      ellipse(-100, -100, 5, 5);
//  }
  }




  fill (#206423);//------ Grass Hill
  noStroke ();
  arc (400, 800, 800, 580, PI, TWO_PI);

  


  stroke (#89593A);//------ Fence
  strokeWeight (40);
  line (250, 450, 250, 550); //Left Post
  line (570, 500, 570, 600);// Right Post
  strokeWeight (20);
  line (250, 500, 570, 560);// Middle Post

strokeWeight (10);
  stroke (#7EA544);//---individual blades of grass
  line (250, 600, 250, 620 );
  line (570, 600, 570, 620);
  stroke (#8EC43F);
    line (240, 600, 250, 620 );
  line (560, 600, 570, 620);
  stroke (#508126);
    line (260, 600, 250, 620 );
  line (580, 600, 570, 620);
  stroke (#7EA544);
    line (350, 650, 350, 670 );
  line (670, 700, 670, 720);
  stroke (#8EC43F);
  line (340, 650, 350, 670 );
  line (660, 700, 670, 720);
  stroke (#508126);
  line (360, 650, 350, 670 );
  line (680, 700, 670, 720);
  




  noStroke ();//----- Moon
  fill(#FFF989);

  if (moon1<900) {
    moon1=h*33;// this is going to make it orient to the hour going across the screen
  }
  else {
    moon1= -100;// recalls to the beginning of the screen
  }

  ellipse (moon1, moon2, 100, 100);// moon circle
  fill (#FCC429);// text
  textSize (40);
  textAlign (CENTER, CENTER);
  text (h, moon1, moon2);// text moving with the moon

  fill(#FFF989,25);
 ellipse (moon1,moon2, 150,150);

fill (155,155,155,80);//---clouds on left side of screen
ellipse (100,350,50,50);
ellipse (130,350,50,50);
ellipse (150,350,50,50);
ellipse (150,360,50,50);
ellipse (170,360,50,50);
ellipse (180,360,40,40);
ellipse (195,365,30,30);
ellipse (210,365,20,20);
ellipse ( 90,355,60,60);
ellipse (120,365,80,80);
ellipse (110,365,60,60);
ellipse (60,370,40,40);
ellipse ( 70,375,40,40);
ellipse (40,370,30,30);

ellipse (600,250,50,50);//----clouds on right side of screen
ellipse (630,250,50,50);
ellipse (650,260,50,50);
ellipse (650,260,50,50);
ellipse (670,260,50,50);
ellipse (680,260,40,40);
ellipse (695,265,30,30);
ellipse (710,265,20,20);
ellipse ( 590,255,60,60);
ellipse (620,265,80,80);
ellipse (610,265,60,60);
ellipse (560,270,40,40);
ellipse ( 570,275,40,40);
ellipse (540,270,30,30);

pushMatrix ();// sheep jumping over a minute
translate (400,800);
rotate (-radians (s*1.5-55));
makesheep (-200,-600);
popMatrix ();



}
void makesheep (float x, float y) {// make the whole sheep


  fill ( #F7F6D9); //-------Body
  strokeWeight (2); 
  stroke (#F7F6D9);
  ellipse ( x, y, 70, 70);
  ellipse (x+40, y, 70, 70);
  ellipse (x+80, y, 70, 70);  
  ellipse (x+90, y+40, 70, 70);
  ellipse (x+80, y+50, 70, 70); 
  ellipse ( x+40, y+30, 70, 70);
  ellipse (x+20, y+40, 70, 70);
  ellipse (x+40, y+60, 70, 70);
  ellipse (x-10, y+30, 70, 70);
  ellipse (x, y+60, 70, 70);
  fill (#F7F7F5);
  ellipse ( x+40, y+20, 70+m, 70+m);// circle that tells seconds
  fill (#C3BAC4);
  textSize (32);
  textAlign (CENTER, CENTER);
  text (m, x+40, y+20);// text for minutes

  fill (155, 155, 155);//------- Tail
  stroke (155, 155, 155);
  ellipse (x+125, y+20, 30, 30);

  // translate (380,420);
  // rotate (155);
  fill ( #BFBDA8);
  stroke (#BFBDA8);
  ellipse (x-45, y+20, 60, 80);//----- Head 

  fill ( 0);//------ Eyes
  ellipse (x-40, y+8, 10, 10);
  stroke (0);
  line (x-47, y+5, x-33, y+5);

  pushMatrix ( );
  fill (#D18B8B);//-----Ear  
  translate(x- 20, y- 15);

  rotate (radians (45));
  noStroke();
  arc (5, 8, 40, 60, PI, PI+ HALF_PI);
  popMatrix ();

  ellipse (x-72, y+25, 10, 15);//----Mouth  
  stroke (0);
  noFill ( );
  arc (x-72, y+39, 20, 10, 0, HALF_PI);

  strokeWeight (25);//----- Legs
  stroke (#343131);
  line (x+80, y+60, x+80, y+110); //Back Leg
  line (x+10, y+60, x+10, y+110);//Front Leg
}
                
                                
