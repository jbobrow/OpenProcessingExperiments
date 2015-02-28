
int x = 250;
int y = 250;

void setup (){
size(500,500);
background(234,17,234);
noStroke();
fill(15,12,240);
rect(x,y,50,50);
}
void draw (){
  /////////////////////move to left when pressed left arrow
if (keyPressed && (key == CODED)){
  if(keyCode == LEFT){
    if (x >=5){
    x = x -5;
    background(234,17,234);
    noStroke();
    fill(15,12,240);
    rect(x,y,50,50);
    }
    }
  }
    /////////////////////move to right when pressed right arrow
if (keyPressed && (key == CODED)){
  if(keyCode == RIGHT){
    if (x <= 448){
    x = x +5;
    background(234,17,234);
    noStroke();
    fill(15,12,240);
    rect(x,y,50,50);
    }
    }
  }
      /////////////////////move to the top when pressed up arrow
if (keyPressed && (key == CODED)){
  if(keyCode == UP){
    if (y >= 5){
    y = y -5;
    background(234,17,234);
    noStroke();
    fill(15,12,240);
    rect(x,y,50,50);
    }
    }
  }
    /////////////////////move to the bottom when pressed down arrow
if (keyPressed && (key == CODED)){
  if(keyCode == DOWN){
    if (y <= 448){
    y = y +5;
    background(234,17,234);
    noStroke();
    fill(15,12,240);
    rect(x,y,50,50);
    }
    }
  }
  
  
  
}


