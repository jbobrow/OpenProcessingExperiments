
float timer=0.0;
float center=0.0;
float r=random(360);
float t=random(100);
float y=random(100);
float hue=random(360.00);
float sat=random(100.00);
float bright=random(100.00);
float angle;
float jitter;

void setup(){
  size(500,500);
  colorMode(HSB,360,100,100,100);
  background(0);
  noStroke();
  frameRate(60);
}
  

void draw(){
  timer+=1/30.0;
  
if(timer>=0.10){  
  timer=0.0;
  hue+=30.75;
  sat+=10.75;
  if(hue>=360){
    hue=0.0;}
    if(sat>=100){
      sat=0.0;}
}
while(timer<0.50){
  fill(hue,sat,100);
  ellipse(50,50,15,15);
  ellipse(450,50,15,15);
  ellipse(50,450,15,15);
  ellipse(450,450,15,15);
  triangle(200,40,250,20,300,40);
  triangle(200,450,250,470,300,450);
  timer=timer+1/30.0;}
  
  if(second()%2==0){
    jitter=random(-0.1,0.1);}
    angle=angle+jitter;
    float c=sin(angle);
    translate(width/4, height,4);
    rotate(c);
    fill(hue,sat,100);
    rect(100,100,300,300,7);

}



