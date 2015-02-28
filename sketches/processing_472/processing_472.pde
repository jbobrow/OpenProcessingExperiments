



ArrayList punktA;
punkt tempPunkt;

String funki;
int c_init=0;
int c_Max=1000000;
int c_Min=0;
int counter=constrain(c_init,c_Min,c_Max);
int counter_stop;
float xdirection = 0.98;
float ydirection = 0.98;
float xspeed = 0.8;
float yspeed = 0.8;
float velocityX,velocityY;
float grow=2;



boolean hitx =  false;
boolean hity =  false;
int r1=10;
PFont font;


void setup(){
  size(600,600,P3D);
  punktA=new ArrayList();
  noStroke();
  ellipseMode(CENTER);

}
void draw(){
  background(0);


  if(punktA!=null){
    for(int i=0;i<punktA.size();i++){
      tempPunkt=(punkt)punktA.get(i);
      dotAround((punkt)punktA.get(i));
      println(tempPunkt.mouseOver());
      for(int j=0;j<i;j++){
        collide((punkt)punktA.get(i),(punkt)punktA.get(j));

      }

    }
  }

  if(punktA!=null){
    if(punktA.size()<counter){
      for(int i=0;i<counter;i++){
        punktA.add(new punkt(random(width),random(height),i*2,0,random(.35,.5)));
      }
    }
  }

  control();
}

void control(){
  counter=50;
  if(keyPressed&&key=='+'){
    counter=100;
  }
  if(keyPressed&&key=='-'){
    if(punktA!=null){
      if(punktA.size()>0){
        counter--;
        punktA.remove(counter);
      }
    }
  }
}












