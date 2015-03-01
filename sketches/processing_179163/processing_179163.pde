
PFont font;
void setup(){
  size(400,400);
  noStroke();
  background(200);
  font=loadFont("8bit.vlw");
}

void draw (){
  
  textFont(font);
  textAlign(CENTER,CENTER);
  fill(255);
  text("Fancy Shit",330,350);
  
  
  
  float time = millis()*0.001;
  float a=cos(time);
  float b=sin(time);
  float amplitude = sin(time)*160;
  
  
  

  
  float posX = cos( time ) * amplitude + width/2;
  float posY = sin( time ) * amplitude + height/2;
  
  if (mousePressed){
    fill(0,0,0,0);
  }
  else{
    fill(random(255),random(255),random(255));
  }


  float x = random(50);
  float y = random(50);
  if (second() % 2 == 0){
    stroke(0,0,0,0);

    fill(200);
    strokeWeight(0); 
    rect(340,50,100,100);
    fill(255);
    strokeWeight(0);    
    rect(340,50,x,y);
  }


rectMode(CENTER);
strokeWeight(5);
fill(0,0,0,0);
stroke(255,0,0);
rect(width/2,height/2,width,height);
if (mousePressed){
    background(200); //The worm
  }      
strokeWeight(2);  
 fill(random(255),random(255),random(255));
stroke(random(255),random(255),random(255));
curve(mouseX/2, posY, posX, mouseX, mouseY, posX, mouseY/.6, posY);
//code is awsome
}


