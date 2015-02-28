
float R=0;
float X=0;
float Y=0;
boolean bg = true;
float neg=0;
float rd = 0;
float grn = 0;
float blu = 0;
float colorplus=0;
float colorspeed=1;
float plus=0;

void setup(){
  size(1020,720);
  smooth();
  rectMode(CENTER);
}

void draw(){
  noStroke();
 if(bg){ 
  fill(0,15);
  rect(width/2,height/2,width,height);
  }
  
  if (colorplus<0 || colorplus>250) { colorspeed*=-1; }
  colorplus+=colorspeed;
  
  strokeWeight(3);
  
  X+= (mouseX-X)/50;
  Y+= (mouseY-Y)/50;
  
  translate(X,Y);
  rotate(R);
  R+=.1/2;
  stroke(0,colorplus,255);
  
  for (int i=0; i<0+plus; i+=5)
  point(i,50);
  
  stroke(colorplus,0,255);
  translate(0,50);
  rotate(R*-.2);
  point(100,10);
  point(-100,10);
   
  rotate(R*neg);
  noStroke();
  fill(0+rd,0+grn,0+blu);
  ellipse(0,50,10,10);
  
  stroke(100,colorplus,0);
  rotate(R*(-1^4));
  point(15,0);
  
}

void keyPressed(){
  if (key==' '){
    if(bg){
      bg=false;
    } else {
      if(!bg){
        bg=true;
      }
    }
  }
  if (key=='q'){ neg+=-1; }
  if (key=='Q'){ neg+=1; }
  if (key=='a'){ rd+=10; }
  if (key=='A'){ rd+=-10; }
  if (key=='s'){ grn+=10; }
  if (key=='S'){ grn+=-10; }
  if (key=='d'){ blu+=10; }
  if (key=='D'){ blu+=-10; }
  if (key=='w'){ plus+=5; }
  if (key=='W'){ plus+=-5; }
  
   if (key=='p'){
    saveFrame("Tmfl.png");}
}

