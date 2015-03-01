
Star a; 
Star b; 
Star c;
long lasttime;

void setup(){
  lasttime = millis();
  size(500,500);
  a = new Star();
  b = new Star();
  c = new Star();
}

void draw(){
  background(0,0,128);
  a.display();
  b.display();
  c.display();
  if (millis() - lasttime > 2000){
     a.sparkle(); 
     b.sparkle();
     c.sparkle();
  lasttime = millis();
 }

}

class Star{
  color c;
  float diam;
  float loc_x;
  float loc_y;
  float how_much_shine;

Star(){
     c = color(255,255,0);
     diam = random(150);
     loc_x = random(250)+diam; 
     loc_y = random(250)+diam; 
     how_much_shine = random(7);
  }
  
  void display(){
    stroke(c);
    fill(c);
    ellipseMode(CENTER);
    ellipse(loc_x, loc_y, diam, diam);
}
  
  void sparkle(){
    diam = diam+how_much_shine*random(-5,5);
  }
  
  void unsparkle(){
    diam=diam-how_much_shine;
  }
  
}
