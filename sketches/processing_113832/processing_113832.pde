
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage h;
int counter = 0;



void setup(){
  size(600,1000);
  
  a=loadImage("waterframe01.jpg");
  //imageMode(CENTER);
  b=loadImage("waterframe02.jpg");
  //imageMode(CENTER);
  c=loadImage("waterframe03.jpg");
  //imageMode(CENTER);
  d=loadImage("waterframe04.jpg");
  //imageMode(CENTER);
  e=loadImage("waterframe05.jpg");
  //imageMode(CENTER);
  f=loadImage("waterframe06.jpg");
  //imageMode(CENTER);
  g=loadImage("waterframe07.jpg");
  //imageMode(CENTER);
  h=loadImage("waterframe08.jpg");
  //imageMode(CENTER);
  
  
}

void draw(){
  
  background(0);
  //if(mouseY > 100){ //make the image appear on a condition

  image(a, 0, 0, 600, 800);
  image(b, 0, 0, 600, 800);
  image(c, 0, 0, 600, 800);
  image(d, 0, 0, 600, 800);
  image(e, 0, 0, 600, 800);
  image(f, 0, 0, 600, 800);
  image(g, 0, 0, 600, 800);
  image(h, 0, 0, 600, 800);
  
  
  if (counter == 0)
image(a, 0, 0, 600, 800);

else if (counter == 1)
  image(b, 0, 0, 600, 800);
  
else if (counter == 2)
  image(c, 0, 0, 600, 800);
  
else if(counter == 3)
  image(d, 0, 0, 600, 800);
  
else if (counter == 4)
  image(e, 0, 0, 600, 800);
  
else if (counter == 5)
  image(f, 0, 0, 600, 800);
  
else if(counter == 6)
  image(g, 0, 0, 600, 800);
  
else if(counter == 7)
  image(h, 0, 0, 600, 800);
  
  }

  
void mousePressed(){
  counter++;
  
}




