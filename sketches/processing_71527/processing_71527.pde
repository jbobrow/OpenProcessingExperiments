
//Jeffrey Chen CP1 9/21/12 
// URL: jeffmao.webs.com OR http://www.openprocessing.org/user/21148

/**WASD to move; hold to accelerate
QE to strafe-turn
SPACE to shoot
*/

float px=400.0;//translation/position of craft&starting position of lasers
float py=300.0;
float px1=200;//variables of independent position of lasers
float py1=200;
float rot=PI/2.0;//rotation direction of craft
float rot1=PI/2.0;//independent rotation direction of lasers
float tc=0.0;//var. for acceleration of craft, increase=+accel.
float rotca=80.0;//variables for rotation acceleration of carft, increase=-accel.
float rotcd=80.0;
int ey=1;
boolean shoot=false;
boolean inertia=false;

void setup() {
  size(800, 600);
  smooth();
}

void draw() {
  noStroke();
  background(0);
  int rx = int(random(800));
  int ry = int(random(600));
  fill(255);
  ellipse(rx,ry,5,5);; //space background
  
  translate(px, py);
  rotate(rot);
  craft();                                  //var. for craft
  if (keyPressed==true && key=='a'){//left
    fill(rx/4,rx/18,rx/18);
    triangle(-28,26,-28,35,-40,30);
     fill(rx/4,rx/4-25,rx/18);
     triangle(10,-12,10,-24,24,-18);
    rot=rot-PI/rotca;
    if(rotca>10){
    rotca=rotca-1.1;
    }
  }
  if (keyPressed==true && key=='q'){//strafe-turn left
    px=px+(8)*cos(rot);
    py=py+(8)*sin(rot);
    fill(rx/4,rx/18,rx/18);
    triangle(-28,26,-28,35,-40,30);
    rot=rot-PI/rotca;
        if(rotca>10){
    rotca=rotca-1.1;
    }
  }
  if (keyPressed==true && key=='d') {//right
    fill(rx/4,rx/4-25,rx/18);
    triangle(10,12,10,24,24,18);
    fill(rx/4,rx/18,rx/18);
     triangle(-28,-26,-28,-35,-40,-30);
    rot=rot+PI/rotcd;
    if(rotcd>10.0){
      rotcd=rotcd-1.1;
    }
  }
  if (keyPressed==true && key=='e') {//strafe-turn right
    px=px+(8+tc)*cos(rot);
    py=py+(8+tc)*sin(rot);
    fill(rx/4,rx/18,rx/18);
    triangle(-28,-26,-28,-35,-40,-30);
    rot=rot+PI/rotcd;
        if(rotcd>10){
    rotcd=rotcd-1.1;
    }
    
  }
  if (keyPressed==true && key=='w') {//forward/accelerate
    px=px-(3-tc)*cos(rot);//py,py=position;3=speed;tc=acceleration
    py=py-(3-tc)*sin(rot);//(3-tc)=speed;sin,cos(rot)=direction using rotation
    tc=tc+0.5;//tc+=accel.
    fill(rx/18,rx/18,ry/2);
    triangle(-15,12,-15,-12,-40,0);
    fill(rx/4,rx/18,rx/18);
    triangle(-28,26,-28,35,-40,30);
    triangle(-28,-26,-28,-35,-40,-30);

  }
    
  if (keyPressed==true && key=='s') {//reverse/brake
    fill(rx/4,rx/4-25,rx/18);
    triangle(10,12,10,24,24,18);
    triangle(10,-12,10,-24,24,-18);
    px=px+2*(tc)*cos(rot);//decceleration
    py=py+2*(tc)*sin(rot);
    tc=tc-.3;
  }

  else if (keyPressed==false){
  inertia=true;
  }
  if (inertia){
    in();
  }
  rotate(-rot);
  translate(-px,-py);
  if (keyPressed==true && key==' ') {//shoot, making laser positions &directions stay
    shoot=true;
    px1=px;
    py1=py;
    rot1=rot;
    int px1=200;
    int py1=200;
    float rot1=PI/2.0;
  }
  if (shoot){
    sh();
  }
  if (px<-25){//for craft to appear on other side if goes off screen
    px=width;
  }
  if (px>width+25){
    px=-25;
  }
  if (py<-25){
    py=height;
  }
  if (py>height+25){
    py=-25;
  }
}
void craft(){
  int r=int(random(100));
  int g=int(random(75));
  int b=int(random(75));
  fill(175,20,20);//red
    rect(2,0,15,50);//thorax
  fill(100,230,50);//green
   rectMode(CENTER);
    rect(20, 0, 20,20);//abdomen
    fill(r+150,g+150,b+25);//flashing yellow
    rect(-5,0,20,30);//thruster
    fill(50,100,255);//lightblue
    rect(34, 0, 40, 10);//maincannon
    
    fill(0,50,175);;//blue
    rect(10,30,75, 10);//wingcannons
    rect(10,-30,75,10);
}
void sh() {
  int r=int(random(175));
  int g=int(random(255));
  int b=int(random(50));
  fill (r,g,b);//random color of main laser
  translate(px1,py1);
  rotate(rot1);
  rect(ey+70, 0, 25, 5);
  fill (r/3+200,g/2,b);//wing lasers,random red
  rect(ey+52,30,20,5);
  rect(ey+52,-30,20,5);
  rotate(-rot1);//*reverse rotation and translation keeps position of lasers independent from craft
  translate(-px1,-py1);
  ey=ey+15;//speed of lasers
  if (ey>300){//once lasers travel 300, shoot resets
    shoot=false;
    ey=0;
  }
}
void in(){//inertia
  if(tc>-3){
    px=px+(3+tc)*cos(rot);
    py=py+(3+tc)*sin(rot);
    tc=tc-0.2;//deccelerates
  }
  else if(tc<-3){//prevent reverse
    tc=-3;
  }
  //rotc=80.0;
  if(rotcd<80){
    rot=rot+PI/rotcd;
    rotcd=rotcd+0.5;
  }
  else if(rotcd>40){
    rotcd=80;
  }
  if(rotca<80){
    rot=rot-PI/rotca;
    rotca=rotca+0.5;
  }
  else if(rotca>40){
    rotca=80;
  }
}



