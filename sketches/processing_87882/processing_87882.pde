
PImage heads;
PImage tails;
PFont font;
PFont font2;
float chooser=0;

float x, y;
int flip;
void setup() {
  size(400, 400);
  x=100;
  y=100;
  flip=0;
  
 heads=loadImage("heads.jpg");
 tails=loadImage("tails.jpg");
font=createFont("MicrosoftSansSerif-48.vlw",40); 
font2=createFont("MicrosoftSansSerif-48.vlw",20); 
textFont(font);
}

void draw() {
imageMode(CENTER);
textAlign(CENTER);

  background(255);
  fill(0);
  text("Press Any Key to Flip",width/2,100) ;
  textFont(font2);
  text("Scott Belinsky",width-90,height-10);
  strokeWeight(3);
  if (flip==1) {
    flip();
  }
  if (flip==0) {
    if (chooser<=1){
      image(heads,width/2, height/2, x, y);
    }
    if(chooser>1){
      image(tails,width/2, height/2, x, y);
    }
    y=100;
  
  }
}
void keyPressed() {
  chooser=random(2);
  println(chooser);
  flip=flip+1;
  if (flip==2) {
    flip=0;
  }
}

void flip() {
  fill(40,30);
    ellipse(width/2, height/2, x, y);
  y=y-20;
  if (y<=-100) {
    y=y*-1;
  }
}



