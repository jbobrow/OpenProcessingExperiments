
int x = 0;
int y = 0;
int count = 0;
int hit =0;
int score =0;
float []coordX=new float[1000];
float []coordY=new float[1000];
boolean startScreen = true;
void setup(){
size(500,500);

for(int i=0;i<1000;i++){
coordX[i] = random(500);
coordY[i] = random(500);
}
}


 
  
void draw(){
  if (startScreen==true) {
    background(0,0,0);
textSize(26); 
    text("SNAKE GAME",200,100);
    textSize(14);
    text("This m is where you use your arrow keys to control a snake",70,200); 
    text("the snake is trying to eat pellets that make your score bigger",70,230);
    text("keep geting pellets untill you reach the max of 1000 :)",60,260);
    text("press mouse to start",150,400);
    text("V 0.1",430,470);
    } else {
     //  main game
    //clear(); 
    
    println("iN");



if (count == 1){
rnd(hit);
count = 0;
}
  
if(score == 100){
background(0,0,0);
text("You Win",250,250);
}
  if (keyPressed) {
    background(0,0,0);
   //for(int k=0;k<20;k++){
    if(x>coordX[hit]-15 && x<coordX[hit]+15 && y>coordY[hit]-45 && y<coordY[hit]+45 ){

      
fill(0);
ellipse(coordX[hit] ,coordX[hit],10,10);
fill(255);
//hit = hit+1;
rndNew(hit+1);
}else{
    //ellipse(90 ,300,10,10);
    rnd(hit);
     text("score: "+score, 400,35);
}
//left
    if (key==CODED) {
      if(keyCode == 37){
        if(x<0){
          x=500;
        }
        fill(43,255,3);
       rect(x=x-5,y,10,75);
      
       

    }
  }
  }

  if (keyPressed) {
    if (key==CODED) {
      if(keyCode == 39){
        if(x>500){
          x=0;
        }
         fill(43,255,3);
       rect(x=x+5,y,10,75);
      
    }
  }
  }
  if (keyPressed) {
    if (key==CODED) {
      if(keyCode == 40){
        if(y>500){
          y=0;
        }
         fill(43,255,3);
       rect(x,y=y+5,10,75);
        
      }
    }
  }

   if (keyPressed) {
    if (key==CODED) {
      if(keyCode == 38){
        if(y<0){
          y=500;
        }
         fill(43,255,3);
      rect(x,y=y-5,10,75);
      
      }
    }
  }
  //
  rect(x,y,10,75);
  }
}

void rnd(int j){
  ellipse(coordX[j],coordY[j],10,10);

}
void rndNew(int k){
  ellipse(coordX[k],coordY[k],10,10);
  score++;
hit++;
} 
void mouseClicked() {
  
  if (startScreen==true) 
  background(0,0,0);
    startScreen = false;
}


