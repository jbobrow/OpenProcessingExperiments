
int numballs=50;

PImage bg;
float[] xPos= new float[50];
float[] yPos= new float[50];
float x, y; 
float[] xMov = new float[50]; 
float[] yMov = new float[50]; 
float[] speed= new float[50];
float[] s= new float[50];
int num;


//random means number will limited under 255//
float[] r = new float[50];
float[] g = new float[50]; 
float[] b = new float[50]; 


boolean isGoingRight= true;
boolean isGoingDown= true;



void setup(){
  size(720,482);
  
  bg = loadImage("bg.jpg");
  bg.resize(720,482);
  x=20.0;
  y=20.0;

for (int i=0; i< 50;i++){
  xPos[i] = random(720);
  yPos[i] = random(482);  
  xMov[i] = 5;
  yMov[i] = 5; 
  
  r[i]= random(255);
  g[i]= random(255);
  b[i]= random(255);
  speed[i]=1;
  s[i]=10;
  }
}


void draw(){
  
  
  imageMode(CORNER); 
  image(bg,0,0);
  
for(int i=0; i < 50; i++){ 
  

  
  xPos[i] = xPos[i] + xMov[i];
  yPos[i] = yPos[i] + yMov[i];


  ellipseMode(CENTER);
  fill(r[i], g[i], b[i]);
 //fill(under 50, under 50, under50);//
  noStroke();
  ellipse(xPos[i], yPos[i], s[i], s[i]);


if (xPos[i] > 720 || xPos[i] < 0){
  //when ball hit the wall, it will bounce (-1)and change color//
  //xMov[i] += random(5);//
  speed[i] = random(-3,3); 
  num++;
  println(num);  
  
  
  if(xMov[i] > 0){
    xMov[i] += speed[i]; 
  }else{
    xMov[i] -= speed[i]; 
  }
  
  xMov[i] = xMov[i] * -1 ; 
  r[i] = 255 - r[i]; 
  g[i] = 255 - g[i];  
  b[i] = 255 - b[i];
  
  s[i]=random(100);
  
}
  //the height is limited to 0 to 482//
if (yPos[i] > 482 || yPos[i] < 0){
  
  //the height is limited to 0 to 482//
  //yMov[i]+= random(5);
  speed[i] = random(-3,3);
  num++;
  println(num);  
  //if the speed is negative then i have to give it more instruction//
  //seems like aps but if/else can make it work//
  
  if(yMov[i] > 0){
    yMov[i] += speed[i];
    
  }else{
    yMov[i] -= speed[i]; 
  }
  
  
  yMov[i] = yMov[i] * -1 ;
  r[i] = 255 - r[i]; 
  g[i] = 255 - g[i];  
  b[i] = 255 - b[i];
  
  s[i]=random(100);
  
}

}  

}

