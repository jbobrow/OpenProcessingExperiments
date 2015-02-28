
int grand = 25;
//array definition
int [] x = {30, 60, 90, 120, 150, 180, 210, 240, 30, 60, 90, 90, 30, 60, 120, 120, 120, 30, 60, 90, 150, 150, 150, 30, 60, 90, 180, 180, 30, 60, 210, 30};
int [] y = {30, 60, 90, 120, 150, 180, 210, 240, 60, 30, 30, 60, 90, 90, 30, 60, 90, 120, 120, 120, 30, 60, 90, 150, 150, 150, 30, 60, 180, 180, 30, 210};
int speed = 3;  
  
void setup(){
  size(400, 400);
  smooth();
  noStroke();
}

void draw(){
   background(255);
   //array
   for(int i = 0; i < x.length; i = i + 1){
     //change color
   float h = map(mouseX, 0, 240, 0, 255);
   fill(60, h, 50);
   ellipse(x[i], y[i], grand, grand);
    
    if(mousePressed && (mouseButton == LEFT)){  //up + left movement
    x[i] = x[i] - speed;
    y[i] = y[i] - speed;
    } else if(mousePressed && (mouseButton == RIGHT)){  //down + right movement
    x[i] = x[i] + speed;
    y[i] = y[i] + speed;
    }
  }
  
 
}

