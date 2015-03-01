
Hand[] hands= new Hand[1];
int counter;
int counterMax=4;
int revCounter=1;
int sqSize=1000;
boolean globalExtra=false;

void setup() {
  smooth();
  size(sqSize, sqSize);
  strokeWeight(1);
  background(255);
  hands[0]=new Hand(1, 0);
}

void mousePressed(){
 if(globalExtra==false){
  globalExtra=true; 
 }
 else{
  globalExtra=false; 
 }
}

void draw() {
  for (int i=0; i<hands.length; i++) {
    counter++;

    if (counter>counterMax) {
      if (hands[i].x>sqSize||hands[i].x<0||hands[i].y<0||hands[i].y>sqSize) {
        revCounter++;
        hands= (Hand[]) shorten(hands);
        Hand h = new Hand(revCounter, 0);
        hands =(Hand[]) append(hands, h);
        hands[i].reset();
      }
      
     if(globalExtra==true){
      hands[i].extra(); 
     }
     
      hands[i].update();
      hands[i].display();
      counter=0;
    }
  }
}
class Hand {

  float x;
  float y;
  float xPrev;
  float yPrev;
  float theta;
  float r;
  int ticks;
  float center;
  float phi=.5*(1+sqrt(5));
  color strokeColor;

  Hand(int tTicks, color tStrokeColor) {
    x=center;  
    y=center;
    xPrev=center;
    yPrev=center;
    r=0;
    theta=PI/3;
    ticks=tTicks;
    center=width/2;
    strokeColor=tStrokeColor;
  }

  void update() {
    xPrev=x;
    yPrev=y;
    theta=theta-2*PI/ticks;
    r=r+phi*5;
    strokeWeight(r/40);
    x=center+r*cos(theta);
    y=center+r*sin(theta);
    strokeColor=color(255*cos(theta)+125, 255*sin(theta)+125, (r/1000)*255, r);
  }  

  void reset() {
    theta=PI/3;
    r=0;
  }  
void extra(){
  strokeWeight(r/170);
  line(x,y,xPrev,yPrev);
}
  void display() {
    stroke(strokeColor);
    ellipse(x, y, r/25, r/25);
    
  }
}


