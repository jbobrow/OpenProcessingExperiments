
ArrayList elx,ely,px,wifio;
int x,y,indx=0, wifilimit = 100,elxtemp,elytemp,position=2,timer,tempi,cursors=0,percentage; //position 1:wifi, position 2:people
boolean locked=false;
PFont myFont;

void setup() {
  smooth();
  background(195);
  size(900,800);
  fill(256);
  myFont = createFont("arial", 16);
  textFont(myFont);
  smooth();
  elx = new ArrayList();
  ely = new ArrayList();
  px = new ArrayList();
  wifio = new ArrayList();
}

void setpeoploc() {
  x=int(random(0,width));
  y=int(random(0,height));
}

void keyp() {
  if(keyPressed) {
    switch (key){
    case '1':
      position = 1;
      break;
    case '2':
      position = 2;
      break;
    case '3':
      position = 3;
      break;
    }
  }
}

void draw() {
  background(195);
  if (cursors != 1){
  if (position==1){
    stroke(0,0,0,75);
    ellipse(mouseX,mouseY,10,10);
    stroke(0);
  }
  if (position == 2){
    stroke(0,0,0,75);
    ellipse(mouseX,mouseY,wifilimit,wifilimit);
    stroke(0);
  }
  if (position == 3){
    stroke(0,0,0,75);
    fill(0,0,0,100);
    ellipse(mouseX,mouseY,8,8);
    fill(256);
    stroke(0);
  }
  }
  for (int i = 0; i<px.size();i++){
    people p = (people) px.get(i);
    p.update();
  }
  
  for (int i=1; i<wifio.size();i++){
    wifi wifis = (wifi) wifio.get(i);
    wifis.displas();
    wifis.wifidis();
  }
  fill(0);
  text("Press 1 : Piggybackers, 2 : WIFI sources, 3 : Hackers ",20,780);
  fill(0,0,255);
  text("Current : ",800,780);
  text(position,860,780);
  keyp();
  fill(256);
}

void mouseReleased() {
  if (position == 2){
    elx.add(mouseX);
    ely.add(mouseY);
    wifio.add(new wifi(mouseX,mouseY));
  }
  if (position == 1){
    px.add(new people(mouseX,mouseY));
  }
  if (position == 3){
    px.add(new people(mouseX,mouseY));
    tempi = (px.size()-1);
    people q = (people) px.get(tempi);
    q.hacker = 1;
  }
}

public class Position{
  public float x;
  public float y;
  Position(float ax,float ay){
    this.x=ax;
    this.y=ay;
  }
}

class people {
  public Position position;
  int peopx,peopy,destinx,destiny,occ,tempidx,index,dia,hacker,hc=256,cancel=0;
  PVector location, velocity, acceleration;
  float topspeed;

  people (int x, int y){
    peopx = x;
    peopy = y;
    index = indx;
    hacker = 0;
    occ = 0;
    this.position = new Position(peopx,peopy);
    location = new PVector(peopx,peopy);
    velocity = new PVector(0,0);
    topspeed = random(0.2,1);
    
  }
  void nearchk() {
    int distd=0,tempd=0;
    if (elx.size()>1){
      if (hacker !=1){      
      tempd=int(dist(peopx,peopy,(Integer)elx.get(0),(Integer)ely.get(0)));
      for (int i=1; i<(Integer)elx.size();i++){
        distd = int(dist(peopx,peopy,(Integer)elx.get(i),(Integer)ely.get(i)));
        if (tempd > distd){
          tempd=distd;
          if (indx ==0) indx = 1;
          indx = i;
          index = indx;
        }
      }
    }
    else{
      wifi wifis = (wifi) wifio.get(0);
      tempd = wifis.occ;
      for (int i = 0; i<wifio.size();i++){
        wifis = (wifi) wifio.get(i);
        distd = wifis.occ;
        if (tempd<distd){
          tempd = distd;
          indx = i;
          index = indx;
        }
      }
    }
   }
  } 

  void destinationset() {
    if (elx.size()>1){
      //if (tempidx!=0){
      if (cancel != 1)  {
      wifi wifis = (wifi) wifio.get(tempidx);
      wifis.occ--;
      //}
      wifis = (wifi) wifio.get(index);
      wifis.occ++;
      destinx = int(random((Integer)elx.get(index)-(wifis.diawifi/4),(Integer)elx.get(index)+(wifis.diawifi/4)));
      destiny = int(random((Integer)ely.get(index)-(wifis.diawifi/4),(Integer)ely.get(index)+(wifis.diawifi/4)));
      }
    }
  }

  void update(){
    cursors = 0;
    if (hacker !=0){
      topspeed = 1.2;
      hc = 0;
    }
    if (topspeed<0.6) {
      dia=12;
    }
    else {
      dia = 8;
    }
    wifi wifis = (wifi) wifio.get(index);
    occ=wifis.occ;
    nearchk();
    if (tempidx!=indx){
      destinationset();
      tempidx=indx;
    }
    fill(hc);
    ellipse(location.x,location.y,dia,dia);
    fill(256);
    move();
    display();
  }
  void move() {
    // Our algorithm for calculating acceleration:
    PVector mouse = new PVector(destinx,destiny);
    PVector dir = PVector.sub(mouse,location);  // Find vector pointing towards mouse
    dir.normalize();     // Normalize
    dir.mult(1);       // Scale 
    acceleration = dir;  // Set to acceleration
    // Motion 101!  Velocity changes by acceleration.  Location changes by velocity.
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  void display() {
    if ((mouseX>(location.x-(wifilimit/6)))&&(mouseX<(location.x+(wifilimit/6)))&&(mouseY>(location.y-(wifilimit/6)))&&(mouseY<(location.y+(wifilimit/6)))) {
      cursors = 1;
      stroke(0,0,0,75);
      line(peopx,peopy,location.x,location.y);
      println(index);
      stroke(0);
    }
  }
}

class wifi{
  public Position position;
  int wifix,wifiy,occ,source,functions,tempinx,diawifi;
  wifi (int x, int y) {
    wifix = x;
    wifiy = y;
    occ = 0;
    diawifi = wifilimit;
    this.position = new Position(wifix,wifiy);
  }
  void wifidis() {
    if ((mouseX>(wifix-wifilimit/2))&&(mouseX<(wifix+wifilimit/2))&&(mouseY>(wifiy-(wifilimit/2)))&&(mouseY<(wifiy+(wifilimit/2)))) {
      for (int i = 0; i<px.size();i++){
        people p = (people) px.get(i);
        if ((p.location.x>(wifix-wifilimit/2))&&(p.location.x<(wifix+wifilimit/2))&&(p.location.y>(wifiy-(wifilimit/2)))&&(p.location.y<(wifiy+(wifilimit/2)))) {
          cursors = 1;
          stroke(0,0,255);
          fill(0,0,255);
          ellipse(p.position.x,p.position.y,2,2);
          stroke(0);
          fill(0,0,255);
          text("Occupancy : "+occ+"     Loss : "+percentage+" %",500,780);
//          text(occ,620,780);
          fill(256);
          println(occ);
        }
      }
    }
  }
  void displas() {
    diawifi = wifilimit - (5*occ);
    percentage = 100-diawifi;
    ellipse(wifix,wifiy,diawifi,diawifi);
  }
}







