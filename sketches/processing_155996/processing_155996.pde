

float theta;
float ang;

void setup(){
  size(500, 1000);
  smooth();
  background(0);
}

void draw(){ 
  theta = radians(ang);
  noFill();
 noStroke();
  ellipse(250, 500, 400, 400);
  ellipse(250, 500, 350, 350);
  ellipse(250, 500, 300, 300);
  ellipse(250, 500, 250, 250);
  ellipse(250, 500, 200, 200);
  fill(245, 145, 230, 50);
  if(ang >= 90){
    fill(245, 245, 0, 50);
  }
  ellipse(250+190*cos(theta), 500+190*sin(theta), 15, 15);
  if(ang >= 180){
    fill(245, 0, 0, 50);
  } 
   ellipse(250+160*cos(theta), 500+160*sin(theta), 15, 15);
   if(ang >= 270){
     fill(0, 0, 255, 50);
   }
    ellipse(250+135*cos(theta), 500+135*sin(theta), 15, 15);
    if(ang >= 360){
      fill(55, 215, 33, 50);
    }
     ellipse(250+110*cos(theta), 500+110*sin(theta), 15, 15);
     
  ang += 1;
  
  if(ang >= 720){
    ang = 0;
  }
 
}


