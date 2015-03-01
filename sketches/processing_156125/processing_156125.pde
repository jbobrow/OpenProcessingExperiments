
PImage img;
PImage th;
float a=0.0;
float speed;

PFont font;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;

int count;
int imageNumber;


void setup(){
  size(600,800);
  background(255);
  smooth();
  colorMode(HSB,360,100,100);
  img=loadImage("kiss.png");
  th=loadImage("th.png");
  image(th,0,0);
  
  font = loadFont("SansSerif-48.vlw");
  textFont(font, 20);

  
  background(0);
  
  //fill(255);
 
  textAlign(CENTER);
  img1 = loadImage("1.jpg");
  img2 = loadImage("2.jpg");
  img3 = loadImage("3.jpg");
  img4 = loadImage("4.jpg");
  img5 = loadImage("5.jpg");

  imageMode(CENTER);
}

void draw(){
  
    pushMatrix();
  text("Keeping press your mouse, please", 150, 50);
  popMatrix();
    
    speed=6;
    imageMode(CENTER);
    float time=millis();
    println("time:"+time);

    float scale=map(sin(frameCount/speed),-1,1,0,1.5);
    image(img,width/2,height/2,img.width*scale,img.height*scale);


    if(mousePressed==true){
      int diam_ball=40*mouseX/width+40;
      fill(50,0,100,10);
      rect(0,0,600,800);
      a+=0.5;
      translate(mouseX,mouseY);
      rotate(a);
      fill(random(200),random(250),random(200),random(50));
      for(int x=40;x<=50;x=x+2)
        {
          ellipse(x,x+1,30,30);
        };
     if (count == 0) {
    switch(imageNumber) {
    case 0:
      image(img1, width/2, height/2);
      break;
    case 1:
      image(img2, width/2, height/2);
      break;
    case 2:
      image(img3,width/2,height/2);
      break;
    case 3:
      image(img4,width/2,height/2);
      break;
     case 4:
      image(img5,width/2,height/2);
      break;
      
    
    }
    imageNumber = (imageNumber + 1)%5;
  }
  count = (count + 1)%40;
    }
}




