
int walk=0;//integer walk
int x=0;//integer x
int stepl=0;//integer step left
int stepr=0;//integer step right
void setup(){//start setup
  size(500,500);//size
  frameRate(40);//rate
  smooth();//smooth
}//end draw
void draw(){//start draw
  
  background(255);//white background
  fill(200,111,136);//magenta
  ellipse(250+x,200,100,100);//head
  arc(180+x,240,200,150,0,PI);//body
  fill(255,255,0);//yellow
  triangle(350+x,200,295+x,180,295+x,220);//beak
  fill(170,235,111);//green
  arc(170+x,240,140,100,0,PI);//head part1
  arc(250+x,200,100,100,-PI/2,3*PI/6);//headpart2
  fill(200,111,136);//magenta
  arc(250+x,200,100,100,0,PI);//head part3
  triangle(50+x,200,80+x,240,100+x,240);//tail 1
  triangle(70+x,200,80+x,240,100+x,240);//tail 2
  triangle(90+x,200,80+x,240,100+x,240);//tail 3
  triangle(100+x,200,80+x,245,100+x,245);//tail 4
  fill(170,235,111);//greed
  arc(250+x,200,100,100,-PI/6,PI/6);//wing
  fill(255);//white
  ellipse(270+x,180,20,20);//eye
  fill(0);//black
  ellipse(270+x,180,10,10);//pupil
  strokeWeight(3);//thick
  if (walk == 0){//if that happens
    stepl=(stepl+2)%500;//left faster
  } else{//if not
    stepr=(stepr+2)%500;//right faster
  }//end if else
  line(180+x,310,160+stepl,370);//left leg
  line(165+stepl,355,170+stepl,370);//left foot 1
  line(165+stepl,355,150+stepl,370);//left foot 2
  line(180+x,310,200+stepr,370);//right leg
  line(195+stepr,350,210+stepr,370);//right foot 1
  line(195+stepr,350,190+stepr,370);//right foot 2
  strokeWeight(1);//thin
  if (abs(stepr-stepl) >= 35){//stride over?
    walk=(2-walk)%500;//yes, switch legs
  }//end if
  x=(x+1)%500;//body moves
}//end draw

