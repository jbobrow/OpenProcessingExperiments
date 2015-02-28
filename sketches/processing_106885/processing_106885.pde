
int x=20;
int y=30;

int dx=0;
int dy=0;


void setup() {  //setup function called initially, only once
    size(300,300);
}

void draw() {  //draw function loops 
     ellipse(x,y,20,20);
  if(key=='d'){
  dx=1;
  }
  if (key=='s'){
  dy=1;
  }
  if (key=='a'){
  dx=-1;
  }
  if (key=='w'){
  dy=-1;
  }
  
  
  if(key=='h'){
  dx=1;
  dy=0;
  }
  if (key=='g'){
  dy=1;
  dx=0;
  }
  if (key=='f'){
  dx=-1;
  dy=0;
  }
  if (key=='t'){
  dy=-1;
  dx=0;
  }
  
  
  
  x=x+dx;
  y=y+dy;
}
