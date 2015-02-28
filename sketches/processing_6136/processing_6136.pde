
int counter = 0;

PImage myimage1;
PImage myimage2;
PImage myimage3;
PImage myimage4;

int x;
int y;

void setup(){
  size(600,450);
  myimage1 = loadImage("naturelab1small.jpg");
  myimage2 = loadImage("naturelab2small.jpg");
  myimage3 = loadImage("naturelab3small.jpg");
  myimage4 = loadImage("naturelab4small.jpg");
}

void draw(){
  background(255);
  
  tint(random(255),random(255),random(255),200);
  image(myimage1, x, y, myimage1.width, myimage1.height);
  
   tint(random(255),random(255),random(255),150);
  image(myimage2, x, y, myimage2.width/1.5, myimage2.height/1.5);
  
   tint(random(255),random(255),random(255),150);
  image(myimage3, mouseX , mouseY, myimage3.width/3, myimage3.height/3);
  
   tint(random(255),random(255),random(255),100);
  image(myimage4, mouseX , mouseY , myimage4.width/5, myimage4.height/5);
}

void mousePressed(){
  save("naturelab"+counter+".jpg");
  counter = counter+1;
}

