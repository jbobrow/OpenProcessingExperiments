
int grand = 40;
int pic = 5;
int speedA = 3;
int speedB = 2;
int speedC = 2;
int speedD = 3;
int ellipse_1x = 60;
int ellipse_1y = 60;
int ellipse_2x = 200;
int ellipse_2y = 150;

void setup(){
  size(400, 400);
  smooth();

}

void draw(){
  background(0);
  //faccia sorridente
    if (ellipse_1x >= 380 || ellipse_1x < 20) {
      speedA = speedA * -1;
    }
  ellipse_1x = ellipse_1x + speedA;
  
    if (ellipse_1y >= 380 || ellipse_1y < 20) {
      speedB = speedB * - 1;
    }
  ellipse_1y = ellipse_1y + speedB*2;
  
  //faccia triste
      if (ellipse_2x >= 380 || ellipse_2x < 20) {
      speedC = speedC * -1;
    }
  ellipse_2x = ellipse_2x + speedC;
  
    if (ellipse_2y >= 380 || ellipse_2y < 20) {
      speedD = speedD * -1;
    }
  ellipse_2y = ellipse_2y + speedD*2;
  

  strokeWeight(3);
 
  
    //cambio stato

  if(mousePressed){
    fill(255, 0, 0);
    ellipse(ellipse_1x, ellipse_1y, grand, grand);//faccia sorridente
    fill(0);
    ellipse(ellipse_1x, ellipse_1y+10, 15, 15);
    fill(0, 255, 0);
    ellipse(ellipse_2x, ellipse_2y, grand, grand);//faccia triste
    noFill();
    arc(ellipse_2x, ellipse_2y+10, 10, 10, 0, PI);
  } else {
    fill(255);
    ellipse(ellipse_2x, ellipse_2y, grand, grand);//faccia triste
    ellipse(ellipse_1x, ellipse_1y, grand, grand);//faccia sorridente
    arc(ellipse_1x, ellipse_1y+10, 10, 10, 0, PI);// bocca sorridente
     arc(ellipse_2x, ellipse_2y+15, 10, 10, PI, TWO_PI);//bocca triste
  }
  
  
  //occhi
  
  fill(0);
  ellipse(ellipse_1x-5, ellipse_1y-5, pic, pic);//occhio sinistro faccia sorridente
  ellipse(ellipse_1x+5, ellipse_1y-5, pic, pic);//occhio destro faccia sorridente
  ellipse(ellipse_2x-5, ellipse_2y-5, pic, pic);//occhio sinistro faccia triste
  ellipse(ellipse_2x+5, ellipse_2y-5, pic, pic);//occhio destro faccia triste

}

