
float x;
float y;
float px;
float py;
float easing = 0.05;

void setup() {
  size(700, 500);
  background(255);
  smooth();
}

void draw() {
  //float l = random(10,50);
  float targetX = mouseX;
  x += (targetX -x) * easing;
  float targetY = mouseY;
  y+= (targetY -y) *easing;
  float weight = dist(x,y,px,py);
  strokeWeight(weight);
  if (keyPressed == true){
      stroke(255,0,0);}
      else if(mousePressed){
        stroke(0);}
      else{
        stroke(255);}
     
    line(x,y, px, py);
    line(x +20, y+20,px+40,py+40);
  py = y;
  px =x;
  

 
    
  
  
 // saveFrame("line-######.jpg");
}

