

drop[] drops=new drop[100]; //array for water drops
vapor[] vapors=new vapor[1600]; //array for water vapor

PImage scene1; //loads image
PImage scene2; //loads image
PImage scene3; //loads image
PImage scene4; //loads image
PImage scene5; //loads image
PImage scene6; //loads image
PImage scene7; //loads image

float a=255; // opacity for scene1
float b=0; // opacity for scene2
float c=0; // opacity for scene3
float d=0; // opacity for scene4
float e=0; // opacity for scene5
float f=0; // opacity for scene6
float g=0; // opacity for scene7


float state=0;

void setup() {
  size(800, 800);
  scene1=loadImage("scene1.jpg"); //loads image
  scene2=loadImage("scene2.jpg"); //loads image
  scene3=loadImage("scene3.jpg"); //loads image
  scene4=loadImage("scene4.jpg"); //loads image
  scene5=loadImage("scene5.jpg"); //loads image
  scene6=loadImage("scene6.jpg"); //loads image
  scene7=loadImage("scene7.jpg"); //loads image
  
  for(int i=0; i<drops.length; i++){      // loop for initializing water drop array
   drops[i]= new drop(random(350,720),random(1,4));  // loop for initializing water drop array
  }

  
   for(int n=0; n<vapors.length; n++){  // loop for initializing water vapor array
   vapors[n]= new vapor(random(350,720),random(0.001,2)); // loop for initializing water vapor array
  }
}

void draw() {
  background(255);
  stroke(0);

  tint(255, a); // governs opacity for scene1
  image(scene1, 0, 0); 
  tint(255, b); // governs opacity for scene2
  image(scene2, 0, 0); 
  tint(255, c); // governs opacity for scene3
  image(scene3, 0, 0);
  tint(255, d); // governs opacity for scene4
  image(scene4, 0, 0);
  tint(255, e); // governs opacity for scene5
  image(scene5, 0, 0);
  tint(255, f); // governs opacity for scene6
  image(scene6, 0, 0);
  tint(255, g); //governs opacity for scene7
  image(scene7, 0, 0);
   fill(255);
   noStroke();
  rect(50,760,80,80);

  if (state == 0) {   //beginning

    a=a;
   
    if (mouseX > 50 && mouseX <220 && mouseY > 500 && mouseY < 690 && mousePressed) {
      state = 1;
    }
  }
  if (state == 1) {  //transition from scene 1 to scene 2
    a=a-1;
    b=b+1.5;
for (int i=0; i<drops.length; i++){
     drops[i].display(5);
   drops[i].move(); }
   
    if (b>254) {
      state = 2;
    }
  }
  if (state == 2) { //transition from scene 2 to scene 3
    b=b-1;
    c=c+1.5;
    a=0;
   for (int i=0; i<drops.length; i++){
     drops[i].display(5);
   drops[i].move(); }
    if (c>254) {
      state = 3;
    }
  }

  if (state == 3) { //transition from scene 3 to scene 4
    c=c-1.8;
    d=d+1.5;
    b=0;
   
    if (mouseX>50 && mouseX<220 && mouseY >330 && mouseY<499 && mousePressed) {
      state = 4;
    }
  }

  if (state == 4) { //transition from scene 4 to scene 5
    d=d-0.8;
    e=e+1.5;
    c=0;
      for (int n=0; n<vapors.length; n++){
     vapors[n].display2(2);
   vapors[n].move2(); }
    if (e>254) {
      state = 5;
    }
  }

  if (state == 5) { //transition from scene 5 to scene 6
    e=e-1.5;
    f=f+1.5;
    d=0;
    for (int n=0; n<vapors.length; n++){
     vapors[n].display2(2);
   vapors[n].move2(); }
    if (f>254) {
      state = 6;
    }
  }

  if (state == 6) { //transition from scene 6 to scene 7
    f=f-1.5;
    g=g+1.5; 
    e=0;
  }
}

class drop{     //creates class to use in water drop array

  float ypos=300;
  float xpos;
  float speed;
 float p;
  drop(float _xpos, float _speed){
  xpos=_xpos;
 speed=_speed; 
    
  }
  
  void display(int size){ // creates droplets
   noStroke(); 
   fill(0,0,255,0+p);
  ellipse(xpos,ypos,size,7);   
  p=p+1;
  p=constrain(p,2,70);
  }
  
  
  void move(){   //moves droplets
    ypos= ypos+speed;
    if(ypos>700){
      ypos=350;
      xpos=random(350,720);
    }}
    
   
}


class vapor {    //creates class to use in water vapor array
  float ypos1=750;
  float xpos1;
  float speed1;

  vapor(float _xpos1, float _speed1) {
    xpos1= _xpos1;
    speed1=_speed1;
  }

  void display2(int size2) {     //creates water vapor particles
    noStroke();
    fill(0,0,255,50);
    ellipse(xpos1, ypos1, size2,size2+0.5);
  }

  void move2() {      //moves water vapor particles
    ypos1= ypos1-speed1;
    if (ypos1<300) {
      ypos1=750;
      xpos1=random(350, 720);
    }
  }
}



