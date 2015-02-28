
//PFont font = loadFont("/Users/Kyosuke/Dropbox/Processing/kraftwerk/fontmaking/data/HelveticaNeue-80.vlw");
color[] exColor=new color[600*300];
ArrayList<Line> lines;


void setup() {
  lines = new ArrayList<Line>();
  frameRate(8);
  size(600, 300);
  smooth();
  
  background(255);
  fill(0);
  
  textAlign(LEFT, CENTER);
//  textFont(font, 80);
  textSize(80);
  String s1="Hello, I am";
  String s2="sosososoooon";
  text(s1, (width-textWidth(s2))/2, height/2-65);
  text(s2, (width-textWidth(s2))/2, height/2+40);
  // text("Kyosuke Nakanishi", 30, height/2+40);
  //text("CLICK!!", width/2, height/2+90);
  for(int i = 0; i < width*height; i++){
    exColor[i] = get(i%width,i/width);
  }
  for (int i=0; i < width; i+=2) {
    for (int j=0; j < height; j+=2) {
      if (exColor[i+j*width] != -1) {
        lines.add(new Line(new PVector(i,j), random(0.1f,3.0f)));
        //lines.add(new Line(new PVector(i,j), 2));
      }
    }
  }
  
}

void draw() {
  background(0);
  for(int i = 0; i < lines.size(); i++){
  stroke(255);
    //stroke(10, random(50,100), 10, 90);
    Line line = lines.get(i);
    if(mousePressed){
      PVector mouseLoc = new PVector(mouseX, mouseY, 0);
      PVector diff = PVector.sub(mouseLoc, line.getLocation());
      diff.normalize();
      float factor = 2.0f; 
      diff.mult(factor);
      line.setAcceleration(diff);
    }else if(PVector.dist(line.getFirstloc(),line.getLocation()) > 2){
      PVector diff1 = PVector.sub(line.getFirstloc(), line.getLocation());
      diff1.normalize();
      float factor = 4.0f; 
      diff1.mult(factor);
      line.setAcceleration(diff1);
      
      PVector actualVel = line.getVelocity();
      PVector attrio = PVector.mult(actualVel, -0.2);
      line.addForce(attrio);
    }else if(PVector.dist(line.getFirstloc(),line.getLocation()) <= 2){
      PVector v = new PVector(0,0);
      line.setVelocity(v);
    }
    
    line.update();
    line.draw();
    PVector a = new PVector(0,0);
    line.setAcceleration(a);
  }
  
  textAlign(CENTER, CENTER);
  textSize(12);
  fill(100);
  text("Hello, I am sosososoooon. Please drag in this box.", width/2, height-20);
}

void mouseReleased(){
//  for(int i = 0; i < lines.size(); i++){
//    Line line = lines.get(i);
//    line.undo();
//  }
}

void keyPressed(){
 
}



class Line
{
  private float px, py, endx, endy;
  private PVector firstloc, location, endlocation, velocity, acc;
  private float dx,dy;
  private float ms; //masatukeisuu
  private int length = 5;
 // boolean hitmaxx = false, hitmaxy = false, hitminx = false, hitminy = false;
  
  Line(PVector _location, float _ms)
  {
    firstloc = _location;
    location = new PVector(firstloc.x,firstloc.y);
    endlocation = new PVector(random(location.x-length,location.x+length),
                              random(location.y-length,location.y+length));
   // endlocation = new PVector(firstloc.x,firstloc.y);
    velocity = new PVector(0,0);
    acc = new PVector(0,0);
    ms = _ms;
  }
  
  public void update()
  {
//    if(location.x < 0 || location.x > width || endlocation.x < 0 || endlocation.x > width) velocity.x *= -1;
//    if(location.y < 0 || location.y > height || endlocation.y < 0 || endlocation.y > height) velocity.y *= -1;
    velocity.add(acc);
    location.add(velocity);
    endlocation.add(velocity);
  }
  
  public void draw()
  {
    strokeWeight(0.5);
    line(location.x, location.y, endlocation.x, endlocation.y);
    //ellipse(location.x, location.y, length,length);
  }
  
  public void undo(){
    velocity =new PVector(-velocity.x,-velocity.y);
  }
  
  
  public void setAcceleration(PVector a){
    acc = a;
  }
  
  public PVector getAcceleration(){
    return acc;
  }
  
  public void setVelocity(PVector v){
    velocity = v;
  }
  
  public PVector getVelocity(){
    return velocity;
  }
  
  public PVector getLocation(){
    return location;
  }
  
  public PVector getFirstloc(){
    return firstloc;
  }
  
  public void addForce(PVector force){
    force.div(ms);
    velocity.add(force);
  }
  
}


