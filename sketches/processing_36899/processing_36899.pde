
//interpolated motion
float xpos;
float ypos;
float xpos1;
float ypos1;
float xpos2;
float ypos2;
float xpos3;
float ypos3;

void setup() {
  size(800, 800);
  xpos=width/2; 
  ypos=width/2 ;
  xpos1=width/2; 
  ypos1=width/2 ;
  xpos2=width/2; 
  ypos2=width/2 ;
  xpos3=width/2; 
  ypos3=width/2 ;
  background(255);
}

void draw() {
 noStroke();
 float amount = 10;

  fill (#FF7E7E, 70);
  float centerX= 200;
  float amplitudex=random(1, amount);
  float amplitudey=random(1, amount);
  float periodx= random(.001, .006);
  float periody=random(.001, .006);



  float amplitudex1=random(1, amount);
  float amplitudey1=random(1, amount);
  float periodx1= random(.001, .006);
  float periody1= random(.001, .006);



  float amplitudex2=random(1, amount);
  float amplitudey2=random(1, amount);
  float periodx2= random(.001, .006);
  float periody2=random(.001, .006);



  float amplitudex3=random(1, amount);
  float amplitudey3=random(1, amount);
  float periodx3= random(.001, .006);
  float periody3=random(.001, .006);

  xpos=centerX+amplitudex*sin(millis()*periodx);
  ypos=centerX+amplitudey*cos(millis()*periody);
  
  //xpos = constrain(xpos, 0, width);

  xpos1=xpos1+amplitudex1*sin(millis()*periodx1);
  ypos1=ypos1+amplitudey1*cos(millis()*periody1);

  xpos2=xpos2+amplitudex2*sin(millis()*periodx2);
  ypos2=ypos2+amplitudey2*cos(millis()*periody2);

  xpos3=xpos3 + amplitudex3*sin(millis()*periodx3);
  ypos3=ypos3 + amplitudey3*cos(millis()*periody3);


  quad(xpos, ypos, xpos1, ypos1, xpos2, ypos2, xpos3, ypos3);
  fill (255,10); 
  rect (0,0, 800,800);
}
