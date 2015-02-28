
Planet mercury;
Planet venus;
Planet earth;
Planet mars;
Planet jupiter;
Planet saturn;
Planet neptune;
Planet uranus;
Planet pluto;


void setup(){
  size(600,600);
  mercury = new Planet(340,260,0.5,0.5,5,5);
  venus = new Planet(353,250,.65,.65,5,5);
  earth = new Planet(363,240,.77,.77,5,5);
  mars = new Planet(373,230,.88,.88,5,5);
  jupiter = new Planet(383,220,.99,.99,5,5);
  saturn = new Planet(393,210,1.11,1.11,5,5);
  neptune = new Planet(403,200,1.22,1.22,5,5);
  uranus = new Planet(413,190,1.33,1.33,5,5);
  pluto = new Planet(423,180,1.44,1.44,5,5);
  frameRate(100000000);
}

void draw(){
  background(0);
  fill(255,255,51);
  ellipse(300,300,25,25);
  fill(96,96,96);
  mercury.display();
  mercury.move();
  fill(204,102,0);
  venus.display();
  venus.move();
  fill(0,0,255);
  earth.display();
  earth.move();
  fill(255,0,0);
  mars.display();
  mars.move();
  fill(255,178,102);
  jupiter.display();
  jupiter.move();
  fill(255,229,204);
  saturn.display();
  saturn.move();
  fill(153,51,255);
  neptune.display();
  neptune.move();
  fill(192,192,192);
  uranus.display();
  uranus.move();
  fill(102,178,255);
  pluto.display();
  pluto.move();
}

// *********************************************************************************

class Planet{
 
  float xPos;
  float yPos; 
  float e_width;
  float e_height;
  float p_width;
  float p_height;
  float a=45;
  
  Planet(float temp_xPos, float temp_yPos, float temp_e_width, float temp_e_height, float temp_p_width, float temp_p_height){
   xPos = temp_xPos;
   yPos = temp_yPos;
   e_width = temp_e_width;
   e_height = temp_e_height;
   p_width = temp_p_width;
   p_height = temp_p_height;
  }
  
  void display(){
    ellipse(xPos,yPos,p_width,p_height); 
  }
  
  void move(){
   a = a + .5;
  
  float xChange = cos(radians(a));
  float yChange = sin(radians(a));
  
  xPos += xChange*e_width;
  yPos += yChange*e_height;
  }
  
}


