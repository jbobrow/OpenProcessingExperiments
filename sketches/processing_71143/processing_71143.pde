
//z to start animation
//x to stop animation
//c to switch from black to white
//space to switch from white to black
//click and hold to connect the circles
float angle;
float sWeight=2.25;
boolean makeCir = false;
boolean inv = false;
boolean makeS = false;

void setup(){
  size(600,600);
  smooth();
  
  
  angle=0;
}
void keyPressed(){
  if (key=='z') makeCir = true;
 
  if(key=='x') makeCir=false;
  
  if(key=='c') inv =true;
  
  if(key==' ') inv = false;

}

void draw(){
  
    float distance= dist(width/2,height/2, 150,150);
  //distance is averaged between 150 and 300(height or width/2)
  //if cos and sin are multiplied by 0 it follows a circular path
  float x = 300 + distance*cos(radians(angle));
  float y = 300 + distance*sin(radians(angle));
  float x2 = 300 + distance*cos(radians(angle+120));
  //incr of 120 to space in triangular shape
  float y2 = 300 + distance*sin(radians(angle+120));
  float x3 = 300 + distance*cos(radians(angle+240));
  float y3 = 300 + distance*sin(radians(angle+240));
  if (inv){ 
    background (255,255,255);
    fill(0);
    stroke(0);
  }
  else {
    background (0);
    fill(255,255,255);
    stroke(255,255,255);
  }
if (makeCir){//if makeCir == true

  ellipse(x,y,40,40);

  ellipse(x2,y2,40,40);

  ellipse(x3,y3,40,40);
 
  angle = angle +1;
    } else{ //i want to change this so that the circles dont render until you start the animation the first time
      
  ellipse(x,y,40,40);

  ellipse(x2,y2,40,40);

  ellipse(x3,y3,40,40);}
  if (mousePressed==true){
   strokeWeight(sWeight);//stroke is .25
 
      line (x,y,mouseX,mouseY);//lines to connect circles
      line (x2,y2,mouseX,mouseY);
      line (x3,y3,mouseX,mouseY);
      line(x,y,x2,y2);
      line (x2,y2,x3,y3);
      line (x3,y3,x,y);
      ellipse (mouseX,mouseY,40,40);//makes circle at mouse location and lines connect 
}
  }






