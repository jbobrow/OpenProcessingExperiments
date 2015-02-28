

PImage c;
PImage a;
PImage b;
PImage d;
PImage troll;
int drops = 0;
int trollslain = 0;
PImage g;

//Menu
int stage = 0;

//Text
int lifes = 3;
int hitscore = 0;
int hit = 0;

float rdm = random(400);
float rdm1 = random(400);
float rdm2 = random(400);
float rdm3 = random(400);
float rdm4 = random(400);
float rdm5 = random(400);

float[] dropx = {rdm, rdm1, rdm2, rdm3,rdm4,rdm5};
float[] dropy = {0, 0, 0, 0 , 0, 0};

float r = random(500); //loc rdm
float y = 0;
float shipx = 400;
float shipy = 400;
float linex = 0;
float liney = 500;







void setup() {

  size(500, 500);

  a = loadImage("starship1.png");
  b = loadImage("RenderBackgroundPS.png");
  c = loadImage("army.png");
  troll = loadImage("Troll.png");
  d = loadImage("end.png");
  g = loadImage("gg.png");
}


void draw() {

  if ( stage == 0) {

    image(c, 0, 0, 500, 500);

    if (keyPressed == true ) { //press key change menu
      stage = 2;
    }
  }
  if ( stage == 2 ) {

    image(b, 0, 0, 500, 500);
    image(a, shipx, shipy, a.width/8, a.height/8);
    fill(255,0,0);
    
    text("LIVES = " + lifes, 10, 10, 70, 80);
    fill(0,255,0);
    stroke(0);
    text("SCORE : " + hitscore, 10, 480, 200, 200);
    
    
   noFill();
    //white line gate
    line(500, 470, 0, 470);
       //starships automatic anti troll laser
       stroke(random(255), 0, 0);
       for (int i = 0 ;  i <6 ; i++ ) {
        if (shipx >= (dropx[i]-20) && shipx <= (dropx[i]+10)) {
           
          line(shipx + 31, liney-80, 0, -2500 );
           image(g,dropx[i],dropy[i],40,40);
           
           dropx[i] = random(500);
           dropy[i] = 0;
           dropy[i]++;
           
           hitscore++;
           trollslain++;
           hit++;
        }
       }
       //level trolls run
       if ( hitscore == 100 ) {
         fill(0,255,0);
         text("LEVEL 1 " ,250,250 , 400,400);
         for(int i = 0 ; i < 6 ; i++ ) {
           dropy[i]+=10;
        
         }
       }
       //level trolls rage
       if ( hitscore == 200 ) {
         text("LEVEL 2 " ,250,250 , 400,400);
         for(int i = 0 ; i < 6 ; i++ ) {
           dropy[i]+=100;
        
         }
       }
       //level troll
       if ( hitscore == 500 ) {
           text("LEVEL TROLL " ,250,250 , 400,400);
         for(int i = 0 ; i < 6 ; i++ ) {
           dropy[i]+=200;
        
         }
       }
       
           



    // Score and Lives


    //trolls marching
    for (int i=0; i<dropy.length; i++){
      dropy[i]++;
      image(troll,dropx[i], dropy[i], 20, 20);
      //ship detect collision 
      if(dropy[i] >= shipy && dropx[i] >= shipx){
        dropy[i]= 0;
        lifes--;
      }
      //passing the black line gates
      if(dropy[i] == 480) {
        lifes--;
      }
    }
     
    //game oveer trolls won
    if (lifes <= 0 || stage == 3 ) {
      fill(0,255,0);
      image(d, 0, 0, 500, 500);
      text(hitscore, 100, 175);
      text(trollslain,100,220);
    }

    
  }

  //control movements
  if (keyPressed && key == CODED ) {

    if (keyCode == RIGHT) {
      if (shipx + 30 <= width  ) {
        shipx +=10;
      }
      println("RIGHT");
    }
    if ( keyCode == LEFT ) {
      if (shipx + 30 >= 0  ) {
        shipx -= 10;

        println("LEFT");
      }
    }
  }
      
   
    if ( lifes == 0 ) {
      stage = 3;
    }
}
 



