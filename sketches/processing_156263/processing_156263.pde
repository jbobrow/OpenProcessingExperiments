
int diam;
int myColor;
int diameter;
int speed;

void setup(){
  size(600,600);
  diam = 100;
  speed = 30;
  noStroke();
  background(0);
  
 
}

void draw(){
  if( dist(mouseX,mouseY,width/2,height/2)<=diam/2){
  myColor=200;
  }
  if( dist(mouseX,mouseY,width/2,height/2)>diam/2 &&dist(mouseX,mouseY,width/2,height/2)<=diam){
  myColor=170;
  }
  if( dist(mouseX,mouseY,width/2,height/2)>diam &&dist(mouseX,mouseY,width/2,height/2)<=diam*3/2){
  myColor=130;
  }
  if( dist(mouseX,mouseY,width/2,height/2)>diam*3/2 &&dist(mouseX,mouseY,width/2,height/2)<=diam*4/2){
  myColor=100;
  }
  if( dist(mouseX,mouseY,width/2,height/2)>diam*4/2 &&dist(mouseX,mouseY,width/2,height/2)<=diam*5/2){
  myColor=70;
  }
  if( dist(mouseX,mouseY,width/2,height/2)>diam*5/2 &&dist(mouseX,mouseY,width/2,height/2)<=diam*6/2){
  myColor=40;
  }

  
  fill(myColor-speed*4,0,myColor-speed*4);
   ellipse(width/2,height/2,diam*5,diam*5);
  
  fill(myColor-speed*3,0,myColor-speed*3);
   ellipse(width/2,height/2,diam*4,diam*4);
  
   fill(myColor-speed*2,0,myColor-speed*2);
   ellipse(width/2,height/2,diam*3,diam*3);
  
   fill(myColor-speed,0,myColor-speed);
   ellipse(width/2,height/2,diam*2,diam*2);
   
   fill(myColor,0,myColor);
   ellipse(width/2,height/2,diam,diam);
   

}


