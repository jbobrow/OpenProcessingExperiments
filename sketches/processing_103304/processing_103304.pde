
// copyright julie baldassano july 13
float dtx,tx,ty,dim;
float rectX, rectY, xVel, yVel, rectWidth=50;

void setup ()
{
  translate (200,200);
  size(400,400);
  background(100,90,230);
  rectMode(CENTER);
  tx=width*.5;
  ty=height*.5;
  dim=width*.10;
  dtx=200;
  xVel = 1;
  yVel = 1;
  rectX = width/4;
  rectY = height/4;
}

void draw()
{
  //background(100,90,230);
  if (mousePressed){
    rectX=mouseX;
    rectY=mouseY;
    if (mouseX - pmouseX > 0)
      xVel = mouseX - pmouseX;
    if (mouseY - pmouseY > 0)
      yVel = mouseY - pmouseY;
    
}
  else{
    rectX += xVel;
    rectY += yVel;
  }
   fill(0,255,0);
   rect(rectX, rectY, rectWidth, rectWidth);
  if ((rectX<rectWidth/2) || (rectX>width-rectWidth/2)) xVel = -xVel;
  if ((rectY<rectWidth/2) || (rectY>height-rectWidth/2)) yVel = -yVel;
  fill(200,255,255,15);
  rect(width*.5,height*.5,width,height);
  fill(0,0,255);
  rect(tx,ty,dim*2,dim*2);
  fill(255,0,200);
  rect(tx,ty,dim*1.3,dim*1.3);
  fill(255,255,0);
  rect(tx,ty,dim*.66,dim*.66);
  ty++;
  tx++;
  if(tx>width)
  {
    tx=0;
  }
  if(ty>height)
  {
    ty=0;
  }
  
}


