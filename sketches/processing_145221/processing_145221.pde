
int _x;
int _y;
int velX;
int velY;




void setup(){
  


size(700,700);
  _x = width/2;
  _y = height/2;
  velX = 3;
  velY = 1;
}

void draw (){
  


int a;
int b;
a=width/2;
b=height/2;
 
background(5,219,247);
 
 //posicio
  _x = _x+velX;
  _y = _y+velY;
fill(67,191,6);


//orellas
ellipse(_x-120,_y-230,a/3.5,b/3.5);
ellipse(_x+100,_y-240,a/4,b/4);

 //rellenoorelles
fill(0,0,0);
ellipse(_x-120,_y-230,a/5,b/5);
ellipse(_x+100,_y-240,a/6,b/6);
 rotate(-0.05);
fill(67,191,6);

 
 //cap
 ellipse(_x,_y,a+a/2,b+b/4);
fill(255,255,255);
 
 //ellpseulls
 ellipse(_x-180,_y-10,a/3.25,b/3.25);
ellipse(_x+190,_y-20,a/3.25,b/3.25);
rotate(-0.05);

 //nas
fill(93,242,20);
 ellipse(_x,_y+20,a/1.60,b/2.20);
 
 
 //foratsnas
fill(5,5,5);
ellipse(_x+35,_y+20,a/7,b/6);
ellipse(_x-35,_y+20,a/7,b/6);
noStroke();
 
 //bolasulls
fill(5,5,5);
ellipse(_x+195,_y-20,a/12,b/12);
ellipse(_x-175,_y+10,a/12,b/12);
noCursor();


//posicio X
  if((_x-240<0)||(_x+280>width)){
    velX = -velX;
  }
    //posicio Y
  if((_y-280<0)||(_y+200>height)){
    velY = -velY;
  }
   
}

void mousePressed(){
 _x=width/2;
_y=height/2;
}
