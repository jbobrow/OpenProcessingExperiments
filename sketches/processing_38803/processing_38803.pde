
int is = 14;

PVector [] k=new PVector [is];

int w = 255;
int h= 255;

void setup(){
  size(w,h,JAVA2D); 
  smooth();
  for (int i = 0;i<is;i++){
    k[i]=new PVector (0,0,0); 
  }
  ellipseMode(CENTER);
}
void draw(){
  fill(255,0,0,5);
  rect(0,0,w,h);
  fill(255);

  move();  
  for (int i = 0;i<hit;i++){
    k[i].z++;
    if(k[i].z>128)k[i].z=0;
    fill(255,111);

    ellipse(k[i].x,k[i].y,k[i].z,k[i].z);
  }
}
int [] pass=new int[is];
int hit;
void mouseReleased(){


  if(hit>is)hit=0;
  k[hit]=new PVector (mouseX,mouseY,0);
  hit++;
}

void move(){
  for (int i = 0;i<hit;i++){
    pass[i]++;
    if(pass[i]<255)pass[i]=0;
  }
}



