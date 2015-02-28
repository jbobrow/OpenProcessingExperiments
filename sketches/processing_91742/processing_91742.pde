
//
// A Peace of code is from
// http://mrdoob.com/lab/javascript/harmony/#web
//



ArrayList history = new ArrayList();
float distthresh = 60;


void setup(){
  size(900,900);
  background(20);
}

void draw(){
  if(mousePressed){
    stroke(random(1,255),10);
    line(mouseX,mouseY,mouseX+random(1,600),mouseY+random(1,600));
    line(mouseX,mouseY,mouseX-random(1,600),mouseY-random(1,600));
    line(mouseX,mouseY,mouseX-random(1,600),mouseY+random(1,600));
    line(mouseX,mouseY,mouseX+random(1,600),mouseY-random(1,600));
    line(mouseX,mouseY,pmouseX,pmouseY);
    
    
    PVector d = new PVector(mouseX,mouseY,0);
    history.add(0,d);
   
    for (int p=0; p<history.size(); p++){
      PVector v = (PVector) history.get(p);
      float joinchance = 100/history.size() + d.dist(v)/distthresh;
      if (joinchance < random(0.5))  line(d.x,d.y,v.x,v.y);
    }
  }
}

void keyPressed(){
  if (key == ' ') {
    background(20);

  }
}


