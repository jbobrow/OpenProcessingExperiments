
float x,y,dX,dY;
PImage guy1;
float easing;

void setup (){
  size(600,600);
  guy1= loadImage ("dancing.png");
  fill(HSB);
  stroke(0);
  strokeWeight(.5);
  x=0;
  y=0;
  easing= .05;
}


  void draw(){
    fill(0,10);
    rect(0,0,width,height);

dX = mouseX - x;
dY = mouseY - y;

x= x + dX*easing;
y= y + dY*easing;

image(guy1,x,y);

  }
  
void mousePressed(){
    fill(255,0,0);
  }
  
  //turns to WHITE
  void mouseReleased(){
    fill(255);
  }
  
  //RAINBOW
  void mouseDragged(){
  
    fill(random(255),random(255),random(255));

rect(100,100,100,100);
ellipse(x,y,20,20);
ellipse(x,y,40,40);


rect(100,0,100,100);
rect(200,0,100,100);
rect(300,0,100,100);
rect(400,0,100,100);
rect(500,0,100,100);
rect(600,0,100,100);

rect(0,600,100,100);
rect(100,600,100,100);
rect(200,600,100,100);
rect(300,600,100,100);
rect(400,600,100,100);
rect(500,600,100,100);
rect(600,600,100,100);



rect(400,100,100,100);

rect(250,250,100,100);
rect(100,400,100,100);
rect(400,400,100,100);

rect(0,500,100,100);
rect(100,500,100,100);
rect(200,500,100,100);
rect(300,500,100,100);
rect(400,500,100,100);
rect(500,500,100,100);
rect(600,500,100,100);


rect(0,0,100,100);

rect(0,100,100,100);

rect(0,200,100,100);
rect(0,300,100,100);
rect(0,400,100,100);
rect(0,500,100,100);
rect(0,600,100,100);


rect(500,600,100,100);

rect(500,500,100,100);

rect(500,400,100,100);

rect(500,300,100,100);

rect(500,200,100,100);

rect(500,100,100,100);

rect(500,0,100,100);




  float weight = dist(mouseX, mouseY, pmouseX, pmouseY);
  strokeWeight(weight);
  ellipse(mouseX, mouseY, 60, 60);


  }



