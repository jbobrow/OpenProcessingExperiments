
ArrayList<PVector> list    = new ArrayList<PVector>();
ArrayList<PVector> dirList = new ArrayList<PVector>();
PGraphics centro;
float h;

void setup(){
  size(500, 500);  
  
  h = sqrt(pow(width/2,2 )+ pow(height/2,2));
  
  centro = createGraphics(200, 200);
  centro.beginDraw();
  centro.fill(0);
  centro.ellipse(100,100,80,80);
  centro.filter(BLUR,5);
  centro.endDraw();

  //stroke(255);
  noStroke();
  background(0);
}

void draw(){
  fill(0,100);
  rect(0,0,width, height);
  fill(255,100);
  for(int i =list.size()-1;i>=0;i--) {
    PVector dir = dirList.get(i);
    //dir.mult(1.005);
    list.get(i).add(dir);
    //point(list.get(i).x, list.get(i).y);
    ellipse(list.get(i).x, list.get(i).y, 2, 2);
    if(list.get(i).dist(new PVector(width/2, height/2))>h) {
      list.remove(i);
      dirList.remove(i);
    }
  }
  
  image(centro,width/2-100, height/2-100);
  
  for(int i=0;i<20;i++){
    list.add(new PVector(width/2, height/2));
    float a = noise(frameCount*0.001+i*0.1)*TWO_PI*16;
    dirList.add(new PVector(cos(a),sin(a)));
  }
  
  fill(255);
  text(frameRate, 20, 20);
}


