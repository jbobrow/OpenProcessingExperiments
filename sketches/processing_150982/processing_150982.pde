
ArrayList<Integer> Simon;
//ArrayList<Integer> Player;
int round = 2;
boolean SimonDone;
void setup(){
  size(800,800);
  background(0);
  Simon = new ArrayList<Integer>();
  SimonDone = true;
}

void draw(){
  //background rectangles
  Background_Rectangles();
  Background_Lines();
  print(SimonDone);
  if(SimonDone==false){
    LightUp();
    
  }
  Draw_Scoreboard(round-1);
  fill(255);
  textAlign(LEFT);
  text("Simon State: " + SimonDone, 15, height - 14);

  

}

void Background_Rectangles(){
  //this is for all the squares
    rectMode(CORNERS);
  noStroke();
  //red
  fill(255,0,0);
  rect(50,50,width/2,height/2);
  //green
  fill(0,255,0);
  rect(width-50,50,width/2,height/2);
  //blue
  fill(0,0,255);
  rect(50,height-50,width/2,height/2);
  //yellow
  fill(255,255,0);
  rect(width-50,height-50,width/2,height/2);
}

void Draw_Scoreboard(int score){
  //this keeps track of your score
  fill(0);
  ellipseMode(CENTER);
  ellipse(width/2,height/2,130,130);
  fill(255);
  textAlign(CENTER);
  textSize(28);
  text("Score:", width/2, height/2-30);
  text(score, width/2, height/2);
}

void Background_Lines(){
  //these are the black lines that seperate the colors
  stroke(0);
  strokeWeight(10);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
}

void keyTyped(){
   if (key == ' '){
     round+=5;
   }
   if (key == 'p'){
     SimonDone = false;
   }
}

int TimeKeeper = 1000;
int LightTime = 0;

void LightUp(){
  //Simon = new ArrayList<Integer>();
  for(int i = 0; i < round ;i++)
  {
    Simon.add(int(random(1,5)));
  }
    for(int i = 0; i < Simon.size() ;i++)
  {
      fill(255);
      textAlign(LEFT);
      text("In Progress", width/2, height - 14);
      LightTime =0;
      Background_Rectangles();
      Background_Lines();
      if (Simon.size() == round){
        SimonDone = true;
        round++;   
      }
  if (Simon.get(i) == 1)
  {
    RedLight();
    LightTime++;
  }
   else if (Simon.get(i) == 2){
     GreenLight();
    LightTime++;
  }
   else if (Simon.get(i) == 3){
     BlueLight();    
    LightTime++;
  }  
  else if (Simon.get(i) == 4){
    YellowLight();    
    LightTime++;
  }
  }
  for (int wait = 0; wait<1000; wait++){
    //just waiting
  }
  //SimonDone=true;  
}
void RedLight(){
  ellipseMode(CORNERS);
  fill(255);
  ellipse(50,50,width/2,height/2);
//  rect(50,50,width/2,height/2);
}

void BlueLight(){
  ellipseMode(CORNERS);
  fill(255);
  ellipse(50,height-50,width/2,height/2);
//  rect(50,height-50,width/2,height/2);
}
void GreenLight(){
  ellipseMode(CORNERS);
  fill(255);
  ellipse(width-50,50,width/2,height/2);
//  rect(width-50,50,width/2,height/2);
}
void YellowLight(){
  ellipseMode(CORNERS);
  fill(255);
  ellipse(width-50,height-50,width/2,height/2);
//  rect(width-50,height-50,width/2,height/2);
}

