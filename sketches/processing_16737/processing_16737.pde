
//Andres Kõpper
//Processing class, IED Barcelona, Week 6
//14.12.2010

//The sketch is a GAME, which is really boring. (But not for me at least)
//Here it is possible to drive your MINI to bypass other vehicles in a country road.
//With the keypad using (W, A, D and S) key is possible to drive the MINI.

//First, I show what things I have in "the box".

PImage ASPHALT;   //Asphalt image
float yspeed = 0; // The speed of the car in the beginning.(Actually the speed of the background :P

//Mini images
PImage mini;
PImage mini1;
PImage mini2;
PImage mini3;
PImage minumini;
float Ypos = 0; //THe Y position of the background.
float Xpos =0;  //The X position of the MINI.
int MAX = 10; // Max amount of "traffic" MINIs.
//I use arrays to randomize the position of the "traffic" MINIs. 
//And so many Arrays, because I don't want the different groups of MINIs to be the same.
int[] x = new int[MAX];
int[] y = new int[MAX];
int[] t = new int[MAX];
int[] r = new int[MAX];
int[] e = new int[MAX];
int[] w = new int[MAX];
int[] o = new int[MAX];
int[] p = new int[MAX];
//Position float to control the appearing and dissapearing of different groups of "traffic" minis.
float  Tpos = 0;
float  Lpos = 0;
//Images of forest and the grass.
PImage forest1;
PImage grass;
PImage grass1;
PImage forest;
PImage forest5;
PImage shadow;
PImage grass2;

float nummer =3;// The speed of turning the car.




void setup() {
  size (700,480);
  background(0); 
  
  
  //FIRST I load all the images.
  ASPHALT = loadImage("ASPHALT.png");
  mini = loadImage("mini3.png");
  mini1 = loadImage("mini.png");
  mini2 = loadImage("mini2.png");
  mini3 = loadImage("mini1.png");
  minumini = loadImage("minumini.png");
  for (int i = 0; i < MAX; i = i +1) {
    

    forest = loadImage("forest.png");
    forest1 = loadImage("forest1.png");
    grass = loadImage("GRASS.png");
    grass1 = loadImage("grass1.png");
    grass2 = loadImage("grass2.png");
    forest5 = loadImage("forest5.png"); 
    shadow = loadImage("shadow.png"); 

    //I set the value , where the groups of "traffic MINIs" will appear.
    x[i] = int(random(width/2+30,width/2+130));
    y[i] = int(random(0,height));
    
    o[i] = int(random(width/2+30,width/2+130));
    p[i] = int(random(0,height));



    t[i] = int(random(220,width/2-40));
    r[i] = int(random(0,height));
    
    e[i] = int(random(220,width/2-40));
    w[i] = int(random(0,height));
  }
}

void draw() {
  background(0);




  imageMode(CENTER);

  if (yspeed> 10) { //I set the maximum speed of the MINI.
    yspeed =  10;
  } 
  if (yspeed< 0) { // So that the MINI couldnt go backwards.
  yspeed =  0;
  } 
  Ypos = Ypos + yspeed; //I set the relation of different groups of "traffic" cars with the background.
  Tpos = Tpos + yspeed ;
  Lpos = Lpos + yspeed ;
  Tpos= Tpos-4; // THE speed of the downstream traffic
  Lpos= Lpos+4; // THE speed of upstream traffic. 
  
  if (Ypos> height) { // The LOOP of the background
    Ypos=0;
  } 
  if (Tpos> height+480) { // THE LOOP of the traffic
    Tpos=-480;
  } 
  if (Lpos> height+480) {  //THe LOOP of the traffic.
    Lpos=-480;
  } 
  if (Ypos< 0) {  //THe LOOP of the background
    Ypos=0;
  } 
  if (Tpos< -480) {  //THe LOOP of the traffic.
    Tpos=height+480;
  }
  if (Lpos< -480) {  //THe LOOP of the traffic.
    Lpos=height+480;
  }  


  if(keyPressed) {
    switch(key) {
    case'w':  //ACCELERATION of the MINI


      yspeed = yspeed + 0.1;

      break;
    case'd':   //Turning RIGHT 
      Xpos = Xpos + nummer;
      break;
    case'a':     // TURNING LEFT
      Xpos = Xpos - nummer;
      break; 
    case's':    //MOST IMPORTANT  -  BRAKES  
      yspeed = yspeed - 0.2;  // THE quality of the brakes :P
    }
  }


  image(ASPHALT,width/2, Ypos+240,width/2-50,height);
  image(ASPHALT,width/2, Ypos-240,width/2-50,height);// I position them, so that they would start to LOOP.

  for (int i = -480 ; i < height*2 ; i = i+20) { // I double the distance so that the 2 ASPHALT pictures would make 1 WHOLE ROAD.
    
    strokeWeight(2.5);
     stroke(255,180);  //Set color to white, for the ROAD STRIPES.
     
     
     line(width/2,i + Ypos,width/2,i+10 + Ypos);
     
   
     
    
  }
  image(grass, width/2-48,Ypos-240); // I position the Grass to be in behind everything else.
  image(grass, width/2-48,Ypos+240);



  image(grass2, width/2+49,Ypos+240);
  image(grass2, width/2+49,Ypos-240);
  image(grass1, width/2+55,Ypos+240);
  image(grass1, width/2+55,Ypos-240);

  image(shadow, width/2 +140+ Xpos, height-97); // THe MINI's shadow
  image(minumini, width/2 + 140 + Xpos, height-100); // THE MAIN MINI!!
  for (int i = 0; i < 3; i++) { // I use arrays to great the groups of TRAFFIC MINIS. (MAX AMOUNT is 3
    if (Tpos< -479) {// SO that everytime they appear, they would position differently.
      x[i] = int(random(width/2+10,width/2+130));
      y[i] = int(random(0,height));
    }
    
    if (Tpos< -479) {
      o[i] = int(random(width/2+10,width/2+130)); 
      p[i] = int(random(0,height));
    }
    
    if (Lpos>height +469) {
      e[i] = int(random(220,width/2-10));
      w[i] = int(random(0,height));
    }

    if (Lpos> height +469) {
      t[i] = int(random(220,width/2-10));
      r[i] = int(random(0,height));
    }
    if (Lpos<-469) {
      e[i] = int(random(220,width/2-10));
      w[i] = int(random(0,height));
    }

    if (Lpos<-469) {
      t[i] = int(random(220,width/2-10));
      r[i] = int(random(0,height));
    }
    
    // HERE are the "Traffic Minis"
    image(mini1, x[i],y[i]+Tpos );
    image(mini, o[i],p[i]+Tpos -480 );
    image(mini2, t[i],r[i]+Lpos );
    image(mini3, e[i],w[i]+Lpos -480 ); // I set different pictures of different groups of "traffic minis".
   //FORESTs I use double to make a continous FOREST, like I did with the ASPHALT.
    image(forest5, 100, Ypos-240  );
    image(forest5, 100, Ypos+240);

    image(forest, width-100, Ypos-240);
    image(forest, width-100, Ypos +240);
  }
  

}




void keyReleased() {
  switch(key) {
  case'w':

    yspeed=yspeed-2; // WHEN throttle is released the speed of the car decreases.
    break;
  }
}


