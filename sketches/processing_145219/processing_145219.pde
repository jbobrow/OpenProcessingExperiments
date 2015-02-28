

int _x;
int _y;
int velX;
int velY;

int colorback;
void setup(){
size(600,600);
  _x = width/2;
  _y = height/2;
  velX = 3;
  velY = 1;

}

void draw(){
background(colorback);

//posició
  _x = _x+velX;
  _y = _y+velY;
  
strokeWeight(0);
stroke(0,0,0);



stroke(255,160,5);
fill(255,160,5);
ellipse(_x-60,_y+155,width*0.08,height*0.2);


ellipse(_x+60,_y+155,width*0.08,height*0.2);


stroke(0,0,0);
fill(0,0,0);
ellipse(_x,_y-150,width*0.3,height*0.4);


rectMode(CENTER);
rect(_x,_y,width*0.3,height*0.5);


stroke(255,255,255);
fill(255,255,255);
rectMode(CENTER);
rect(_x,_y+60,width*0.2,height*0.3);


ellipse(_x,_y-20,width*0.2,height*0.4);


ellipse(_x-40,_y-200,width*0.1,height*0.1);


ellipse(_x+40,_y-200,width*0.12,height*0.12);


stroke(0,0,0);
fill(0,0,0);
ellipse(_x+30,_y-190,width*0.05,height*0.05);


ellipse(_x-30,_y-190,width*0.03,height*0.03);


stroke(255,160,5);
fill(255,160,5);
triangle(_x-30,_y-160,_x+30,_y-160,_x-20,_y-110);


stroke(0,0,0);
fill(0,0,0);
triangle(_x-90,_y-130,_x-90,_y-80,_x-160,_y-40);


triangle(_x+90,_y-130,_x+90,_y-80,_x+160,_y-40);


//posició X
if((_x-160<0) || (_x+160>width)){
  velX = -velX;
}
//posició Y
if((_y-270<0) || (_y+215>height)){
  velY = -velY;
}


  if(((_x > 0)&&(_x < width/2))&&((_y > 0)&&(_y < height/2))){
    colorback= color(183,164,164);
  }
  
  if(((_x > width/2)&&(_x < width))&&((_y > 0)&&(_y < height/2))){
    colorback= color(100,219,170);
  }
  
  if(((_x > width/2)&&(_x < width))&&((_y > height/2)&&(_y < height))){
    colorback= color(230,119,245);
  }
  
  if(((_x > 0)&&(_x < width/2))&&((_y > height/2)&&(_y < height))){
    colorback= color(209,179,11);
  }
 

}

void mousePressed(){
 _x=width/2;
 _y=height/2;
}

