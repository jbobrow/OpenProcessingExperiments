
int xPos=0;
int yPos=0;
int increment=2;
int rectSize=1;
int ellipseSize=400;
int x,y;
int aPos=200;
int bPos=200;
int PI;

void setup() {
  size(400, 400);
}

void draw() {
  background(100, 155, 155);
  noStroke();
  
  fill(0,100,250,50);
  rectMode(CENTER);
  rect(xPos+200, yPos+200, rectSize, rectSize);
  rectSize=rectSize+increment;
  if(rectSize>=400){
    increment=increment*-1;
  }
  if(rectSize<0){
    increment=increment*-1;//motion
  }
 
  fill(0,255,255,50);
  ellipse(xPos+200, yPos+200, ellipseSize,ellipseSize);
  ellipseSize=ellipseSize-increment;
  if(ellipseSize<0){
    increment=increment*-1;
  }
  if(ellipseSize>=400){
    increment=increment*-1;
  }//motion
  
  strokeWeight(10);
  stroke(255,90);
  
  pushMatrix();
  rotate(PI);
  PI=PI+increment;
  line(200,200,aPos,bPos);
  aPos=aPos+increment;
  bPos=bPos-increment;
  increment=increment*1;
  popMatrix();
  
  
  noStroke(); 
  x=mouseX;
  y=mouseY;
  if(x>0&&x<400&&y>0&&y<400){
    background(70,160,170,90);
    fill(255);
    ellipse(200,200,400,400);//big circle
 
  fill(200,225,255,100);
  ellipse(0,0,400,400);
  ellipse(400,0,400,400);
  ellipse(0,400,400,400);
  ellipse(400,400,400,400);//half circle
  
  fill(200,225,255,100);
  rect(0,0,200*sqrt(2),200*sqrt(2));
  rect(0,400,200*sqrt(2),200*sqrt(2));
  rect(400,0,200*sqrt(2),200*sqrt(2));
  rect(400,400,200*sqrt(2),200*sqrt(2));
  
  
  fill(25,285,235,60);
  ellipse(200,200,sqrt(2)*200,sqrt(2)*200);//small circle
  
  fill(0,220,130,50);
  rectMode(CENTER);
  rect(200,200,sqrt(2)*200,sqrt(2)*200);//second rect
  
  pushMatrix();
  fill(190,30,255,30);
  translate(width/2,height/2);
  rotate(PI/4);
  rect(0,0,sqrt(2)*200,sqrt(2)*200);
  popMatrix();
  //rotate rect
 
  fill(200,255,207,100);
  rectMode(CENTER);
  rect(200,200,(400-sqrt(2)*200),(400-sqrt(2)*200));//center rect
  
  
  
  x=mouseX;
  y=mouseY;
  
  if(x>100*sqrt(2)&&x<400-100*sqrt(2)&& y>100* sqrt(2)&&y<400-100*sqrt(2)){
    fill(255,255,240,100);
    textSize(90);
    text("!",185,230);
  }
 
  else if(dist(200,200,x,y)<180){
    fill(255,40,118);
    rect(200,200,400,400);
    strokeWeight(5);
    stroke(255,90);
    line(200,200,x,y);
  }
  else{
    fill(100,100,180);
    rect(200,200,400,400);
  }
  
  
  }
 
  
  //cut
  

  
   
  
}



