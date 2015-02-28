
float x=250;
float y=250;
float xs=2;
float ys=-1.5;
float ya=.5;


void setup(){
  size(500,500);
  strokeWeight(3);
}
void draw(){
  background(0,170,0);
  //if
  if (mousePressed){
    x=mouseX;
    y=50;
    ys=mouseY-pmouseY;
    xs=mouseX-pmouseX;
  }
  for (int j=100; j<400; j+=60){
  for(int i=40; i<500; i+=40){
  if ((abs(x-i)<10)&&(abs(y-j)<5)){
    xs=(x-i);
    ys=(y-j);
  }
  }
  }
  
  for (int l=130; l<400; l+=60){
  for (int k=20; k<500; k+=40){
  if ((abs(x-k)<10)&&(abs(y-l)<5)){
    xs=(x-k);
    ys=(y-l);
  }
  }
  }
  
  if (y>=450){
    ys=0;
    xs=0;
  }
  if (x<10){
    xs=.7*abs(xs);
  }else if (x>490){
    xs=-.7*abs(xs);
  }
  
  
  
  //objects
  fill(100,50,0);
  rect(0,450,500,150);
  fill(200,50,25);
  ellipse(x,y,20,20);
  //point(225,250);
  //point(275,250);
  for (int j=100; j<400; j+=60){
  for (int i=40; i<500; i+=40){
  point(i,j);
  }
  }
  for (int l=130; l<400; l+=60){
  for (int k=20; k<500; k+=40){
  point(k,l);
  }
  }
  
  
  //rules
  x+=xs;
  y+=ys;
  ys+=ya;
  
  mousehelper();
}

void mousehelper(){
  noStroke();
  fill(250,100);
  rect(mouseX-5,mouseY-10,40,20);
  stroke(0);
  fill(0);
  textSize(10);
  text(mouseX,mouseX-3,mouseY-2);
  text(mouseY,mouseX+6,mouseY+8);
}
