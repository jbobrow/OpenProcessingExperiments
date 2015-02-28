
int posX;
int water;
int level;
int count=0;

void setup(){
  size(500,500);
  smooth();
  
  posX=width/2-20;
  level =0;
  water=0;
  
}

void draw(){
  
  if(level==0){
  drawBackgroundImage();
  
  drawMan(posX);
  
  if(count==0){
    manRight();
  }
  
  if(keyPressed){
    if(key ==CODED){
       if(keyCode ==LEFT){
         count=1;
       }else if(keyCode==RIGHT){
         count=0;
       }  
    } 
  }
  
  if(count==1)
    manLeft();
  
  if(posX > width/2+150 || posX < width/2-150)
      level=1;
  }else if(level==1){
    fill(#2C61E3);
    rect(0,400-water, width,height-400+water);
    water+=10;
    
    fill(255);
    textAlign(CENTER,CENTER);
    textSize(50);
    text("GAME OVER", width/2,height/2);
  }
  
  
}

void drawBackgroundImage(){
  background(#B7F7FF);
  
  noStroke();
  fill(255);
  ellipse(50,50,50,50);
  ellipse(80,30,40,40);
  ellipse(90,80,50,50);
  ellipse(90,60,50,50);
  ellipse(120,65,60,50);
  ellipse(110,30,30,30);
  
  int i=100;
  ellipse(50+i,50+i,50,50);
  ellipse(80+i,30+i,40,40);
  ellipse(90+i,80+i,50,50);
  ellipse(90+i,60+i,50,50);
  ellipse(120+i,65+i,60,50);
  ellipse(110+i,30+i,30,30);
  
  i=300;
  ellipse(50+i,50,50,50);
  ellipse(80+i,30,40,40);
  ellipse(90+i,80,50,50);
  ellipse(90+i,60,50,50);
  ellipse(120+i,65,60,50);
  ellipse(110+i,30,30,30);
  
  fill(#A56B2D);
  rect(width/2-10,130,20,230);
  
  //land//
  fill(#F0E68F);
  ellipse(width/2, 410, 300,100);//X:width/2-150 ~ width/2+150
  
  fill(#2C61E3);
  rect(0,400, width,height-400);
  
  fill(#15CB3D);
  ellipse(200,200,150,30);
  ellipse(300,150, 150,20);
  ellipse(210,130, 130,30);
  ellipse(310,180,150,30);
  ellipse(230,165,100,20);
  ellipse(260,120,80,25); 
}

void drawMan(int posX){
  int x;
  x=posX;
  

  fill(0);
  rect(x,330,40,40);
  
}

void manRight(){
  posX++;
}

void manLeft(){
  posX--;
}


