
int x,y;


void setup(){
size(400,400);
background(200);


}

void draw(){
  noStroke();
  fill(255);
  ellipse(200,200,400,400);//big circle
 
  fill(200,225,255,100);
  ellipse(0,0,400,400);
  
  fill(200,225,255,100);
  ellipse(400,0,400,400);
  
  fill(200,225,255,100);
  ellipse(0,400,400,400);
  
  fill(200,225,255,100);
  ellipse(400,400,400,400);//half circle
  
  fill(25,285,235,60);
  ellipse(200,200,sqrt(2)*200,sqrt(2)*200);//small circle
  
  fill(0,220,130,50);
  rectMode(CENTER);
  rect(200,200,sqrt(2)*200,sqrt(2)*200);//second rect
 
  fill(100,250,19,100);
  rectMode(CENTER);
  rect(200,200,(400-sqrt(2)*200),(400-sqrt(2)*200));//center rect
  
  
  
  x=mouseX;
  y=mouseY;
  
  if(x>100*sqrt(2)&&x<400-100*sqrt(2)&& y>100* sqrt(2)&&y<400-100*sqrt(2)){
    fill(255,255,240,90);
    ellipse(x,y,20,20);
    textSize(90);
    text("!",185,230);
   
   
  
  }
  else if(x>200-100*sqrt(2)&&x<200+100*sqrt(2)&&y>200-100*sqrt(2)&&y<200+100*sqrt(2)){
    background(202,0,190);
    fill(0);
    line(200,200,x,y);
  }
  else{
    background(0,0,1);
  }

  fill(100,200,19,20);
  translate(width/2,height/2);
  rotate(PI/4);
  rect(0,0,sqrt(2)*200,sqrt(2)*200);//rotate rect


}


