
int x,y;
float xIntheBox;
Float yIntheBox;
int x_eye;
int y_eye;
int z;


void setup(){
  
  size(640,520);
  println("setup done!");
  frameRate(60);
}

void draw(){

  background(255,253,173);
  rectMode(CENTER);
    stroke(68,216,206);
    fill(68,216,206);
  ellipse(320,240,300,200); //body
    
    stroke(162,22,43);
    fill(162,22,43);
  ellipse(320,300,15,20); //mouth
    stroke(55,59,59);
    fill(55,59,59);
  ellipse(210,355,165,60); //feet
  ellipse(210+220,355,165,60); //feet
    stroke(174,240,235);
    fill(174,240,235);
  ellipse(145,250,50,50);
  ellipse(495,250,50,50); //hands
  stroke(255,255,255);
    fill(255,255,255);
  ellipse(320-52,220,100,100);
  ellipse(320+52,220,100,100); //outer eyes
    stroke(16,15,16);
    fill(16,15,16);
    
    x = mouseX;
    y = mouseY;
    x_eye = 250;
    y_eye= 180;
    z = 100;

  xIntheBox = map(x, -70, 240, x_eye, x_eye+22); 
  yIntheBox = map(y, -80, 240, y_eye, y_eye+40);
  
ellipse(xIntheBox, yIntheBox, 30,30);
ellipse(xIntheBox+z,yIntheBox, 30,30);//inner eyes
}

