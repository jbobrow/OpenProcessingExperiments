
PImage space;
PImage earth;
PImage moon;
PImage sun;
PImage venus;

//float xpos;
//float ypos;

float spin = 0;



void setup()
{
  size(563, 421, P3D);
  space = loadImage("stars.png");
  earth = loadImage("earth.png");
  moon = loadImage("moon2.png");
  sun = loadImage("sun.png");
  venus = loadImage("venus.gif");
  smooth();
}

void draw()
{ 
//  xpos = round(random(0,width));
//  ypos = round(random(200,height));
  spin+=1;
  imageMode(CORNER);
  image(space, 0, 0);


pushMatrix();//the sun
  
  translate(width*.5, height*.5);
  scale(0.5);
  rotate(radians(spin));
  imageMode(CENTER); 
  image(sun, 0, 0);
  
  pushMatrix();//venus
  translate(250,200);
  scale(0.8);
  rotate(radians(spin));
  imageMode(CENTER);
  image(venus,0,0);
  popMatrix();


  pushMatrix();//the earth
  translate(450,0);
  scale(0.4);
  rotate(radians(spin));
  imageMode(CENTER);
  image(earth,0,0);//these cordiates need to be half of what the image is
  
     pushMatrix();//the moon
     translate(200, 200);
     scale(0.4);
     rotate(radians(spin));
     image(moon, 0, 0);
     popMatrix();
  popMatrix();// translte to the center of the sun and then rotate around the bigge cirlce

popMatrix();



//the moon needs to be in a new push pop inside the push pop of th earth
}


