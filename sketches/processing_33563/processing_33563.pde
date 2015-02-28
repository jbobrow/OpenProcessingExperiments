
PImage myImage;
PImage myImage2;
int posx;
int posy;
float EyesPosx;
float EyesPosy;
float ballsize;

void setup() {
  size (408, 500);
  background (255);
  smooth();
}

void draw() {
//  frameRate(30);
//  filter(BLUR, 3);
  smooth();
  background(255);
  noStroke();

  //mouse position MAPPING
  EyesPosx = map(mouseX, 0, width, 126, 147);
  EyesPosy = map(mouseY, 0, height, 230, 244);

  //  images
  myImage2 = loadImage("ojo.png");
  image(myImage2, EyesPosx, EyesPosy);

  myImage = loadImage("superman.png");
  image(myImage, 0, 0);


  if (mousePressed == true) {
    tint(random(100,255), 0, 0);
    myImage2 = loadImage("ojo.png");
      
//    noTint();
//    myImage = loadImage("superman.png");


    stroke(255,70,10,random(255));
    strokeWeight(9);
    line(EyesPosx+9, EyesPosy+8, mouseX-5, mouseY);
    line(EyesPosx+147, EyesPosy+8, mouseX+5, mouseY);
    
    noStroke();
    fill(255,70,10,random(150,255));
    
    ballsize = random(20,70);
    
    ellipse(mouseX,mouseY, ballsize, ballsize);
    
  }

  if (mousePressed == false){
  noTint();
  }
}


