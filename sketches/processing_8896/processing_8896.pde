
// MX-MONSI
void setup() {
  size (600,400);
  background(#f0f0f0);
  smooth();
  frameRate(16);
}

int c;

void draw() {

  fill(#f0f0f0,130);
  noStroke();
  rect(0,0,width,height);
  float d = 200;
  float x =  mouseX;
  float y =  mouseY;
  float l = random(150,200);
  

  
  if (!mousePressed) {
    
    
    
    pushMatrix();
    
       pushStyle();
       
       fill((random(100,200)),random(100,200),random(100,200));
       translate(x, y);
       noStroke();
       for (int i = 0; i < 10; i++) {
          ellipse(random(-50,50),random(-50,50), l,l);
       }
       popStyle();
    popMatrix();
    
    ellipse(x,y, d,d);
    fill(#ffffff);
    ellipse(x,y, d/2,d/2);
    
    stroke(0);
    line(x-20,y-10,x-30,y);
    line(x+20,y-10,x+30,y);
    
    line(x-10,y,x-20,y-10);
    line(x+10,y,x+20,y-10);
    
    noStroke();
    fill(0);
    ellipse(x,y+40, 20,5);
    
    translate( x,y );

    // ratation point
     rotate( radians(c));     
     fill(255);
     ellipse( width/random(4,6), height/random(4,8),20,20);  
     c +=15;

    
    
    
  } else {
    
    pushMatrix();
    translate(x, y);

       scale( 2);
       pushStyle();
       fill((random(100,200)),random(100,200),random(100,200));
       
       noStroke();
       for (int i = 0; i < 10; i++) {
          
          ellipse(random(-60,60),random(-60,60), l,l);
       }
     
    popStyle();
    popMatrix();
    
    stroke(0);
    line(x-20,y,x-30,y-10);
    line(x+20,y,x+30,y-10);
    line(x-20,y-10,x-30,y);
    line(x+20,y-10,x+30,y);
    
    noStroke();
    fill(255);
    rect(x-20,y+30,40,10);
  }    
}


