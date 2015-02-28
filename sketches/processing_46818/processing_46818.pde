
void setup() {
size(600,600);
smooth();
}

//float randomgod=random(255);
  
void draw () {
background (0);
randomSeed(1);
noCursor();


float randomgod=random(255);
  
int xmaster=65;
int ymaster=70;
 
for(int j=1; (j*xmaster)<height; j++){
for(int i=1; i*ymaster<width; i++){
     
maennlein(xmaster*j,ymaster*i,random(255),random(255),random(255));

stroke(200,0,0);
noFill();
ellipse(mouseX,mouseY,15,15);
line(mouseX+10,mouseY,mouseX-10,mouseY);
line(mouseX,mouseY+10,mouseX,mouseY-10);

}
}
}
//float mausx,float mausy,
//mouseX/( width/15 ),mouseY/( height/15),
  
void maennlein(float x,float y,float aag, float bag, float cag) {
  
  float mausx=0;
  float mausy=0;
  
  float mausfolgerx=x-27.5;
  
  float mausfolgery=y-45;
  
  int maul1=0;
  int maul2=0;
  int augenweiter=0;
  
  if (mausfolgerx<mouseX){mausx=10;}
  if (mausfolgerx>mouseX){mausx=0;}
  if (mausfolgery<mouseY){mausy=10;}
  if (mausfolgery>mouseY){mausy=0;}
  
  if (mausfolgery+30>=mouseY){ if (mausfolgery-30<=mouseY){mausy=5;}}
  if (mausfolgerx+30>=mouseX){ if (mausfolgerx-30<=mouseX){mausx=5;}}
  
  if (mausfolgerx+30>=mouseX){ if (mausfolgery+30>=mouseY){if (mausfolgerx-30<=mouseX){ if (mausfolgery-30<=mouseY) {
  mausx=5;
  mausy=5;
  maul1=25;
  maul2=10;
  augenweiter=3;
   }}}}
  
  
  noStroke();
  fill(aag,bag,cag);
  rect(x-40,y-50,40,45);//koerper
  rect(x-47,y-33,4,25);//arm1
  rect(3+x,y-33,4,25);//arm2
  rect(x-29,y-5,4,15);//bein1
  rect(x-14,y-5,4,15);//bein2
  fill(0);
  rect(x-35+mausx,y-45+mausy,5+augenweiter,4+augenweiter);//auge1
  rect(x-18+mausx,y-45+mausy,5+augenweiter,4+augenweiter);//auge2
  rect(x-30,y-24,22,5);//mund
  ellipse(x-19,y-22,maul1,maul2);//mund2
  

  }
  
 

