
float explosionX = 0;
float explosionY = 0;
float explosionW = 0;
float explosionV = 0;
float explosionT = 0;
float explosionU = 0;
float building1Height = 400;
float building1Y = 400;
float building2Height = 600;
float building2Y = 200;
float building3Y = 400;
float building4Height = 500;
float building4Y = 350;
float building5Height = 300;
float building5Y = 450;
float building6Height = 200;
float building6Y = 550;

void setup() {
  size(1000,1000);
  //background(0);
  smooth();
}

void draw(){
  background(0);
  fill(150);
  rect(200,building1Y,80,building1Height);
  triangle(200,building1Y,240,building1Y-50,280,building1Y);
  rect(400,building2Y,100,building2Height);
  rect(445,building2Y-100,10,100);
  quad(600,800,600,building3Y,680,building3Y-100,680,800);
  fill(90);
  rect(830,building4Y,100,building4Height);
  fill(110);
  rect(800,building5Y,100,building5Height);
  fill(150);
  rect(882,building6Y,100,building6Height);
  fill(255,255,0);
  strokeWeight(0);

  
  fill(0,255,0);
  ellipse(500,1000,2000,800);
  fill(200);
  ellipse(mouseX,mouseY,50,50);
  fill(0);
  ellipse(mouseX-10,mouseY-10,5,5);
  ellipse(mouseX+5,mouseY+15,15,15);
  ellipse(mouseX+10,mouseY-5,10,10);
  if(((mouseX>200 && mouseX<280)||(mouseX>400 && mouseX<500)||(mouseX>600 && mouseX<680)||(mouseX>810 && mouseX<980)) && ((mouseY>400 && mouseY<650)||(mouseY>200 && mouseY<650)||(mouseY>350 && mouseY<600)||(mouseY>350 && mouseY<650))){
  
          fill(255,0,0);
    ellipse(mouseX,mouseY,explosionX,explosionY);
    if(explosionX < 250){
      explosionX=explosionX+3;
    explosionY=explosionY+3;
    } else{
    explosionX=explosionX;
    explosionY=explosionY;
    }
    fill(255,135,0);
    ellipse(mouseX,mouseY,explosionW,explosionV);
    if(explosionW <200){
    explosionW = explosionW+2;
    explosionV = explosionV+2;
    } else{
      explosionW=explosionW;
      explosionV=explosionV;
    }
    fill(255,255,0);
    ellipse(mouseX,mouseY,explosionT,explosionU);
    if(explosionT <150){
    explosionT++;
    explosionU++;
    }else{
     explosionT = explosionT;
    explosionU=explosionU; 
    }
  }else{ 
    explosionX = 0;
    explosionY = 0;
    explosionW = 0;
    explosionV = 0;
    explosionU = 0;
    explosionT = 0;
  };
  
  if(mouseX>200 && mouseX<280 && mouseY>400 && mouseY<650){
  if(building1Height>0){
    building1Y=building1Y + 1;
  building1Height = building1Height -2;
  }
  }else{
  building1Y=400;
  building1Height=400;
  }
  
    if(mouseX>400 && mouseX<500 && mouseY>200 && mouseY<650){
  if(building2Height>0){
    building2Y=building2Y + 3;
  building2Height = building2Height -3;
  println(building2Height,building2Y);
  }
  }else{
  building2Y=200;
  building2Height=600;
  }
 
   if(mouseX>600 && mouseX<680 && mouseY>400 && mouseY<650){
  if(building3Y<650){
    building3Y=building3Y + 2;
  }
  }else{
  building3Y=400;
  }
 
   if(mouseX>810 && mouseX<980 && mouseY>350 && mouseY<650){
  if(building4Height>0){
    building5Y=building5Y + 2;
  building5Height = building5Height -3;
    building4Y=building4Y+3;
    building4Height = building5Height -3;
    building6Y++;
    building5Height--;
  }
  }else{
  building5Y=400;
  building5Height=400;
  building4Y=350;
  building4Height=500;
  building6Y=550;
  building6Height=200;
  }
 
}

void keyPressed(){
    if(key=='s'){
      saveFrame();
    }
} 
