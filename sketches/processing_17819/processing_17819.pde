
color c, r, g, b, a;
boolean waiting;
int len, count, x, y, turn, reactionTime;
ArrayList history = new ArrayList();
float distthresh = 200;

void setup(){
  size(400, 600);
  background(0, 0, 0, 50);
  smooth();
  stroke(255);
  clear();
  waiting = true;
  turn = 0;
  reactionTime = 0;
  len = int(random(100));
}

void clear(){
  noStroke();
  fill(0, 0, 0, 255);
  rect(0, 0, 400, 400);
  waiting = true;
  turn++;
  reactionTime = 0;
}

void draw(){
  if(!waiting){
    reactionTime++;
  }

  if(count == len && waiting == true){
    r = int(random(200)) + 55;
    g = int(random(200)) + 55;
    b = int(random(200)) + 55;
    a = int(random(150)) + 105;
    
    fill(r, g, b, a);
    x = int(random(300)) + 50;
    y = int(random(270)) + 50;
    
    ellipse(x, y , 50, 50);
    waiting = false;
    count = 0;
    reactionTime = 0;

  }
  count++;
}

void mouseClicked(){ 
    if(abs(x - mouseX) < 25 && abs(y - mouseY) < 25){
      stroke(255, 20);
      PVector d = new PVector(turn*5, height - reactionTime,0);
      history.add(0,d);
   
      for (int p=0; p<history.size(); p++){
        PVector v = (PVector) history.get(p);
        float joinchance = p/history.size() + d.dist(v)/distthresh;
        if (joinchance < random(0.4))  line(d.x,d.y,v.x,v.y);
  }
  
     /*PVector e = new PVector(turn*5, height - 20 -sqrt((x-mouseX)*(x-mouseX)+(y-mouseY)*(y-mouseY)),0);
      history.add(0,e);
   
      for (int p=0; p<history.size(); p++){
        PVector v = (PVector) history.get(p);
        float joinchance = p/history.size() + e.dist(v)/distthresh;
        if (joinchance < random(0.4))  line(e.x,e.y,v.x,v.y);
  }*/
      waiting = true;
      len = int(random(100));
      count = 0;
      clear();
  }
}

