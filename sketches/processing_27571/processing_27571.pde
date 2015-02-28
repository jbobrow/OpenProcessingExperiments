
//screensaver1
color myColor= color(255,255,255,255);
int x=100;
int y=120;
int speedX=5;
int speedY=4;
//screensaver2
int mode =1;
//screensaver3
int x5=100;
int y5=120;
int speedX5=2;
int speedY5=1;
int x2=200;
int y2=300;
int speedx2 = 4;
int speedy2=6;
int x3=400;
int y3=400;
int speedx3 = 3;
int speedy3=2;
int x4=250;
int y4=400;
int speedx4 = 2;
int speedy4=5;
//screensaver4
float x6 = 250.0;
float angle = 0.0;
float angle2 = 0.0;
float y6 =250.0;
float angle3 = 0.0;
float angle4 = 0.0;


void setup() {
  smooth();
  noStroke();
  size(500,500);
  background (255);
  mode = 2;
  if (mode ==2){
    background (0);
  }
}
void draw() {
  println(mode);
  //screensaver1
  if (keyPressed == true) {
    if(key == '1') {
      mode = 1;
    }
    if(key == '2') {
      mode = 2;
    }
    if(key == '3') {
      mode = 3;
    }
    if(key == '4') {
      mode = 4;
    }
  }
  if(mode ==1) {
    frameRate(30);
    strokeWeight(2);
    if (keyPressed == true) {
      if(key == 'b') {
        myColor = color(93,194,255,50);
      }
      else if (key == 'p') {
        myColor = color(255,82,149,50);
      }
      else if (key == 'y') {
        myColor = color(255,250,90,50);
      }
      else if (key == 'g') {
        myColor = color (111,255,136,50);
      }
    }


    stroke(myColor);
    line(mouseX,mouseY,x/2,y/4);
    x+=speedX;
    y+=speedY;
    if (x>=width*2 ||x<=25) {
      speedX*=-1;
    }
    if(y>=height*2 || y<=25) {
      speedY*=-1;
    }
    if(keyPressed) {
      if (key == 'c') {
        background (255);
      }
    }
  }
  //screensaver2
  else if (mode == 2) {
    strokeWeight(random(0,20));
    noFill();
    stroke((random (100,255)),(random (70,255)),(random (200,255)), (random(30,100)));
    frameRate(5);
    bezier(250,250,random(255),random(255),random(255),random(255),0,0);

    strokeWeight(random(0,20));
    noFill();
    stroke((random (100,255)),(random (70,255)),(random (200,255)), (random(30,100)));
    bezier(250,250,random(255),random(255),random(255),random(255),250,250);

    strokeWeight(random(0,20));
    noFill();
    stroke((random (100,255)),(random (70,255)),(random (200,255)),(random(30,100)));
    bezier(250,250,random(255),random(255),random(255),random(255),0,500);

    strokeWeight(random(0,20));
    noFill();
    stroke((random (100,255)),(random (70,255)),(random (200,255)),(random(30,100)));
    bezier(250,250,random(255),random(255),random(255),random(255),500,500);

    strokeWeight(random(0,20));
    noFill();
    stroke((random (100,255)),(random (70,255)),(random (200,255)),(random(30,100)));
    bezier(250,250,random(255),random(255),random(255),random(255),500,0);
    if (key == 'c') {
        background (255);
      }
  }
  //screensaver 3
  if(mode ==3) {
    frameRate(50);
    fill(255,10);
    stroke(1);
    rect(0,0, width,height);
    fill(11,182,227,25);
    ellipse(x5,y5,50,50);
    x5+=speedX5;
    y5+=speedY5;
    if (x5>=width-25 ||x5<=25) {
      speedX5*=-1;
    }
    if(y5>=height-25 || y5<=25) {
      speedY5*=-1;
    }
    noStroke();
    fill(247,52,150,25);
    ellipse(x2,y2,75,75);
    x2+=speedx2;
    y2+=speedy2;
    if (x2>=width-25 ||x2<=25) {
      speedx2*=-1;
    }
    if(y2>=height-25 || y2<=25) {
      speedy2*=-1;
    } 
    stroke(.5);
    fill (255,250,90,50);
    ellipse(x3,y3,30,30);
    x3+=speedx3;
    y3+=speedy3;
    if (x3>=width-25 ||x3<=25) {
      speedx3*=-1;
    }
    if(y3>=height-25 || y3<=25) {
      speedy3*=-1;
    } 
    noStroke();
    fill(111,255,136,50);
    ellipse(x4,y4,60,60);
    x4+=speedx4;
    y4+=speedy4;
    if (x4>=width-25 ||x4<=25) {
      speedx4*=-1;
    }
    if(y4>=height-25 || y4<=25) {
      speedy4*=-1;
    }
    if (key == 'c') {
        background (255);
      }
  }
  //screensaver4
  if(mode ==4){
    
frameRate(30);
stroke(.5);
pushMatrix();
translate( x6, 250);
rotate ( angle);
fill(239,255,124,30);
ellipse (50, 0, 20, 40);
pushMatrix();
rotate( angle2);
fill(124,230,255);
ellipse (100, 0, 10, 10);
popMatrix();
x6 = x6 + 1;
angle = angle + 0.1;
angle2= angle2 + 0.1;
if (x6 > 500)
{
x6 = 0;
}
popMatrix();
translate( 250,y6);
rotate ( angle3);
fill(124,230,255,30);
ellipse (50, 0, 20, 40);
pushMatrix();
rotate( angle4);
fill(239,255,124);
ellipse (100, 0, 10, 10);
popMatrix();
y6= y6 + 1;
angle3 = angle3 + 0.1;
angle4= angle4 + 0.1;
if (y6 > 500)
{
y6 = 0;
}
 if (key == 'c') {
        background (255);
      }
  }
}

