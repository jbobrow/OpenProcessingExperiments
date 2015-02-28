
PImage orangeflower;
PImage hummingbird1;
PImage hummingbird2;
PImage redflower;
PFont p;
String mytext = "";


void setup(){
  size (700,700);
  //background(0);
  //fill(255);
  smooth();
  stroke(255);
  noLoop();
  
  p = loadFont("AR22.vlw");
textFont(p);

  orangeflower = loadImage("orangeflower.png");
  hummingbird1 = loadImage("hummingbird.jpg");
  hummingbird2 = loadImage("01.png");
  redflower = loadImage("redflower.png");

}

void draw(){
  background(255);
  
  fill(245,121,121);
text(mytext, 48,48);


  for (int i=0; i<2; i++) {
    float r = random(0, 100);
    pushMatrix();
    if(r<30){
      float x = random(orangeflower.width/2, width - orangeflower.width/2);
      float y= random(orangeflower.height/2, height - orangeflower.height/2);
      translate(x, y);
      float angle = random (-90, 90);
      rotate(radians(angle));
      image(orangeflower, -orangeflower.width/2, -orangeflower.height/2);


    }else if(r<60){
      float c = random(redflower.width/2, width - redflower.width/2);
      float d= random(redflower.height/2, height - redflower.height/2);
      translate(c, d);
      float angle = random (-90, 90);
      rotate(radians(angle));
      image(redflower, -redflower.width/2, -redflower.height/2);
      

    }else{
      float a = random(hummingbird2.width/2, width - (hummingbird2.width/2));
      float b= random(hummingbird2.height/2, height - hummingbird2.height/2);
      translate(a, b);
      float angle = random (-90, 90);
      rotate(radians(angle));
      image(hummingbird2, -hummingbird2.width/2, -hummingbird2.height/2);
      
      
      
    }
    popMatrix();
  }
  mytext = "";
}


void mousePressed(){
  redraw ();
}
void keyPressed(){
  mytext = mytext +key;
 


  }










