
int xpos = 0;
 int ypos = 50;
 float cala = 0;
float num;
int step =5;
void setup(){
  size(500,500);
  background(0);
  
  
}

void draw(){
  cala = random(0,255);
  fill(0,0,random(255),0);
  rect(0,0,500,500);
  noStroke();
  fill(255);
  fill(0,cala,cala);
  ellipse(xpos,ypos,100,100);
   fill(cala,0,cala);
  ellipse(xpos+150,ypos+150,100,100);
   fill(cala,cala,0);
  ellipse(xpos+300,ypos+300,100,100);
   xpos = xpos+step;
   if(xpos >400){ypos=ypos+5;}
   if(xpos <0 ){ypos=ypos+5;}
   if(xpos>450){
     step = step* -1;}
    
   if(xpos<0){
     step=step +1;}
     if(ypos>400){ypos=ypos-400;}
  
     num = random(0,100);
   fill(0,random(255),random(255),1);
   rect(50,50,400,400);
     fill(0,random(255),random(255),5);
   rect(100,100,200,200);
     fill(0,random(255),random(255),10);
   rect(150,150,50,50);
   fill(random(255),random(255),random(255),25);
   rect(random(0,400),random(0,400),num,num);
   noStroke();
}

