
//controlled modules

void setup (){
  size(200,200);
  background(160);
  frameRate(10000);
  smooth();
  
  
}
  
float moduleSpacing = 5;
float moduleX = 50;
float moduleY = 50;
float moduleWidth = 25;
float moduleHeight = 25;





void draw (){
  //modules();
}



//module controls

//spacing
void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      background(160);
      moduleWidth++;
      moduleSpacing++;
      modules();
    }
    else if(keyCode == LEFT) {
      background(160);
      moduleWidth--;
      moduleSpacing--;
      modules();
    } 
    else if(keyCode == DOWN) {
      background(160);
      moduleHeight++;
      modules();
    }
    else if(keyCode == UP) {
      background(160);
      moduleHeight--;
      modules();
    }
  }
 //module coordinates
  if (key == 'd') {
    background(160);
      moduleX++;
      moduleSpacing++;
      modules();
  }
  if (key == 'a') {
    background(160);
    moduleX--;
    modules();
  } 
  if(key == 's') {
    background(160);
    moduleY++;
    modules();
  }
  if(key == 'w') {
    background(160);
    moduleY--;
    modules();
  }
}






void modules(){
  
  for(float i = 0; i < 100; i = i + moduleSpacing) {
    rectMode(CENTER);
    fill(230,60);
    noStroke();
    rect(moduleX, moduleY, moduleWidth, moduleHeight);
  }
    
   //ground line
  stroke(2);
  noFill();
  line(0,height*0.75,width,height*0.75);
}

