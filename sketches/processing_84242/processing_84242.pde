
int counter=0;
int ccounter=0;
float w = 10;
float h = 10;
float centerx = 200;
float centery = 200;
float hue;
float angle=0;
int vert_am=10;
int hor_am=10;
float vert_step;
float hor_step;
 
void setup() { 
  size(500, 500);
  hue=random(255);
  background(255); 
  colorMode(HSB,360,100,100);  
   hor_step= width/hor_am;
   vert_step=height/vert_am;
}
float rnd(){
    return random(150)-70;
}
void draw() { 
 noStroke();   
  fill(15,5);  
  rect(0,0,width,height);
    for(i=0;i<hor_am;i++){
    for(j=0;j<vert_am;j++){
  if(random(1.0)>.93){
  centerx=hor_step*i+hor_step/2;
  centery=vert_step*j+vert_step/2;
  counter+=.01;
  ccounter=150;
  if(random(1.0)>.99){
  hue=random(255);
  }
 
  
  fill(173,83,84);
  
  //stroke(255);
  strokeWeight(2);    
  angle=random(TWO_PI);
  angle=random(TWO_PI);
  w=h=random(20)+1;
quad(centerx+sin(angle)*w, centery+cos(angle)*h, centerx+sin(angle+radians(90))*w, centery+cos(angle+radians(90))*h,centerx+sin(angle+radians(180))*w, centery+cos(angle+radians(180))*h,centerx+sin(angle+radians(270))*w, centery+cos(angle+radians(270))*h);
    }
    }
    }
   
}
