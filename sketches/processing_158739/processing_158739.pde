
ArrayList <PVector> points;
int count = 2;  //the number of bat

void setup(){
  size(400,400);
  colorMode(HSB,255);
  points = new ArrayList<PVector>();  //initialize
  
  for(int i=0;i<2;i++){
    PVector p= new PVector(random(0,width),random(0,height));
    points.add(p);
  }  //p.x is 0 to 400, p.y is 0 to 400 ↓
     //add to points
}

void draw(){
  //clear
  fill(255);      
  rect(0,0,width,height);
  
  for(int i=0;i<count;i++){
    PVector p = points.get(i);
    fill(#000000);  //the color of bat is black
    ellipse(p.x,p.y,random(0,20),random(0,10));
    
    p.x += random(-2,2);
    p.y += random(-2,2);
  }
}

void mousePressed(){
  //create new bat
  PVector y= new PVector(random(0,width),random(0,height));
  points.add(y);
  
  for(int i=0;i<count;i++){
    PVector p = points.get(i);
    float delx = mouseX-p.x;
    float dely = mouseY-p.y;
    p.x += delx/10;
    p.y += (dely)/10;
  }
  count++;  //increase bat
}
