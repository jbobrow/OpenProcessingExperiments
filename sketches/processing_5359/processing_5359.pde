

void setup() 
{
  size(400, 400);  
  stroke(0);     
  frameRate(60);
  smooth();
}

float yb = 150;
float xb=   250;
float xj=random(0,400);
float yj=random(0,400);
float vxb=random(-5,5);
float vyb=random(-5,5);
float vxj=random(-5,5);
float vyj=random(-5,5);


void draw() 
{ 
  fill(250,20);
  rect(0,0,400,400);
  xj=xj+vxj;
  yj=yj+vyj;

  xb=xb+vxb;
  yb=yb+vyb;
  vxj=vxj+(xb-xj)/abs(xb-xj);
  vyj=vyj+(yb-yj)/abs(yb-yj);

  if(vxb<vxj||vxb>vxj){ 
    vxb=vxb-vxj/abs(vxj);
    vyb=vyb-vyj/abs(vyj);
    vxb=vxb+random(-1,2);
  }
  else{ 
    vxb=vxb+random(-1,6);
    vyb=vyb+random(-1,1);
  }
  if((abs(vxb))>7){
    vxb=vxb*0.90;
  }
  if((abs(vyb))>7){
    vyb=vyb*0.90;
  }
  if((abs(vxj)+abs(vyj))>14){
    vxj=vxj*0.9;
    vyj=vyj*0.9;
  }
  if (xj<0){ 
    xj=400;
  }
  if (yj<0){ 
    yj=400;
  }
  if (xb<0){ 
    xb=400;
  }
  if (yb<0){ 
    yb=400;
  }
  if (xj>400){ 
    xj=0;
  }
  if (xb>400){ 
    xb=0;
  }
  if (yj>400){ 
    yj=0;
  }
  if (yb>400){ 
    yb=0;
  }
  fill(0);
  ellipse(xj,yj,20,20);
  fill(200);
  ellipse(xb,yb,20,20);
  delay(20);

}








