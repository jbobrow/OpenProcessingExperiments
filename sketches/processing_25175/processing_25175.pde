
float x;
float y=100;
float xspeed= +5;
float yspeed= 5;

void setup(){
  size(500,500);
  background(0);
  x=0;
  y=0;
}

void draw(){
  background(0);
  
  if(x>=480){
    xspeed=-5;
    
  }
  if(x<=20){
    xspeed=+5;
   
  }
    if(y>=480){
    yspeed=-7;
    
  }
  if(y<=20){
    yspeed=+7;
   
  }

  
  
  
  x=x+xspeed;
  y=y+yspeed;
  fill(x,y,random(255));
  rect(y,10,10,x+10);
  rect(120,10,10,x+30);
  rect(230,10,10,x+50);
  rect(y+40,10,10,x+70);
  rect(450,10,10,x+90);
  rect(y+180,10,10,x+110);
  rect(y+270,10,10,x+130);
  rect(380,10,10,x+150);
  rect(490,10,10,x+170);
  rect(y+100,10,10,x+190);
  rect(y+30,10,10,x+210);
  rect(90,10,10,x+230);
  rect(110,10,10,x+250);
  rect(y*2,10,10,x+270);
  rect(300,10,10,x+290);
  
  rect(10,x,y+10,10);
  rect(30,420,y+30,10);
  rect(110,150,y+50,10);
  rect(50,450,y+70,10);
  rect(90,x+30,y+90,10);
  rect(210,x+130,y+110,10);
  rect(10,390,y+130,10);
  rect(300,x*2,y+150,10);
  rect(180,x+39,y+170,10);
  rect(250,x*10,y+190,10);
  rect(300,x-190,y+210,10);
  rect(2100,x+80,y+230,10);
  rect(180,200,y+250,10);
  rect(80,290,y+270,10);
  rect(20,x+110,y+290,10);


  
  
}


