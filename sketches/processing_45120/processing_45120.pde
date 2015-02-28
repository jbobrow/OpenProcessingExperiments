
float a = 0;
float b = 600;
float c = 800;
float d = 600;
float mili, seconds, minutes;
float vx4 = .05;
float vy4 = .88;
float vy5 = .9;
float vx5 = 2;
float vx3 = 1;
float vy3 = 1;
float vy2 = 3;
float vx2 = 1;
float vy = 0;
float vx = 2; //2 pixels per frame on x axis
float x4 = 600;
float y4 =0;
float y5 = 100;
float x5 = 800;
float x3 = -30;
float y3 = 0;
float x2 = 0;
float y2 = 100;
float x = 10;
float y = 200;
float frictionx4 = -.06;
float frictiony4 = -.6;
float frictionx5 = 1;
float frictiony5 = -.9;
float frictionx3 = 1;
float frictiony3 = -.9;
float frictionx2 = .08;
float frictiony2 = -.7;
float frictiony = -.6;
float frictionx = .998; //could become the wind variable
float gravity4 = .6;
float gravity5 = .7;
float gravity3 = .5;
float gravity2 = .5;
float gravity = .04;
int bcol = color(102,183,132,30);
void setup(){
  size (800,600);
  smooth();
    background(95,178,77,30);
}

void draw(){
  mili = millis();
  seconds = mili/1000;
  minutes = mili/60000;
 int col3 = color(37,94,103,110);
 int col2 = color(49,167,62,130);
 int col = color(255,255,255,100);
   background(40,40,50,30);
   
//line to make interactive ball change color, but I can't seem to make it work!!! NOOO
line(0,600,800,600);
    
//in comining
{if (seconds > 5){
  vy4 += gravity4; 
  vx4 += frictionx4; 
  x4+=vx4;
  y4+=vy4;

  if(y4>=height){
    y4 = height;
    vy4*=frictiony4;
  }
  if(x4>=width){
   // x4 = width;
    vx4+=frictiony4;
  }
   fill(9,167,255,70);
  ellipse(x4,y4,50,50);
}

if(seconds > 10){
 vy5 += gravity5; 
  vx5 *= frictionx5; 
  x5+=vx5;
  y5+=vy5;

  if(y5>height){
    y5 = height;
    vy5*=frictiony5;
  }
  if(x5> width){
    x5 = width;
    vx5*=frictiony5;
  }
  fill(181,93,188,70);
  ellipse(x5,y5,70,70);
   }

  vy += gravity; //vy = vy + gravity, adds the downward force
  vx *= frictionx; //vx = vx *frictionx
  x+=vx;
  y+=vy;

  if(y>height){
    y = height;
    vy*=frictiony;
  }
  if(x> width){
    x = width;
    vx*=frictiony;
  }
  fill(40,200,100,70);
  bob(x,y);
  
  //to make the ball come in after 5 seconds
{if (seconds > 5){
  vy2 += gravity2;
  vx2 += frictionx2; 
  x2+=vx2;
  y2+=vy2;

  if(y2>height){
    y2 = height;
    vy2*=frictiony2;
  }
  if(x2> width){
    x2 = width;
    vx2*=frictiony2;
  }
  fill(219,2,28,70);
  redEll(x2,y2);
  }
}
  
//to make ball come in after 15
{if (seconds > 15){
    vy3 += gravity3; 
  vx3 += frictionx3; 
  x3+=vx3;
  y3+=vy3;

  if(y3>height){
    y3 = height;
    vy3*=frictiony3;
  }
  if(x3> width){
    x3 = width;
    vx3*=frictiony3;
  
  }
   fill(255,157,28,100);
   GO(x3,y3);
  }
}

//if one hits the interactive ball, Why won't you work you?
    //line action thing
if (dist(x,y,a,b,c,d)<20){
  fill(col3);
  bob(x,y);
 }
 if( dist(x,y,x4,y4) < 100){
   fill(100,23,219,50);
   rect(90,90,420,200);
 }
 if (dist(x,y,x2,y2) <80){
   fill(col);
   redEll(x2,y2);
 }
 if (dist (x,y,x5,y5) <150){
   fill(234,234,45,160);
   ellipse(550,300,200,200);
   {
     fill(0);
   ellipse(520,280,20,20);
   ellipse(580,280,20,20);
   }
   noFill();
   beginShape();
   vertex(500,300);
   bezierVertex(500,350, 600,350, 600,300);
   endShape();
 }
 
 if( dist(x,y,x3,y3)>150){
   fill(col2);
   GO(x3,y3);
 } 
 
 if(dist (x,y,x3,y3) <80){
   background(bcol);
    }
  }
}

//mouse and key stuff
void mousePressed(){
  vy -=2;
}
void keyPressed(){
if (key == CODED) {
    if (keyCode == LEFT) {
      vx -= 1;
    } else if (keyCode == RIGHT) {
      vx+=1;
    } 
    else if (keyCode == DOWN) {
      vy +=.5;
    }
  }
}

//red ellipse
void redEll(float x2, float y2){ 
  ellipse(x2,y2,30,30);  
}

//green to orange
void GO(float x3, float y3){
  ellipse(x3,y3,50,50);
}

//line function
void LI (float a, float b, float c, float d){
line(a,b,c,d);
}

//interactive ball
void bob (float x, float y){
ellipse(x,y,40,40);
}


