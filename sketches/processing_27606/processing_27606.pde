
float oldX, oldY;
int weight = 1;
int angle = 0;
float mouseDist;
float maxDistance;
float diameter = 5000;
float k = 0;
float sizeu = 60;
int x = 5;
int y = 5;
int tria = 20;
int counter = 1;
float mx = 500;
float my = 400;
boolean onscreen = false;

void setup(){
  size(1024,768);
  background(255,255,255);
  strokeWeight(weight);
  smooth();
  maxDistance = dist(0, 0, width/4, height/4);
}

void draw(){
  fill(40,80,255,4);
  rect(0,0,width,height);
  
  //iterate k from 0-360 in radians i.e. 0-2pi and then reset
  if (k <= 6.28){
    k += .05;
  }
  else{
    k=0;
  }
  
  if (mousePressed){
    sizeu -= .8;
    counter += 1;
  }
  
  else if (sizeu > 24){
    sizeu += random(-.5, .5);
    
  }
  
  else if(sizeu < 24){
    sizeu += .5;
    counter = 1;
  }
  
   if (mouseX<=width && mouseY<=height){

    fill(40,80, 255,6);
    noStroke();
    ellipse((mx+10), (my+10), oldX*2, oldX*2);
  }
  oldX = sizeu*random(1,3);
  
  for (float i = 0; i <= width; i += 20) {
    for (float j = 0; j <= height; j += 20) {
      //computes the distance from each new ellipse to the mouse
      mouseDist = dist(mx, my, i, j);
      //diameter of the ellipse is determined by dividing the distance to the mouse
      //by the maxDistance we found above
      //then, in order to have the pulsing, multiply by a cos() that uses k,i, and j
      diameter = (mouseDist/maxDistance)*sizeu;//(mouseDist / maxDistance)* sin(k+i/300-j/200) * 30;
      if (diameter <.1){
        diameter = .1;
      }
      
      //makes the color change according to mouse y, the distance to the mouse, and pulse with a sin()
      fill(mouseDist/100);
      //actually draws the ellipse
      rect(i, j, diameter, diameter);
    }
  }
  
  strokeWeight(.5+(counter*.05));
  stroke(12,4,90);
  float rainx = mx+random(-45,55);
  line(rainx, my, rainx, (my-100));
  
  
  //cloud
  
  if (mouseX<=width && mouseX> 0 && mouseY<=height && mouseY > 0){
    onscreen = true;
  }
  
  if (onscreen == true){
    mx = mouseX;
    my = mouseY;
  }
  
  else{
    onscreen = false;
  }
  
  if (counter > 0){
    fill(150, 220);
    noStroke();
    ellipse((mx-20), (my-100), 80 , 60);
    ellipse((mx+5), (my-110), 70 , 80);
    ellipse((mx+5), (my-100), 100 , 60);
    ellipse((mx+30), (my-100), 80 , 60);
  }
  
//  else if (mouseX<0 && mouseY<0){
//    mx = 400;
//    my = 400;
//    ellipse((mx-20), (mx-50), 80 , 60);
//    ellipse((mx+5), (mx-60), 70 , 80);
//    ellipse((mx+5), (mx-50), 100 , 60);
//    ellipse((mx+30), (mx-50), 80 , 60);
//  }
//  
  
  
  pushMatrix();
  if (mousePressed && counter < 10 || random(1000) > 985){
    
    translate(mx,my-100);
    rotate(random(720));
    for(int j = 0; j < random(1,20) ; j+=random(1,40)){
      for(int i = 0; i < random(1,20) ; i+=random(1,40)){
        noStroke();
        fill(random(220,255), random(220,255), random(220,255));
        //ellipse((x+i*50), y+j*50, 50, 50);  
        triangle(x+i*tria, y+j*tria, (x+random(10,100))+i*tria, (y-random(4,5))+j*tria, (x+random(20,100))+i*tria, y+j*tria);
      }
    }
  }
  popMatrix();
}

