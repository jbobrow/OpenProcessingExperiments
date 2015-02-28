
//if statements, for loops, response

int timer = 0; 
float fX= 200;
float fY= 200;
float eX= 250;
float eY= 250;
float pX= 300;
float pY= 300;
float easing= .03;
color pColor = color(#F2D702);

void setup(){
  size(500,500);
  frameRate(24);
}

void draw(){
  background(0);
   bGround();
  food();
  player1();
  collisions();
 

}

void food(){
 //respawn
  timer++;
  if(timer >= 48){
    fX = random(width);
    fY =random(height);
    timer = 0;
}
fill(#02D33F);
  ellipse(fX, fY, 30,30);

}

void player1(){
float targetX=mouseX;
float targetY= mouseY;
pX += (targetX - pX) * easing;
pY += (targetY - pY) * easing;
fill(pColor);
ellipse(pX,pY,30,30);
}

void collisions(){
  float pDist = dist(pX,pY,fX,fY);
  if(pDist<= 30){
    pColor = color(#F27F02);
  }else{
    pColor = color(#F2D702);
  }
}
void bGround(){
    for(int i = 0; i< width; i += 50){
      for(int j = 0; j <height; j +=50){
        fill(#C6FFF7);
        rect(i,j,50,50);
      }
    }
}


