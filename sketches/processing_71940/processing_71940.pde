
PImage bg = loadImage("d1TSL.gif");
PImage calvin = loadImage("calvin1.gif");
size(600, 421);
float angle = 0.0;


image(bg,0,0);

for (int x=0;x<=width;x+=40) {
  float y = 50 + (sin(angle)*95.0);
  if(x%120==0){tint(255,50);}else{tint(150,x,y,150);}
  image(calvin,x,y,(x-y),y);
  angle +=PI/40.0;
  
}


