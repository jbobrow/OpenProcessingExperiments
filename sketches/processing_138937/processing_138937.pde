
PFont EccentricStd48;
Movers move1, move2, move3, move4;
Blood blood1, blood2, blood3, blood4;
void setup () {
  EccentricStd48= loadFont("Serif-48.vlw");
  move1=new Movers(10, 50, .001 );// construct ants
  move2=new Movers(10, 150, .001);
  move3=new Movers(10, 275, .001);
  move4=new Movers(10, 400, .001);

  blood1=new Blood(10, 70, 15, 65); //construct blood drops
  blood2=new Blood(10, 160, 9, 160); 
  blood3=new Blood(10, 300, 12, 280);
  blood4=new Blood(10, 400, 3, 410);
  loop();
  size (1000, 500);
}

void draw() {
frameRate(20);
 
  background(#5d7623);
  fill(#5e4026);
  rect(width-200, 0, 200, height);// mud patch
  blood1.display();//show blood
  blood2.display();
  blood3.display();
  blood4.display();

  blood1.move();//allow blood to trail
  blood2.move();
  blood3.move();
  blood4.move();

  move1.display();//show ants
  move2.display();
  move3.display();
  move4.display();

  move1.move();//move ants
  move2.move();
  move3.move();
  move4.move();
}
void mousePressed() {//restart
  move1.reset();
  move2.reset();
  move3.reset();
  move4.reset();
  loop();
}

void keyPressed() {//pause
  if (key=='a') {
    noLoop();
  }
} 

void keyReleased() {//resume
  loop();
}

class Movers {//ants
  float x, y;
  float speed;
  float accel;
  int diam= 10; 
  float xpos;
  float i;
  float wiggle;

  Movers(float x_, float y_, float accel_) {
    x=x_;
    y=y_;
    speed=0;
    accel=accel_;

  }

  void display() {




    ellipseMode(CORNER);
    rectMode(CORNER);

    //thumb
    noStroke();

    fill(#E0AB98);
    rect((x+95), (y-30), diam+110, diam +90, 50);//flesh bottom

    fill(#e1b497);
    rect((x+95), (y-25), diam+120, diam+70, 50);//flesh top
    fill (#edc5bb);
    rect((x+150), (y-30), 90, 80, 50); //thumb nail
    fill (255, 50);
    ellipse((x+150), (y-20), 30, 65);//white nail
    stroke(0, 30);
    strokeWeight(1.5);
    fill(#a41e1d);
    ellipse((x+96), y-17, 23, 70);//blood circle
    noStroke();


    fill(#e1b497);
    ellipse((x+110), y-15, 20, 40);//thumb perspective
    //ant

    stroke(150);
    strokeWeight(.1);
    fill(#383235);
    ellipse (x, y+2, diam+20, diam+7);//butt
    fill(#a55013, 120);
    ellipse ((x+5), y, diam+10, diam+10);//butt
    fill(#383235, 150);
    noStroke();
    rect((x+20), y+1, diam, diam+8);
    ellipse ((x+10), y, diam+10, diam+10);//butt
    fill(#352223);
    ellipse ((x+30), y+6, diam/2, diam/2);//neck
    fill(#452724);
    ellipse ((x+35), y+4, diam/1.2, diam/1.2); //mid
    ellipse((x+42), y+2, diam, diam);//hip
    fill(#352223);
    ellipse((x+52), y+2, diam+7, diam+2);//hip
    fill(#a55013, 100);
    ellipse((x+57), y+1, diam, diam+2.2);//hip
    fill(#8c4d2f);
    rect((x+69), y+5, diam/3, diam/2, 5);
    fill(#743c14);
    rect((x+72), y, diam+12, diam+7, 15);//head


    //legs
    stroke(255);
    strokeWeight(.1);
    noStroke();
    quad((x+37), (y+13), (x+42), (y+13), (x+40), (y+16), (x+38), (y+16));// right back
    strokeWeight(1.5);
    stroke(#784845);
    line ((x+37), (y+17), (x+35), (y+25));
    stroke(#a98767);
    line((x+35), (y+25), (x+25), (y+37)); 
    strokeWeight(.5);
    stroke(#e8d8a6);
    line((x+25), (y+37), (x-5+wiggle), (y+50+ wiggle)); 

    strokeWeight(.1);
    noStroke();
    quad((x+43), (y+12), (x+47), (y+12), (x+48), (y+15), (x+45), (y+15));//right mid
    strokeWeight(1.5);
    stroke(#784845);
    line ((x+48), (y+16), (x+55), (y+25));
    stroke(#a98767);
    line((x+55), (y+25), (x+45), (y+37)); 
    strokeWeight(.5);
    stroke(#e8d8a6);
    line((x+45), (y+37), (x+47+wiggle), (y+50+wiggle)); 

    strokeWeight(.1);
    noStroke();
    quad((x+50), (y+12), (x+56), (y+12), (x+55), (y+17), (x+53), (y+17));//right front
    strokeWeight(1.5);
    stroke(#784845);
    line ((x+55), (y+17), (x+70), (y+25));
    stroke(#a98767);
    line((x+70), (y+25), (x+74), (y+35)); 
    strokeWeight(.5);
    stroke(#e8d8a6);
    line((x+74), (y+35), (x+82+wiggle), (y+50+wiggle)); 


    strokeWeight(.1);
    noStroke();
    quad((x+37), (y+2), (x+42), (y+2), (x+40), (y-1), (x+38), (y-1));// left back
    strokeWeight(1.5);
    stroke(#784845);
    line ((x+39), (y-2), (x+35), (y-10));
    stroke(#a98767);
    line((x+35), (y-10), (x+25), (y-18)); 
    strokeWeight(.5);
    stroke(#e8d8a6);
    line((x+25), (y-18), (x-5+wiggle), (y-31+wiggle)); 


    strokeWeight(.1);
    noStroke();
    quad((x+43), (y+2), (x+47), (y+2), (x+48), (y-1), (x+45), (y-1));//left mid
    strokeWeight(1.5);
    stroke(#784845);
    line ((x+48), (y-2), (x+55), (y-10));
    stroke(#a98767);
    line((x+55), (y-10), (x+45), (y-18)); 
    strokeWeight(.5);
    stroke(#e8d8a6);
    line((x+45), (y-18), (x+47+wiggle), (y-37+wiggle)); 

    strokeWeight(.1);
    noStroke();
    quad((x+52), (y+2), (x+56), (y+1), (x+55), (y-2), (x+53), (y-2));//left front
    strokeWeight(1.5);
    stroke(#784845);
    line ((x+55), (y-2), (x+70), (y-10));
    stroke(#a98767);
    line((x+70), (y-10), (x+74), (y-18)); 
    strokeWeight(.5);
    stroke(#e8d8a6);
    line((x+74), (y-18), (x+82+wiggle), (y-37+wiggle)); 

    //antenna
    strokeWeight(1.5);//left
    stroke(#a35b4a);
    line((x+89), (y+4), (x+70), (y-22)); 
    strokeWeight(.5);
    stroke(#b98986);
    line((x+70), (y-22), (x+92), (y-30)); 
    fill(#ae6837);
    ellipse((x+87), (y-28), diam, diam/3);
    fill(#774635, 100);
    ellipse((x+92), (y-30), diam+5, diam/2);

    strokeWeight(1.5);//right
    stroke(#a35b4a);
    line((x+89), (y+14), (x+91), (y+32)); 
    strokeWeight(.5);
    stroke(#b98986);
    line((x+91), (y+32), (x+120), (y+34)); 
    fill(#ae6837);
    ellipse((x+120), (y+34), diam, diam/3);
    fill(#774635, 100);
    ellipse((x+125), (y+34), diam+5, diam/2);

    //mandible
    fill(0);
    noStroke();
    triangle((x+93), (y+1), (x+93), (y+4), (x+100), (y+3));  //left one
    triangle((x+100), (y+3), (x+98), (y+8), (x+101), (y+7));  //left one

    triangle((x+93), (y+13), (x+93), (y+15), (x+100), (y+14));  //right one
    triangle((x+100), (y+14), (x+98), (y+9), (x+101), (y+10));  //right one
  
  }




void reset() {//tied to  mouse
    x=x+accel;
    accel=accel+random(.3); 
    if (mousePressed) {
      loop();
      setup();
    }
  }

 
  void move() {// move ants
    display();
    fill(255);
    

    x+=accel;//speed of anys
    accel=accel+random(.3); 

    wiggle=random(-2,2);//moves legs

    if (x+81>width-200) { // win condition
      x=width;
      fill(255, 180);
      textFont(EccentricStd48, 50);
      text("winner!", width/3, height/2);
      fill(#b71127);
      ellipse(width/3, 250, 15, 10);
      ellipse(width/3.1, 250, 24, 15);
      ellipse(width/3.1, 253, 120, 15);
      ellipse(370, 260, 70, 10);
      ellipse(500, 265, 60, 10);
      ellipse(495, 265, 5, 5);
      ellipse(490, 265, 3, 4);
      ellipse(480, 267, 7, 4);
      ellipse(600, 270, 5, 5);
      ellipse(605, 271, 3, 4);
      ellipse(588, 268, 7, 4);
      noLoop();
    }
  }
}

class Blood{
  float x, y, diam1, diam2, accel,diam, y1, x1;
 Blood (float x_, float y_, float x1_,float y1_){
    x=x_;
    x1=x1_;
    y=y_;
    y1=y1_;
    diam=80;
    diam1=70;
    diam2=40;
    accel=1;
    
  }
  
  void display(){
   fill(#95131d);
     ellipse(x,y,diam1, diam2);
  fill(#95131d);
  ellipse(x1,y1+15,diam, diam2);
  fill(#95131d);
  ellipse(x1,y1+4,diam/1.5, diam2/1.5);
    fill(#95131d);
    ellipse(x1,y1+40,diam/4, diam2/4);

  }
  
  void move(){
    x+=random(.001);
    diam1+=accel;
    accel+=.14;
    
  }}
