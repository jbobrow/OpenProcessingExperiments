
Sun[] suns = new Sun[30];  //number of suns
 
color c1;
 
void setup(){
  size(500,500);
  colorMode(RGB,width);
   for (int p=0; p<height; p++) {
    for (int g=0; g<width; g++) {
      stroke(height-g, 0, g,200);
      point(p, g);
    }
  }
  
 smooth();
 frameRate(30);
 
 
   for (int i=0; i< suns.length;i++){
  suns[i] = new Sun(c1, random(width), i*2, random(5));
  c1 = color(230,random(255),0,20);  // line color
  
}
}

void draw(){
 

  
  for (int i=1; i < suns.length; i++) {  //seeding
  suns[i].move();
    suns[i].sketch();
  }
}

class Sun {  //controls tethered sun object
  color c;
  float xcoord;
  float ycoord;
  float xspeed;
  

  Sun(color c_, float xcoord_, float ycoord_, float xspeed_) {
    c = c_;
    xcoord = random(width);
    ycoord = random(height);
    xspeed = random(-2,4); 
  }
  
   void move() {
    xcoord = xcoord + xspeed*random(-5,0); //moves units towards origin
    
    ycoord = ycoord + xspeed*random(-5,5);
  }
  
   void sketch() {
     noStroke();
  rectMode(CENTER);
  fill(20,20);
   rect(xcoord, ycoord, 15, 50);  //rectangles
  rect(xcoord, ycoord, 50, 15);

  stroke(c);
  line(xcoord+4, ycoord-25, 20, 450);  //lines 
  line(xcoord-4, ycoord-25, 20, 275);
  line(xcoord-25, ycoord+4, 20, 175);
  line(xcoord-25, ycoord-4, 20, 50);

  ellipse(xcoord, ycoord, 36, 36);  //circle on top
  }
}



