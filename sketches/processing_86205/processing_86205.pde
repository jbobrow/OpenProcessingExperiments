
void setup(){
   colorMode(HSB,360,100,100);
  size(500,500);
  background(250,100,30);
  smooth();
  for(int j=0;j<=100;j++){
    fill(255);
    noStroke();
    ellipse(random(500),random(500),random(0,2),random(0,2));
  }
 
}
int i=0;
boolean val;
int x1=0,y1=0,x2=0,y2=0;
int tempX,tempY;


void draw(){
  
  if(val==true)
  { x2=x1;y2=y1;
    tempX=mouseX;
    tempY=mouseY;
    x1=tempX;
    y1=tempY;
   
    int r=(int)random(5,30);
    int b=(int)random(70,100);
    
    noStroke();
    if(i==0){
      fill(236,40,b);
      ellipse(x1,y1,r,r);
      i=1;
    }
    else{
      fill(236,40,b);
      ellipse(x1,y1,r,r);
      
      stroke(255);
      line(x1,y1,x2,y2);
      i++;
    }
 
    val=false;
  }
  if(mousePressed&&mouseButton==RIGHT){
    i=0;
  }
  
}
 


void mouseClicked(){
  val=true;
  
} 


