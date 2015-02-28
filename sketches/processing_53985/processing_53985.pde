
float xmove=0;
int n = 180;

void setup(){
size(600,600);

}

void draw(){
  background(0);
 fill(n);
  ellipse(200,100,10,10);
  fill(255,220,40);
  noStroke();
  smooth();
  arc(xmove,100,40,40,PI/5,TWO_PI-PI/5);
  xmove = xmove + 1;
  
 if(xmove > 210){
    n = 0;
  }
}

