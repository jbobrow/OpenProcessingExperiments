
PImage myImage;
PImage myImage2;

void setup(){
  size(1000,330
 );
  myImage = loadImage("tumblr_lupt1leOqE1qe9q06o1_500.jpg");
  myImage2 = loadImage("tumblr_luopmsyADq1r08k6po1_500.jpg");
}

void draw(){

  
  fill(20,100,100,40);
  
  line(mouseX,mouseY, 0, 0);
  line(mouseX,mouseY, 0,330);  
  line(mouseX,mouseY, 1000, 0);
  line(mouseX,mouseY, 1000,330);
  
  strokeWeight(.5);
  
  tint(220,184,163,36);
  image(myImage,0,0);
  
  image(myImage2,500,0);
  
 
  
}

