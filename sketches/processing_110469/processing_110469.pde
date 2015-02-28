
float x=100, y=100, e=100, f=100;
float xSpeed= random(2,6);
float ySpeed= random(2,6);
int q=5;
int w=0;
int o=30;
boolean flag = true;
boolean pt = true;
boolean bt = true;
PImage img;

void setup(){

img = loadImage("red_skull.jpg");
size(300,300);
noStroke();
noCursor();
}

void draw(){
  fill(0,40);  
  rect(0,0,width,height);

  for (int i = 0; i < 300; i++) {
  float r = random(300);
  float a = random(255);
  float b = random(255);
  float c = random(255);
  fill(a,b,c,150);
  ellipse(r,i, 10, 10);
}
  fill(255);
  ellipse(x,y,10,10);
textSize(12);  
  text("10 points for an extra life",60,20);
  x= x+xSpeed;
  y= y+ySpeed;
  
  
  if(w==10){
    w=w*0;
    q++;
  }  

 if (x>width-5||x<5){
    xSpeed = -xSpeed;
  }
  
  if(y>width-5||y<5){
    ySpeed = -ySpeed;
  }
  fill(255);
  rect(mouseX,270,o,5);
  if ((x <= mouseX+o && x>= mouseX)&&(y>=270)){
    ySpeed = -ySpeed;
}
 if ((x <= mouseX+o && x>= mouseX)&&(y>=270)){
    if(pt){
      w++;      
      pt = false;
    }
 }
 else{
   pt = true;
 } 
 
 if ((x <= mouseX+30 && x>= mouseX)&&(y>=270 && o>12)){
    if(bt){
      o=o-2;      
      bt = false;
    }
 }
 else{
   bt = true;
 } 
  textSize(20);
  text("Points="+w,90,80);
  if ((y>275)&&(q>0)){    
    if (flag){
      q--;
      flag = false;
    }
  }else {
    flag = true;
  }
  textSize(30);
  if(q<3){
    fill(255,0,0);
    text("life="+q,90,50);
    
  float k = random(300);
  float l = random(300);
  fill(255,0,0);
  textSize(20);
  text("Danger!",k,l);
  text("Danger!",l,k);
}
  else{
    fill(255);
    text("life="+q,90,50);
  }
  
  if (q ==0){
    image(img, 0,0,300,300);
  
  for (int u = 0; u < 300; u++) {
  float s = random(300);
  fill(255,0,0,80);
  ellipse(u,s, 10, 10);  
}
    fill(255);
    textSize(30);
    text("Game Over!",70,150);
    
  }
  }


