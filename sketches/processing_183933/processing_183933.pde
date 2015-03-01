
int f=400;
int speed=10;


void setup(){
  size(400,400);
  smooth();
  frameRate(3);
}

void draw(){
  
  for(int x=0;x<800;x=x+10){
    for(int y=0;y<800;y=y+50){
      backGround(x,y);
    }
  }
  myLine();

  
  float o=random(255);
  if(f>200){
    fill(255,0,0);
  }
  if(f<=200){
    fill(132,112,255);
  }
  
  //body
  ellipse(200,f,70,180);
  rectMode(CENTER); 
  fill(193,205,193);
  rect(170,f+30,50,70);
  rect(230,f+30,50,70);
  fill(110,123,139);
  rect(175,f+30,20,70);
  rect(225,f+30,20,70);
  
  //small window
  fill(205,197,191);
  ellipse(200,f-35,40,40);
  fill(135,206,250);
  ellipse(200,f-35,20,20);
  //rect(175,f+70,50,30);
 
  
  f=f-speed;
  if(f<0){
    f=400;
  }
}

void myLine(){
  float g=random(255);
  stroke(0);
   strokeWeight(6);
  fill(g,255,g);
  rectMode(CENTER);
  rect(180,f+70,10,60);
  rect(190,f+70,10,60);
  rect(200,f+70,10,60);
  rect(210,f+70,10,60);
  rect(220,f+70,10,60);
  
  
  f=f-speed;
  if(f<-70){
    f=400;
  }
}



void backGround(int a, int b){
  float c=random(400);
   float d=random(255);
 
   
   //noStroke();
  ellipse(b,a,a,c);
  if(f>200){
  fill(d,d,255);
  }
  if(200>=f){
    fill(255,d,d);
  }
}
