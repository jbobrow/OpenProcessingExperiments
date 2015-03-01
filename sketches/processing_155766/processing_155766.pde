
float x, y, angle;
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  rectMode(CENTER);

  colorMode(RGB);  
  counter = 0;
  
  x = 0;
  y = 0;
  angle = 0;
}

void draw() {  //draw function loops 
  counter++;
  angle += radians(1);
    noStroke();
 fill(125, 150, 185, 4.5);
rect(250,250 , width, height);

  fill(random(125),random(100),random(255),30);
   translate(250, 250);

    rotate ( angle);    
    ellipse(x, y, 200 * atan(counter), 40 * atan(counter));
    rotate(-2 * angle);
    ellipse(x, y, 200 * atan(counter), 40 * atan(counter));
  fill(125, 150, 185);  
      ellipse(x, y, 40 * atan(counter), 40 * atan(counter));
    translate(250, 250);
    
}


void keyPressed(){
if(key == CODED){
    if(keyCode == LEFT){
    angle += radians(5);
    }
    if(keyCode == RIGHT){
    angle -= radians(5);
    }

}

}
