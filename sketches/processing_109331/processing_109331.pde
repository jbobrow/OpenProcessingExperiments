
int counter = 0;

float randomcolor = random(150);//for changing background color
float eyewidth = random(20,40);//for eyes size
float eyelong = random(50,90);
float eyeleftX = random(180,280);//for left eye movement
float eyerightX = random(430,510);//for right eye movement

float randommove = random(290,330);//for movement of red brush on face
float headwidth = random(530,570);//change the width of head


void setup()
{
  size(700, 550);

}

void draw()
{


  background(randomcolor);
  //noStroke();
  
  strokeWeight(5); 
  stroke(0);
  //ears of the bear
  fill(#765B31);
  ellipse(190,170,250,250);
  fill(#765B31);
  ellipse(520,170,250,250);
  
  //head of the bear
  fill(#765B31);
  ellipse(350,300,headwidth,400);
  
  //white nose part
  fill(#F0E6D7);
  ellipse(350,340,280,170);
  
  //eyes and nose
  fill(0);
  ellipse(350,310,70,70);//nose
  //eyes
  ellipse(eyeleftX,220,eyewidth,eyelong);
  ellipse(eyerightX,220,eyewidth,eyelong);
  
  //month part
  ellipse(350,350,20,20);
  ellipse(350,355,20,20);
  ellipse(350,360,20,20);
  ellipse(350,365,20,20);
  ellipse(350,370,20,20);
  ellipse(350,375,20,20);
  ellipse(354,380,20,20);
  ellipse(358,385,20,20);
  ellipse(362,390,20,20);
  ellipse(366,395,20,20);
  ellipse(370,400,20,20);
  ellipse(346,380,20,20);
  ellipse(342,385,20,20);
  ellipse(338,390,20,20);
  ellipse(334,395,20,20);
  ellipse(330,400,20,20);
  
  //red face
  
  fill(#CE4B7D);
  ellipse(150,randommove,120,50);
  ellipse(550,randommove,120,50);
  
  
  
  
  
  
  
  }
  
  
  
  
  
  



  
  




