
int rectX;
int rectY;
int rectW;
int rectH;
int richting;
int score;

boolean gameover;

void setup() {
  size(400,400);
  rectX = 0;
  rectY = 10;
  rectW = 100;
  rectH = 100;
  richting = 10;
  score = 0;
  gameover = false;
}

void draw() {
  background(255);

    if(rectX>300||rectX<0){
  richting = -richting;
  score=score+1;
  }
  
  if(score==10){
   gameover=true;
  }
  
  if(gameover==false){
  fill(255,0,0);
  }
  
  if(gameover==true){
    fill(0,255,0);
  }
  

  
  rect(rectX,rectY,rectW,rectH);
  rectX=rectX+richting;
  

  
println(score);
println(gameover); 
}
