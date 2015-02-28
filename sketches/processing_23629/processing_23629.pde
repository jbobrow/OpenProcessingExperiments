
int x = 150;
int y = 150;
int eyeSize = 20;

//changing colour for head
//float colour1 = 0,255,200;
//float colour2 = 200,100,0;
//float colour3 = 200,255,0;
//float colour4 = 255,255,255;

void setup() {
  size(600,600);
  background(0);
  smooth();
}

void draw() {
  x=mouseX;
  y=mouseY;
  noStroke();
  fill(250,0,200);
  ellipseMode(CENTER);
  ellipse(x,y,250,250);//head 
  //fill(0,255,200);
  //head to change colour every time it hits a side
  //fill(colour1,colour2,colour3,colour4);

  
  if (mouseX < width/3) {
  fill(250,100,0);
} else if (mouseX < 2*width/3) {
  fill (200,0,50);
} else {
  fill (0,255,200);
}
  ellipse(x,y,220,220);//head
  //if(mouseX = 0) (
  //colour1 = colour1 +1;
  rectMode(CENTER);
  fill(250,0,200);
  //rect(150,280,100,40);
  rect(x,y+130,100,40);//neck
  //triangle(5,150,30,120,30,180);//spike
  triangle(x-145,y,x-120,y-30,x-120,y+30);
  //triangle(270,120,270,180,295,150);//spike
  triangle(x+120,y-30,x+120,y+30,x+145,y);
  //triangle(150,5,120,35,180,35);//spike
  triangle(x,y-145,x-30,y-115,x+30,y-115);
  fill(255,255,0);
  //ellipse(100,140,80,120);//left eye yellow
  ellipse(x-50,y-10,80,120);
  //ellipse(200,140,80,120);//right eye yellow
  ellipse(x+50,y-10,80,120);
  fill(255,0,0,200);
  //ellipse(100,140,60,100);//left eye red
  ellipse(x-50,y-10,60,100);
  //ellipse(200,140,60,100);//right eye right
  ellipse(x+50,y-10,60,100);
  fill(255);
  //ellipse(90,125,30,50);//left eye white
  ellipse(x-60,y-25,30,50);
  //ellipse(190,125,30,50);//right eye white
  ellipse(x+40,y-25,30,50);
  
  fill(0);
  //ellipse(85,120,20,40);//left eye black
  if (mouseX < width/3) {
  ellipse(x-65,y-30,10,30);
   //ellipse(185,120,20,40);//right eye black
  ellipse(x+35,y-30,20,40);
  } else if (mouseX < 2*width/3) {
    ellipse(x-55,y-30,20,40);
    ellipse(x+45,y-30,20,40);
  } else {
    ellipse(x-65,y-20,30,50);
    ellipse(x+35,y-20,30,50);
  }
  fill(0,255,0);
  //rect(150,230,80,20);//mouth
  rect(x,y+80,80,20);
  stroke(0);
  //line(120,230,180,230);//mouth
  line(x-30,y+80,x+30,y+80);
}


