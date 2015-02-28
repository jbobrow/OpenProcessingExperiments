
//Feilds
int level = 0;
boolean firstClick = false;
boolean rev = true;

void setup(){
  size(500, 500);
  background(0);
  noStroke();
  smooth();
  noLoop();
  
}

void draw(){
  if(firstClick == false){
    background(0);
    fill(255);
    textAlign(CENTER, CENTER);
    text("CLICK TO INCREASE LEVELS", width/2,height/2);
  }
  else pattern(250, 250, 500, level);
}

void pattern(float x, float y, int radius, int level){
  float colour = 200 * level/8.0;
  fill(colour, 100);
  ellipse(x, y, radius*2, radius*2);
  ellipse(x, y, radius*2, radius*2);
  if(level > 1){
    level--;
    pattern(x - radius/2, y - radius/2, radius/2, level);
    pattern(x - radius/2, y + radius/2, radius/2, level);
    pattern(x + radius/2, y - radius/2, radius/2, level);
    pattern(x + radius/2, y + radius/2, radius/2, level);
  }
}

/*
void mouseClicked(){
  if (firstClick == false) firstClick = true;
  //Reset Levels
  if (level >= 8){
  level = -1;
  firstClick = false;
  }
  //Redraw and increase level
  level++; 
  background(255);  
  redraw();  
} 
*/

void mouseClicked(){
  if (firstClick == false) firstClick = true;
  if (rev == false) level--;
  if (rev == true) level++;
  if (level >= 8){
  rev = false;
  level--;
  }
  if (level <= 0){
  rev = true;
  level++;
  } 
  redraw();  
}



