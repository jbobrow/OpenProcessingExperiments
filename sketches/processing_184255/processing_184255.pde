
int x1=10;
int x2=100;
int y1=10;
int y2=100;



void setup(){
  background(255);
  size(220,220);
  
}

void draw(){
  background(255);
  stroke(30,50,200);
  line(x1,random(y1,y2),x2,random(y1,y2));
  stroke(40,200,40);
  line(x2+20,random(y1,y2),210,random(y1,y2));
  stroke(200,40,40);
  line(x2+20,random(y1+(width/2),y2+(width/2)),width-10,random(y1+(width/2),y2+(width/2)));
  stroke(100,100,100);
  line(x1,random(y1+(width/2),y2+(width/2)),x2,random(y1+(width/2),y2+(width/2)));

}
