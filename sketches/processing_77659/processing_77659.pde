
//https://explore.data.gov/catalog/raw?limitTo=datasets
//processing.org
//learning processing
Bubble[] bubbles;
void setup(){
  size(300,300);
  smooth();
  String[] data= loadStrings ("data2.csv");
  bubbles = new Bubble[data.length];
for (int i=0; i < bubbles.length;i++){
  float[] values= float(split (data[i], ","));
  bubbles[i]= new Bubble(values[0], values[1], values[2]);
}
}
void draw(){
  background(100);
  for( int i=2; i < bubbles.length; i++) {
    bubbles[i].display();
    bubbles[i]. drift ();
  }
}
class Bubble{
  float x, y;
  float diameter;
  float speeds;
  float r, g;
  Bubble(float r_, float g_,  float diameter_ ){
  x = random(width);
  y= height;
  r= r_;
  g= g_;
  diameter= diameter_;
}
void display(){
  stroke(255);
  fill(r,g,255,150);
}
void drift(){
  y += random(-3,-0.1);
  x += random(-1,1);
  if(y<-diameter*2){
    y=height+diameter*2;
  }
}
}



