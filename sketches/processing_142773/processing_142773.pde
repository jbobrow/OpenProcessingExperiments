
// moving robot
// sexy man octopus

// variables for moving back and forth
int radius = 40;
float x = 110;
float speed = 10;
int direction = 1;

void setup () {
  size(800,400);
  rectMode(CENTER);
}

void draw() {
  background(113,209,242);
  frameRate(20);
  println(frameRate);

  PFont font;
  font = loadFont("Affection-LDR-48.vlw");
  textFont(font);
  textAlign(CENTER);
  
  x += speed * direction;
  if ((x > width-radius) || (x < radius)) {
    direction = -direction;
  }
  
  //moving right - happy
  if (direction ==1) {
    // text  
    fill(0);
    String happy = "I'm sexy and I know it!";
    textSize(40);
    text(happy,x,50);
  
    // tentacles
    float R = random(0,1);
    float a = map(R,0,1,200,220);
    float b = map(R,0,1,240,280);
    float c = map(R,0,1,290,340);
    float d = map(R,0,1,350,410);
    noFill();
    strokeWeight(10);
    stroke(201,68,250);
    bezier(x-80,170,x-80,170,x-100,a,x-100,170);
    bezier(x+80,170,x+80,170,x+100,a,x+100,170);
    bezier(x-50,200,x-50,200,x-130,b,x-130,200);
    bezier(x+50,200,x+50,200,x+130,b,x+130,200);
    bezier(x-30,230,x-30,230,x-160,c,x-160,230);
    bezier(x+30,230,x+30,230,x+160,c,x+160,230);
    bezier(x-10,260,x-10,260,x-180,d,x-180,260);
    bezier(x+10,260,x+10,260,x+180,d,x+180,260);
    
    // head
    fill(201,68,250);
    noStroke();
    rect(x,100,50,50);
    
    // body
    triangle(x-75,140,x+75,140,x,250);
    
    // mouth
    fill(113,209,242);
    triangle(x-20,105,x+20,105,x,115);
    
  } 
  
  //moving left - angry
  else {
    // text
    fill(0);
    String angry = "Who're you calling purple?";
    textSize(40);
    text(angry,x,50);
  
    // tentacles
    float R = random(0,1);
    float a = map(R,0,1,160,180);
    float b = map(R,0,1,180,200);
    float c = map(R,0,1,200,220);
    float d = map(R,0,1,220,240);
    noFill();
    strokeWeight(10);
    stroke(201,68,250);
    bezier(x-80,210,x-80,210,x-100,a,x-100,210);
    bezier(x+80,210,x+80,210,x+100,a,x+100,210);
    bezier(x-50,240,x-50,240,x-130,b,x-130,240);
    bezier(x+50,240,x+50,240,x+130,b,x+130,240);
    bezier(x-30,270,x-30,270,x-160,c,x-160,270);
    bezier(x+30,270,x+30,270,x+160,c,x+160,270);
    bezier(x-10,300,x-10,300,x-180,d,x-180,300);
    bezier(x+10,300,x+10,300,x+180,d,x+180,300);
    
    // body
    fill(201,68,250);
    noStroke();
    triangle(x-75,180,x+75,180,x,290);
    
    // head (purple on top of blue)
    fill(113,209,242);
    rect(x,180,70,70);
    fill(201,68,250);
    rect(x,180,50,50);
    
    // mouth
    fill(0);
    rect(x,190,40,10);
    
  }
}


