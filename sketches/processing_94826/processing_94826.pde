
void setup(){
  size(800,800);
  background(255);
  
}
 
void draw(){
  droid(200,200,color(random(255),random(255),random(255)));
  droid4(10,10);
  four_rows(10,10);
}
  void droid(int x,int y, color c){
  stroke(c);
  strokeWeight(10);
  fill(0,252,10);//Green
  rect(200+x,200+y,150,100);//Body
  ellipse(215+x,300+y,30,30);//Left small circle
  ellipse(335+x,300+y,30,30);//Right circle
  rect(220+x,295+y,110,20);//Bottom rectangle
  ellipse(275+x,190+y,150,150);//Head
  
  
  fill(255);
  rect(200+x,200+y,150,10);//White line
  ellipse(240+x,160+y,15,15);//Left Eye 
  ellipse(305+x,160+y,15,15);//right eye
  
  fill(0,252,10);
  ellipse(180+x,220+y,25,25);//top left hand circle  
  rect(168+x,220+y,25,60);//rectangle for arm
  ellipse(180+x,280+y,25,25);//bottom circle for left hand arm
  
  ellipse(370+x,220+y,25,25);//top right hand circle
  rect(358+x,220+y,25,60);//right hand rectangle\
  ellipse(370+x,280+y,25,25);
  
  rect(290+x,300+y,30,50);//right leg
  rect(235+x,300+y,30,50);//left leg
  ellipse(305+x,350+y,30,30);//right circle feet
  ellipse(250+x,350+y,30,30);//left cirlce feet
  }
  color pick(){
    return color(random(255),random(255),random(255));
  }
  void droid4(int x,int y){
    droid(x,y,pick());
    droid(x+80,y,pick());
    droid(x+250, y, pick());
   
  } 
    void four_rows(int x,int y){
     droid4(x,y);
     droid4(x,y+280);
     droid4(x,y+550);
    }

