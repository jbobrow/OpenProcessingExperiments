
/* remake of Spacewar
 
 Devan Buggay and Kyle Owen
 Oct 12 2009 on an airplane...
 
 
 CONTROLS
 PLAYER 1
 a left
 s right 
 d thrust
 f fire
 PLAYER 2
 j left
 k right
 l thrust
 ; fire
 
 
 HEY READ THIS
 dirtiest code ive ever written, gona clean it up and try to write it in objects and modules so i can get some
 practice in that.
 I recommend turning off the star so that you can mess around with the ship controls. its easy just add "//" before the gravitywell function call
 No collision at this point. i basically did most of this in a one hour plane ride so ill probably get it done tommorow.
 
 ALSO i added a cool little effect i thought you would think was cool. Its the pixel trailing effect that
 the screen has on the original game. or at least i think it is =P anywas it gives a sense of speed and a cool little effect
 so i think we should keep it
 
 wrote some little comments on some of the code to KIND of give you a direction on what i was doing
 sorry its so messy
 
 thought of some ideas for our REVAMPED Version
 we should implement the astroids game =D
 if the astroids reach the star then the star should grow and have more of a pulling force
 ai bots?
 lives
 heat seeking missles
 keeps all players fom hyperspacing
 
 
 
 THINGS TO DO
 fix gravity well (DONE)
 fix collision
 make missles collide
 reset (DONE)
 fix ship scrolling
 recode (Mess)
 fix Ghost ships (DONE) and ghost missles
 add fuel (DONE) and # of missles (DONE)
 add hyperspace
 
 
 */

// REWRITE IN OOP
int [][] stars;
float [][] ships;
float [][] missles;
boolean[] keys = new boolean[11];
final int a = 0;
final int s = 1;
final int d = 2;
final int f = 3; 
final int j = 4;
final int k = 5;
final int l = 6;
final int semicolon = 7;
final int w = 8;
final int i = 9;
final int reset = 10;
int check = 0;


int thrust1,thrust2; // whether or not player is thrusting, could be cut
float gr,ga,gf;
float grav=4; // gravity of star
int fire1,fire2;
int hyper1,hyper2;
int hyperdelay1,hyperdelay2;

void setup(){
  strokeWeight(1);
  size(600,600);
  //smooth();
  stars = new int[50][2];
  ships = new float[2][14];
  missles = new float[13][7];
  /*
   ships
   0 xpos
   1 ypos
   2 xvel
   3 yvel
   4 xacc
   5 yacc
   6 ang
   7 current missle
   8 thrust on/off
   9 hyperspace count
   10 live
   11 fuel
   12 missles
   13 hyperdelay
   
   missles
   missles 0-5 are player 1
   missles 6-12 are player 2
   0 xpos
   1 ypos
   2 ang
   3 active
   4 distance
   5 svx
   6 svy
   */
  for(int star=0;star<50;star++){
    stars[star][0]=int(random(0,width));
    stars[star][1]=int(random(0,height));
  }  
  ships[0][0]=100;
  ships[0][1]=100;
  ships[1][0]=500;
  ships[1][1]=500;
  ships[1][7]=6;
  ships[0][10]=1;
  ships[1][10]=1;
  ships[1][6]=PI;
  ships[0][11]=1000;
  ships[1][11]=1000;
  ships[0][12]=32;
  ships[1][12]=32;
  frameRate(30);
}

void draw(){
  println(ships[0][13]);
  println(ships[1][13]);
  println(ships[0][10]);
  println(ships[1][10]);
  stroke(0);
  fill(0, 95);
  rect(0,0,width,height);
  fill(33,222,33);
  stroke(33,222,33);
  for(int star=0;star<50;star++){
    point(stars[star][0],stars[star][1]);
  }
  thrust1=0;
  thrust2=0;

  controls();
  ships();
  gravitywell();
  missles();
  collision();
  if(fire1>0){
    fire1--;
  }
  if(fire2>0){
    fire2--;
  }
  if(hyper1>0){
    hyper1--;
  }
  if(hyper2>0){
    hyper2--;
  }
  if(ships[0][13]>0){
    ships[0][13]--;
  }
  if(ships[1][13]>0){
    ships[1][13]--;
  }
  if(keys[reset]==true && check == 0){
    startup();
    check = 1;
  }
}

void gravitywell(){
  float gwa=random(0,TWO_PI);
  float gwl=random(5,10);
  line(width/2-gwl*cos(gwa),(height/2)-gwl*sin(gwa),width/2+gwl*cos(gwa),(height/2)+gwl*sin(gwa));
  for(int ship = 0 ; ship<2 ; ship++){
    gr=dist(ships[ship][0],ships[ship][1],width/2,height/2);
    ga=atan2(ships[ship][1]-(height/2),ships[ship][0]-(width/2));
    gf=(grav*(50)/sq(gr));
    ships[ship][4]=-gf*cos(ga);
    ships[ship][5]=-gf*sin(ga);
  }
}

void missles(){
  for(int missle=0 ; missle <13 ; missle++){ //check each missle
    if(missles[missle][3]==1){ //check is missle is alive
      missles[missle][0]=missles[missle][0]+3*cos(missles[missle][2])-missles[missle][5]; //update missle.x
      missles[missle][1]=missles[missle][1]+3*sin(missles[missle][2])-missles[missle][6]; //update missle.y    
      line(missles[missle][0],missles[missle][1],missles[missle][0]+2*cos(missles[missle][2]),missles[missle][1]+2*sin(missles[missle][2])); //draw missle
      missles[missle][4]-=1;
      if(missles[missle][4]==0){
        missles[missle][3]=0;
      }
      if(missles[missle][0]<0){
        missles[missle][0]=width;
      }
      if(missles[missle][0]>width){
        missles[missle][0]=0;
      }
      if(missles[missle][1]>height){
        missles[missle][1]=0;
      }
      if(missles[missle][1]<0){
        missles[missle][1]=height;
      }  
    }
  }


}

void controls(){
  if(keys[a] == true) { //left turn
    ships[0][6]=ships[0][6]-PI/50;
  }
  if(keys[s] == true) { //right turn
    ships[0][6]=ships[0][6]+PI/50;
  }
  if(keys[d] == true && ships[0][11]>0) { //thrust
    ships[0][4]=ships[0][4]-.01*cos(ships[0][6]-HALF_PI);  
    ships[0][5]=ships[0][5]-.01*sin(ships[0][6]-HALF_PI); 
    thrust1=1;
    ships[0][11]-=1;
  }
  if(keys[f] == true && fire1==0) { //fire
    fire(0);
  }
  if(keys[j] == true) { //left turn
    ships[1][6]=ships[1][6]-PI/50;
  }
  if(keys[k] == true) { //right turn
    ships[1][6]=ships[1][6]+PI/50;
  }
  if(keys[l] == true && ships[1][11]>0) { //thrust
    ships[1][4]=ships[1][4]-.01*cos(ships[1][6]-HALF_PI);  
    ships[1][5]=ships[1][5]-.01*sin(ships[1][6]-HALF_PI); 
    thrust2=1;
    ships[1][11]-=1;
  }
  if(keys[semicolon] == true && fire2==0) { //fire
    fire(1);
  }
  if(keys[w] == true && hyper1==0) { //fire
    hyperspace(0);
  }
  if(keys[i] == true && hyper2==0) { //fire
    hyperspace(1);
  }
}


void ships(){
  for(int ship = 0 ; ship<2 ; ship++){  
    if(ships[ship][10]==1 && ships[ship][13]==0){
      ships[ship][0]=ships[ship][0]-ships[ship][2];
      ships[ship][1]=ships[ship][1]-ships[ship][3];
      ships[ship][2]=ships[ship][2]-ships[ship][4];
      ships[ship][3]=ships[ship][3]-ships[ship][5];
      if(ships[ship][0]<0){
        ships[ship][0]=width;
      }
      if(ships[ship][0]>width){
        ships[ship][0]=0;
      }
      if(ships[ship][1]>height){
        ships[ship][1]=0;
      }
      if(ships[ship][1]<0){
        ships[ship][1]=height;
      }
      if(ship==0){
        for(int rds=0;rds<5;rds++){
          pushMatrix(); // draw the ship
          noFill();
          scale(1);

          if(rds==0){
            translate(ships[ship][0],ships[ship][1]);
          }
          if(rds==1){
            translate(ships[ship][0]-width,ships[ship][1]);
          }     
          if(rds==2){
            translate(ships[ship][0],ships[ship][1]+height);
          }     
          if(rds==3){
            translate(ships[ship][0]+width,ships[ship][1]);
          }    
          if(rds==4){
            translate(ships[ship][0],ships[ship][1]-height);
          }     
          //println(frameRate);
          rotate(ships[ship][6]);
          line(0,17,0,19);
          line(-1,15,-1,16);
          line(1,15,1,16);
          line(-3,9,-2,14);
          line(3,9,2,14);
          line(-4,4,-4,8);
          line(4,4,4,8);
          line(-5,-4,-5,3);
          line(5,-4,5,3);
          line(-4,-8,-4,-4);
          line(4,-8,4,-4);
          line(-3,-9,-2,-14);
          line(3,-9,2,-14);
          line(-1,-15,1,-15);
          point(-6,-5);
          point(6,-5);
          line(-7,-7,-7,-6);
          line(7,-7,7,-6);
          line(-8,-15,-8,-8);
          line(8,-15,8,-8);
          line(-7,-14,-4,-11);
          line(7,-14,4,-11);
          endShape();
          if(thrust1==1 && ship==0){
            line(0,-15,0,-15+random(-15));
          }
          if(thrust2==1 && ship==1){
            line(0,-7,0,-7+random(-7));
          }
          popMatrix();
        }
      }

      if(ship==1){
        for(int rds=0;rds<5;rds++){
          pushMatrix(); // draw the ship
          noFill();
          scale(1);

          if(rds==0){
            translate(ships[ship][0],ships[ship][1]);
          }
          if(rds==1){
            translate(ships[ship][0]-width,ships[ship][1]);
          }     
          if(rds==2){
            translate(ships[ship][0],ships[ship][1]+height);
          }     
          if(rds==3){
            translate(ships[ship][0]+width,ships[ship][1]);
          }    
          if(rds==4){
            translate(ships[ship][0],ships[ship][1]-height);
          }     
          rotate(ships[ship][6]); 
          beginShape();
          line(0,15,0,19);
          line(-2,11,-1,14);
          line(2,11,1,14);
          line(-3,-15,-3,10);
          line(3,-15,3,10);
          line(0,-15,0,-6);
          line(-6,-15,6,-15);
          line(-6,-9,-6,-14);
          line(6,-9,6,-14);
          line(-6,-8,-4,-6);
          line(6,-8,4,-6); 
          endShape();
          if(thrust1==1 && ship==0){
            line(0,-7,0,-7+random(-7));
          }
          if(thrust2==1 && ship==1){
            line(0,-15,0,-15+random(-15));
          }
          popMatrix();
        }

      }
    }
  }
}



void fire(int ship){
  if(ships[ship][12]>0){
    int currentmissle = int(ships[ship][7]);
    missles[currentmissle][3]=1;
    missles[currentmissle][0]=ships[ship][0]+15*cos(ships[ship][6]+HALF_PI);
    missles[currentmissle][1]=ships[ship][1]+15*sin(ships[ship][6]+HALF_PI);
    missles[currentmissle][2]=ships[ship][6]+HALF_PI;
    missles[currentmissle][5]=ships[ship][2];
    missles[currentmissle][6]=ships[ship][3];
    missles[currentmissle][4]=100;
    ships[ship][7]++;
    if(ships[ship][7]>5 && ship==0){
      ships[ship][7]=0;
    }
    if(ships[ship][7]>12 && ship==1){
      ships[ship][7]=6;
    }
    if(ship==0){
      fire1=15;
    }
    if(ship==1){
      fire2=15;
    }
    ships[ship][12]--;
  }
}
void collision(){
  for(int ship=0;ship<2;ship++){

    if(dist(ships[ship][0],ships[ship][1],width/2,height/2)<10){
      ships[ship][0]=0;
      ships[ship][1]=0;
      ships[ship][2]=0;
      ships[ship][3]=0;
      ships[ship][4]=0;
      ships[ship][5]=0;
    }
    if(dist(ships[0][0],ships[0][1],ships[1][0],ships[1][1])<20)
    {
      if(ships[0][10]==1 && ships[1][10]==1){
        ships[0][10]=0;
        ships[1][10]=0;
      }
    }

    for(int missle=0 ; missle <13 ; missle++){ //check each missle
      if(dist(ships[ship][0],ships[ship][1],missles[missle][0],missles[missle][1])<20){
        if(ship==0 && missle>5 && missles[missle][3]==1){
          ships[ship][10]=0;
          missles[missle][3]=0;    
        }   

        if(ship==1 && missle<6 && missles[missle][3]==1){
          ships[ship][10]=0;
          missles[missle][3]=0;
        } 

        for(int misslecheck=0 ; misslecheck <13 ; misslecheck++){ //check each missle
          if(dist(missles[missle][0],missles[missle][1],missles[misslecheck][0],missles[misslecheck][1])<50){
            if(missle>6 && misslecheck>5){
              missles[missle][3]=0;
              missles[misslecheck][3]=0;  
            }
          }
        }

      }
    }
  }






}
void keyPressed() {
  if(key == 'a') {
    keys[a] = true;
  } 
  else if(key == 's') {
    keys[s] = true;
  } 
  else if(key == 'd') {
    keys[d] = true;
  } 
  else if (key == 'f') {
    keys[f] = true;

  }
  if(key == 'j') {
    keys[j] = true;
  } 
  else if(key == 'k') {
    keys[k] = true;
  } 
  else if(key == 'l') {
    keys[l] = true;
  } 
  else if (key == ';') {
    keys[semicolon] = true;

  }
  else if (key == '`') {
    keys[reset] = true;

  }
  else if (key == 'w') {
    keys[w] = true;

  }
  else if (key == 'i') {
    keys[i] = true;

  }
}

void keyReleased() {
  if(key == 'a') {
    keys[a] = false;
  } 
  else if(key == 's') {
    keys[s] = false;
  } 
  else if(key == 'd') {
    keys[d] = false;
  } 
  else if (key == 'f') {
    keys[f] = false;
  }
  if(key == 'j') {
    keys[j] = false;
  } 
  else if(key == 'k') {
    keys[k] = false;
  } 
  else if(key == 'l') {
    keys[l] = false;
  } 
  else if (key == ';') {
    keys[semicolon] = false;
  }
  else if (key == '`') {
    keys[reset] = false;
    check = 0;
  }
  else if (key == 'w') {
    keys[w] = false;
  }
  else if (key == 'i') {
    keys[i] = false;
  }
} 





void startup(){
  stars = new int[50][2];
  ships = new float[2][14];
  missles = new float[13][7];
  for(int star=0;star<50;star++){
    stars[star][0]=int(random(0,width));
    stars[star][1]=int(random(0,height));
  }  
  ships[0][0]=100;
  ships[0][1]=100;
  ships[1][0]=500;
  ships[1][1]=500;
  ships[1][7]=6;
  ships[0][10]=1;
  ships[1][10]=1;
  ships[1][6]=PI;
  ships[0][11]=1000;
  ships[1][11]=1000;
  ships[0][12]=32;
  ships[1][12]=32;





}

void hyperspace(int ship){

  ships[ship][0]=random(0,width);
  ships[ship][1]=random(0,height);  
  ships[ship][2]=random(-1,1);
  ships[ship][3]=random(-1,1);
  ships[ship][6]=random(-PI,PI);

  if(ship==0){
    hyper1=50;
  }
  if(ship==1){
    hyper2=50;
  }
  ships[ship][13]=20;


}









