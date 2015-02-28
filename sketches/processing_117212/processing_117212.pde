
Dot c1, c2;
float angle = 2.0;
float offset = 40;
float scalar = 2;
float speed = 1;
int card = 0; 
int textX = 180;
int textY = 330;
int textX2 = 80;
int textY2 = 380;
PFont f; 
PImage img1, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11;
//
float a;
void setup() {
  size(1200, 720);
  f = createFont("Mistral", 40);
  textFont(f);
  noStroke();
  ellipseMode(CENTER);
  img1 = loadImage("grunge.jpg");
img2 = loadImage("heart.png");
img3 = loadImage("4.jpg");
img4 = loadImage("2.jpg");
img5 = loadImage("1.jpg");
img6 = loadImage("summer10.jpg");
img7 = loadImage("summer7.jpg");
img8 = loadImage("summer2.jpg");
img9 = loadImage("5.jpg");
img10 = loadImage("bokeh5.jpg");
img11 = loadImage("5.jpg");
  
  
image(img1,0,0);
noFill();
smooth();
 c1 = new Dot(200,200,100);
 c2 = new Dot(400,200,100);
 

}

void draw() {

  if (card == 0) {
    background(0, 0, 0);
    fill(40);
    image(img1,0,0);
    text("TELL me where is Fancy bred,", textX+100, textY+200);
    
     fill(0,0,0,map(mouseX,0,600,50,0));
//  rect(0,0,600,600);
  noFill();
  stroke(255,0,0, 400-dist(c2.x,c2.y,300,450));
  strokeWeight( abs(map(dist(c2.x,c2.y,300,450),100,200,0.1,1) ));
  line(c2.x,c2.y,300,450);
  stroke(255,0,0, 400-dist(300,450,c1.x,c1.y));
  strokeWeight( abs(map(dist(300,450,c1.x,c1.y),100,200,0.1,1) ));
  line(300,450,c1.x,c1.y);
  c1.move();
  c2.move();

    
    
     
  }  
  else if (card == 1) {  
    fill(200,10,0);
   // background(0);
    image(img10,0,0);
    text("Or in the heart or in the head?", textX+500, textY+100);
    cardTwo();
  } 
  else if (card  == 2) {  
    background(180);
  image(img3,0,0);
    text("HHow begot, how nourished?", textX, textY);
       cardThree();
  }
  else if (card  == 3) { 
    background(150);
    fill(100);
    image(img4,0,0);
    text("   Reply, reply.", textX, textY);
 cardFour();
  }
  else if (card  == 4) {  

    background(100);
    image(img5,0,0);
    fill(random(0,255));
    // draw a small ellipse (10x10) at a random spot on the screen
  ellipse(mouseX, mouseY, 20, 20);
    text("It is engender'd in the eyes,", textX, textY);
  } 
  else if (card  == 5) {  
    background(80);
    image(img6,0,0);
    text("With gazing fed; and Fancy dies", textX, textY);
  } 
  else if (card  == 6) {  
    background(40);
    image(img7,0,0);
    text("In the cradle where it lies.", textX, textY);
  } 
  else if (card == 7) {  
    background(0);
    image(img8,0,0);
    text("   Let us all ring Fancy's knell:", textX, textY);
  }
    else if (card == 8) {  
      image(img9,0,0);
    background(0);
    fill(100);
    image(img11,0,0);
    text("   I'll begin it,--Ding, dong, bell.", textX, textY);
        text("All. Ding, dong, bell.", textX2, textY2);
        
          pushMatrix();
  translate(width/1.5, height/2);
  rotate(angle);
  image(img2, 0, 0);
  popMatrix();  
  
    angle += 0.01;

  }
}


void mousePressed() {  

  if (card == 0) {  
    card = 1;
  } 
  else if (card == 1) {  
    card = 2;
  }
  else if (card == 2) {
    card = 3;
  }
  else if (card == 3) {
    card = 4;
  }  
  else if (card == 4) {
    card = 5;
  }  
  else if (card == 5) {
    card = 6;
  } 
  else if (card == 6) {
    card = 7;
  }
  else if (card == 7) {
    card = 8;
  }
    else if (card == 8) {
    card = 0;
  }
}

void cardOne() {
  
}


void cardTwo() {
float x = offset + cos(angle) * scalar;
float y = offset + sin(angle) * scalar;
ellipse( x+200, y+200, 40, 40);
angle += speed;
scalar += speed;
  
  
  
  
}

void cardThree() {
  float i,x;
for(i=0;i<100;i+=0.1){x=map(i,0,100,-2,2);point(i,50+(sqrt(cos(x))*cos(200*x)+sqrt(abs(x))-0.4)*pow((4-x*x),0.1)*-25);}// #p5 @xuv
}

void cardFour() {
  noFill();stroke(#ff00ff);int a=millis()/30;bezier(0,0,0,a*7,0,mouseY,a*7,0);

}

void cardFive() {
  

  }





class Dot {
  float x,y,CX,CY,angle,speed,r;
   
  Dot(float posX, float posY, float rad) {
    CX = posX;
    CY = posY;
    r = rad;
    reset();
 }
  void move() {
    x= r*cos(radians(angle)) + CX;
    y= r*sin(radians(angle)) + CY;
    angle+=speed;
}
  void reset() {
    speed = random(-2,2);
    if (speed<=0) {speed--;} else {speed++;}
    angle = random(360);
  }
   
   
}

void keyPressed() {
 if (key == 'r') { background(0); c1.reset(); c2.reset();  }
}



