
void setup(){
  size(500,500);
  background(25,30,200);
  frameRate(10);
  
}

float x =50;
float y = 50;

float leftX = 100;
float leftY = 100;
float rightX = 400;
float rightY = 400;
float t = 0. ;


void draw(){
  
 
  
  fill(255,50);
  strokeWeight(4);
  rect(0,0,500,500);


  moveShapes();
  moveShapes();
  moveShapes();
 
}

void moveShapes(){
  x=random(300);
  y=random(500);




  fill(40,30,200);

  strokeWeight(2);
  text("Bobobo-Bo Bo-BoBo",x=340,y-1);
  textSize(15);
 
 
 fill(255,200,0);
  ellipse(200,200,250,250);//hair
  fill(#E3B740);
  rect(140,260,30,30);//right ear
  rect(230,260,30,30);//left ear
  ellipse(200,300,100,200);//head
  noStroke();
  fill(255,200,0);
  rect(150,150,100,80);//front hair
  fill(0);
  rect(155,235,30,5);//right eyebrow
  rect(215,235,30,5); //left eyebrow
  stroke(255);
  strokeWeight(3);
  fill(100,0,255);
  rect(150,250,50,20);//right glasses
  rect(200,250,50,20);//left glasses
  stroke(5);
  fill(#E3B740);
  rect(170,300,60,30);//the nose
  fill(0);
  ellipse(190,320,5,5);//nose1
  ellipse(210,320,5,5);//nose2
  fill(0);
  ellipse(200,350,20,random(30));//mouth
  
  fill(255);
  ellipse(115,100,200,100);
  fill(0);
  strokeWeight(2);
  text("FIST OF THE NOSE HAIR!",30,100);
    
    noFill();
  
  strokeWeight(3);

  bezier(-50,150,leftX,leftY,rightX,rightY,190,320);//right nosehair
  bezier(550,150,leftX,leftY,rightX,rightY,210,320);//left nosehair
  leftX=map(noise(t-10), 0., 1., 0.,-10);
  leftY=map(noise(t+0.1), 0., 1., -500.,1000);
  rightX=map(noise(t+0.2), 0., 1., -500.,1000);
  rightY=map(noise(t+0.1), 0., 1., -500.,1000);
  t++;
  
}



