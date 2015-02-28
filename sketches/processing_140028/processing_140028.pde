
class star {
  float x, y, speed, d, age,sizeIncr;
  int wachsen;
  star() {
    x = random(width);
    y = random(height);
    speed = random(0.2, 5);
    wachsen= int(random(0, 2));
    if(wachsen==1)d = 0;
    else {
      d= random(0.2, 3);
    }
    age=0;
    sizeIncr= random(0,0.03);
  }
  void render() {
   age++;
     if (age<200){
       if (wachsen==1){
         d+=sizeIncr;
         if (d>3||d<-3) d=3;
       }else {
         if (d>3||d<-3) d=3;
         d= d+0.2-0.6*noise(x, y, frameCount);
       }
       
 
     }
     else{
       if (d>3||d<-3) d=3;
     }
    
    ellipse(x, y, d*(map(noise(x, y,0.001*frameCount),0,1,0.2,1.5)), d*(map(noise(x, y,0.001*frameCount),0,1,0.2,1.5)));
  }
  void move() {
    x =x-map(mouseX, 0, width, -0.05*speed, 0.05*speed)*(w2-x); 
    y =y-map(mouseY, 0, height, -0.05*speed, 0.05*speed)*(h2-y);
  }
}

star neuerStern;
ArrayList<star> starArray = new ArrayList<star>();
float h2;//=height/2
float w2;//=width/2
float d2;//=diagonal/2
int numberOfStars = 20000;
int newStars =50;

void setup() {
  size(900, 900);
  w2=width/2;
  h2= height/2;
  d2 = dist(0, 0, w2, h2);
  noStroke();
  neuerStern= new star();
  frameRate(9000);
  background(0);
  noCursor ();
}
void draw() {
  fill(0, map(dist(mouseX, mouseY, w2, h2), 0, d2, 255, -10));
  rect(0, 0, width, height);
  fill(255);
  neuerStern.render();
  for (int i = 0; i<newStars; i++) {   // star init
    starArray.add(new star());
  }


  for (int i = 0; i<starArray.size(); i++) {
    if (starArray.get(i).x<0||starArray.get(i).x>width||starArray.get(i).y<0||starArray.get(i).y>height) starArray.remove(i);
    starArray.get(i).move();
    starArray.get(i).render();
  }
  if (starArray.size()>numberOfStars) {//
    for (int i = 0; i<newStars; i++) {
      starArray.remove(i);
    }
  }
}

boolean sketchFullScreen() {// force fullscreen
  return true;
}
