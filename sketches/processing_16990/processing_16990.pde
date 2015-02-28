
int x[];
int y[];
float r[];
int pos=50;
int ellmove= 0;
float changecolor=0;
void setup(){
  colorMode(HSB);
  size(800,600);
  smooth();
  noStroke();
  x= new int[pos];
  y=new int[pos];
  r=new float[pos];
}

void draw(){
  background(255);
  for(int i=0; i<pos;i++){
    fill(changecolor,250,100,10);
    float d= dist(width/2,height/2,mouseX,mouseY);
    ellipse(x[i],y[i],r[i],r[i]);
  }
}
void mouseMoved(){
  x[ellmove]=mouseX;
  y[ellmove]=mouseY;
  r[ellmove]= dist(width/2,height/2,mouseX,mouseY);
  ellmove++;
  ellmove%=pos; 
  //if(ellmove>=pos){
  //ellmove=0;
}
void keyPressed(){
  if(key=='a'){
    changecolor=random(0,250);
  }
}


