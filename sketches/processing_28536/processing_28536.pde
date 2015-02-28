


import ddf.minim.*;

Minim minim;
AudioSample stomp;
//sub
PImage jungle;
PImage [] forward;
PImage [] boom;
PImage [] splitt;
//raiden
PImage [] roll;
PImage [] splat;
PImage [] uga;

int x = 200;
int y = 130;
int frame = 0;
int bam = 0;
int two = 0;
int counter =0;


//raiden
int luga = 0;
int stub = 0;
float rollx = 0;
int counter2 =0;
int slick = 0;
int exe = 00;
int eye = 0;
int speed = 2;
int speed2 = 4;
int direction =1;
int directiony =1;

void setup() {
  size (650, 366);
  minim = new Minim(this);
  stomp = minim.loadSample("Mortal_Kombat_Theme.mp3", 2048);


  //raiden
  roll = new PImage [8];
  splat = new PImage [6];
  uga = new PImage [4];

  for(int u = 0; u<uga.length; u++) {
    uga[u] = loadImage("10"+ (u+1) +".png");

  }
    for(int r = 0; r<roll.length; r++) {
      roll[r] = loadImage("f0"+ (r+1) +".png");
    }
    for(int s = 0; s<splat.length; s++) {
      splat[s] = loadImage("d0"+ (s+1) +".png");
    }

    //sub
    forward = new PImage[9];
    boom = new PImage[4];
    splitt = new PImage[10];


    for(int k = 0; k<splitt.length; k++) {
      splitt[k] = loadImage("h0"+ (k+1) +".png");
    }

    for(int i = 0; i<forward.length; i++) {
      forward[i] = loadImage("a0"+ (i+1) +".png");
    }


    for(int j = 0; j<boom.length; j++) {
      boom[j] = loadImage("k0"+ (j+1) +".png");
    }

    jungle = loadImage("livingforest_mk4.jpg");
    stomp.trigger();
  }


  void draw() {



    image(jungle, 0,0);

    //Raiden
    exe += speed * direction; 
    eye += speed2 * directiony;
    if (mousePressed) {
      pushMatrix();
      translate(425,200) ;
      image(uga[luga],50,50);
      popMatrix();
  pushMatrix();
      
      scale(-1.0,1.0);
      translate(-230,195) ;
      image(uga[luga],50,50);
      popMatrix();


      pushMatrix();
      translate(rollx, -20);
      image(roll[stub],50,50);
      popMatrix();
      rollx+=5;
      if(counter2%5==0) {
        stub++;
      }
      if(rollx%650==0) {
        rollx = 0;
      }
      counter2++;
      pushMatrix();
      translate(exe, eye);
      image(splat[slick],50,50);
      popMatrix();


      if(counter2%5==0) {
      luga++;
        slick ++;
      }
    }




    if(counter%10==0) {
      bam++;
    }


    if(luga >= 4) luga = 0;
    if(frame > 8) frame = 0;
    if(frame < 0) frame = 8;
    if(two >= 9) two = 0;
    if(bam > 3) bam = 0;
    if(stub >=8) stub = 0;
    if(slick >=6) slick = 0;
    if (exe >= 500) direction = -direction; 
    if (eye >= 50) directiony = -directiony; 
    if (exe <= -50) direction = 1; 
    if (eye <= -50) directiony = 1; 

    pushMatrix();
    translate(x, y);
    image(forward[frame],50,50);
    popMatrix();
  }


  void keyPressed() {
    if(key == CODED) {
      if(keyCode == RIGHT) {
        x += 5;
        frame++;
      }
      else if(keyCode==LEFT) {
        x-= 5;
        frame--;
      }
      else if(keyCode==UP) {

        pushMatrix();
        translate(25, 50);
        image(boom[bam],x,y);
        popMatrix();
      counter++;

      }
      else if(keyCode==DOWN) {

        pushMatrix();
        translate(25, 100);
        image(splitt[two],x,y);
        popMatrix();
       
         two++;
    }
      

      }
    }


  void stop()
  {
    // always close Minim audio classes when you are done with them
    stomp.close();
    minim.stop();

    super.stop();
  }


