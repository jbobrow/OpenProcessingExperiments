
ArrayList<Float> a = new ArrayList<Float>();
boolean tf, tft;
float f;
float c = 0;
ArrayList <Quad> green = new ArrayList <Quad>();
boolean started;
void setup(){
  background(255);
 size(500, 500);
smooth(); 
strokeWeight(5);
c=0;
  
}
void draw(){
if(keyPressed) {
started = true;
}

  background(255);
  if(started) {
  c = (abs('a'-key)*5);
  }
  else {
  c = 0;
  }

  tf = mouseX<100 && mouseY < 100;
  tft = tf == false;
  
fill(255);
  
  rect(0,0,100,100);
  
  fill(255,0,0);
  if(tf) {
  ellipse (mouseX,mouseY,15,15);
  }
  
  float mx = map (mouseX,0,100,0,width);
  float my = map (mouseY,0,100,0,height);
  float pmx = map (pmouseX,0,100,0,width);
  float pmy = map (pmouseY,0,100,0,height);
  if(mousePressed && tf) {
    a.add(c);
    green.add(new Quad(mx, my, pmx, pmy));
  }
  if(mousePressed && (tft)){
    a.add(c);
    green.add(new Quad(mouseX, mouseY, pmouseX, pmouseY));
  }
  for(int i =1; i < green.size(); i++) {
    stroke(a.get(i));
    line(green.get(i).x, green.get(i).y, green.get(i).x2, green.get(i).y2);
  }
  stroke(c);
  
  
  fill(0,255,0);
  stroke(c);
  
  if(tft) {
    ellipse(mouseX, mouseY, 30, 30);
  }
  else {
  ellipse(mx,my,30,30);
  }
  fill(255);
  stroke(0);
  rect(0,0,100,100);
  stroke(c);
  fill(255,0,0);
  if(tf) {
  ellipse (mouseX,mouseY,15,15);
  }
  if(keyPressed && (key == 'c')) {
    for(int i =0; i < green.size(); i++) {
      green.remove(i);
      a.remove(i);
    }
  }

}
                
            class Quad {
float x, y, x2, y2;
Quad(float xv, float yv, float x2v, float y2v) {
x=xv;
y=yv;
x2=x2v;
y2=y2v;
}
}
