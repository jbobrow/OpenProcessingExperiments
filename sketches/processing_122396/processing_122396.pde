
//25/10/2013 Ross Mckechnie boxman

int x = 215;
int y = 45;
int ballx = 300; //ball current loction x
int bally = 300; //ball current loction y
int score = 0; // Its the score
int ballspawn = 1; // spawn loction number
int spawnloctionx = 80; //spawn loction of ball x 
int spawnloctiony = 80; //spawn loction of ball y
int rfootx = +5; // right foot spawn loction in relation to int x
int lfootx = -15; // left foot spawn 
int rfooty = +50;
int lfooty = +50;
int leyex = -5; // left eye loction in relation to int x
int reyex = +5;
int mouthx = -10;
int beardx = 0;
int btopright = -15;
int blengh = 30;
int zomx;
int zomy;
int zomrfootx = +5; // right foot spawn loction in relation to int x
int zomlfootx = -15; // left foot spawn 
int zomrfooty = +50;
int zomlfooty = +50;
int zomleyex = -5; // left eye loction in relation to int x
int zomreyex = +5;
int zommouthx = -10;
int zomx2 = 30;
int zomy2 = 215;
int topbox = 60;
int pause = 0;


void zombie(int zomx, int zomy){
   if ((x < zomx2) && (pause==0)) {
    zomx2--;  zomrfootx--; zomlfootx++; zomlfooty = +50; zomrfooty = +46; zomleyex = -10; zomreyex = -1; zommouthx = -15;
  }else if ((x > zomx) && (pause==0)){
    // If it's the right arrow
    zomx2++;  zomrfootx++; zomlfootx--; zomlfooty = +50; zomrfooty = +46; zomleyex = -1; zomreyex = +10; zommouthx = -5;
  } if ((y < zomy) && (pause==0)) {
    zomy2--;
  }else if ((y > zomy) && (pause==0)) {
    zomy2++;
    }

  if (zomrfooty > +61) // when feet y axis reaches 61 from boxman int y it will be set back to 45
  {zomrfooty=+45;} 
  if (zomrfooty < +44)
  {zomrfooty=+60;}
  if (zomlfooty < +44)
  {zomlfooty=+60;}
  if (zomlfooty > +61)
  {zomlfooty=+45;}
  if (zomrfootx > +6)
  {zomrfootx=-15;}
  if (zomrfootx < -16)
  {zomrfootx=+5;}
  if (zomlfootx < -16)
  {zomlfootx=+5;}
  if (zomlfootx > +6)
  {zomlfootx=-15;}
  
fill(200,100,40);        // head and body
rect(zomx-25,zomy+20,10,10);   // arms
rect(zomx+15,zomy+20,10,10);   // arms
rect(zomx+zomlfootx,zomy+zomlfooty,10,10);   // left foot
rect(zomx+zomrfootx,zomy+zomrfooty,10,10);    // right foot
rect(zomx-10,zomy+5,20,40);    // body
rect(zomx-13,zomy-15,26,30,5); // head
fill(255);               
ellipse(zomx+zomleyex,zomy-8,6,6);    // left eye
ellipse(zomx+zomreyex,zomy-8,6,6);    // right eye
rect(zomx+zommouthx,zomy+5,20,5);     // mouth
}

void setup() {
  size (600,800);
}


void draw()
{   background(100,200,100); 
  if (keyPressed && (key == CODED))
  {
  if (keyCode == LEFT) {
    x--; x--; rfootx--; lfootx++; lfooty = +50; rfooty = +46; leyex = -10; reyex = -1; mouthx = -15; blengh = 25; btopright = -15;
  }else if (keyCode == RIGHT) {
    // If it's the right arrow
    x++; x++; rfootx++; lfootx--; lfooty = +50; rfooty = +46; leyex = -1; reyex = +10; mouthx = -5; blengh = 25; btopright = -10;
  }if (keyCode == UP) {
    y--; y--; rfooty--; lfooty++; lfootx = -15; rfootx = +5; leyex = -5; reyex = +5; mouthx = -10; blengh = 30; btopright = -15;
  }else if (keyCode == DOWN) {
    y++; y++; rfooty--; lfooty++; lfootx = -15; rfootx = +5; leyex = -5; reyex = +5; mouthx = -10; blengh = 30; btopright = -15;}
   }
    


  zombie(zomx,zomy);
   zomx=zomx2;
   zomy=zomy2;
    
  //for (zomx = zomx2; zomx < 400; zomx = zomx+40) {
  //zombie(zomx,zomy);//}

   if (rfooty > +61) // when feet y axis reaches 61 from boxman int y it will be set back to 45
   {rfooty=+45;}
   if (rfooty < +44)
   {rfooty=+60;}
   if (lfooty < +44)
   {lfooty=+60;}
   if (lfooty > +61)
   {lfooty=+45;}
   if (rfootx > +6)
   {rfootx=-15;}
   if (rfootx < -16)
   {rfootx=+5;}
   if (lfootx < -16)
   {lfootx=+5;}
   if (lfootx > +6)
   {lfootx=-15;}
   

  
   if (y > 802)
   {y=-1;} // when boxman goes over off the bottem of the window he will teleport to -1
   if (x > 602)
   {x=-1;}
   if (y < -2) // if boxman walks off to the top of the window he will be reset on bottom
   {y=801;}
   if (x < -2) 
   {x=601;}
   
   if (bally > 802)
   {bally=-1;}
   if (ballx > 602)
   {ballx=-1;}
   if (bally < -2)
   {bally=801;}  
   if (ballx < -2)
   {ballx=601;}
  
    // if ball is near ball loccation will be tyed to dude loction
   if ((y > bally-20) && (y < bally+20) && (x > ballx-20) && (x < ballx+20)) {
   bally=y+10; ballx=x;}

   // if the ball is in centrebox the ball will spawn in ball spawn 1
  if ((ballx > 250) && (bally > 350) && (ballx < 350) && (bally < 450)) {
  bally=spawnloctiony; ballx=spawnloctionx; score += 100; ballspawn += 1;}

 if (ballspawn == 2)
 {spawnloctionx = 400;} // changes ball spawn location
 if (ballspawn == 3)
 {spawnloctiony = 700;}
 if (ballspawn == 4)
 {spawnloctionx = 80;}
 if (ballspawn == 5)
 {spawnloctiony = 80; ballspawn = 1;} // resets to first location
 
 {
 

   
fill(204, 102, 0);
rect(250,350,100,100); //drop point for ball centrebox

fill(200,100,40);        // head and body
rect(x-25,y+20,10,10);   // arms
rect(x+15,y+20,10,10);   // arms
rect(x+lfootx,y+lfooty,10,10);   // left foot
rect(x+rfootx,y+rfooty,10,10);    // right foot
rect(x-10,y+5,20,40);    // body
rect(x-13,y-15,26,30,5); // head
fill(255);               
ellipse(x+leyex,y-8,6,6);    // left eye
ellipse(x+reyex,y-8,6,6);    // right eye
rect(x+btopright,y+2,blengh,20);    //beard
rect(x+mouthx,y+5,20,5);     // mouth

fill(255);
ellipse(ballx,bally,40,40); // this is the ball

fill(#88B1F5);

rect(0,0,600,topbox);

fill(50);
textSize(40);
text("score :" +score, 10, 50); // scoreboard


    if ((zomx==x) && (zomy==y))
     {
     pause=1; 
     }
     
     if (pause==1)
   {
     topbox=800;
     x = 215;
     y = 45;
     zomx2 = 100;
     zomy2 = 45;
     fill(50);
     textSize(60);
     text("GAME OVER", 100, 400);
     textSize(30);
     text("Press any key to play again",90,500);
   }
    if ((pause==1) && (keyPressed == true))
    {
      pause=0;
      setup();
       x = 215;
 y = 45;
 ballx = 300; //ball current loction x
 bally = 300; //ball current loction y
 score = 0; // Its the score
 ballspawn = 1; // spawn loction number
 spawnloctionx = 80; //spawn loction of ball x 
 spawnloctiony = 80; //spawn loction of ball y
 rfootx = +5; // right foot spawn loction in relation to int x
 lfootx = -15; // left foot spawn 
 rfooty = +50;
 lfooty = +50;
 leyex = -5; // left eye loction in relation to int x
 reyex = +5;
 mouthx = -10;
 beardx = 0;
 btopright = -15;
 blengh = 30;
 zomrfootx = +5; // right foot spawn loction in relation to int x
 zomlfootx = -15; // left foot spawn 
 zomrfooty = +50;
 zomlfooty = +50;
 zomleyex = -5; // left eye loction in relation to int x
 zomreyex = +5;
 zommouthx = -10;
 zomx2 = 30;
 zomy2 = 215;
 topbox = 60;
  pause = 0;
    }
      
      
      
   

}
}



