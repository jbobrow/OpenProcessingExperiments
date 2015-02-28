
int counter;
int x;
int y;
float r;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  //colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  ellipseMode(CENTER);
  noFill();
  
}

void draw(){
    a=random(1,10);
    fill(255,10);
    noStroke();
    rect(0,0,width,height);
    noFill();
    stroke(2);

    x=random(75,225);
    y=random(100,225);
    r=random(0,TWO_PI);
    
    translate(width/2 + random(-10,10),height/2 + random(-10,10));
    rotate(r);
    ellipse(0,0,x,y);
    
    //delay(1);
    
}
