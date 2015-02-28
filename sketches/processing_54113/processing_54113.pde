
float x,y,x2,y2,angle,ellSize;

void setup(){
  size(600,600);
  background(0);
  x = 0;
  y = 0;
  angle = 0;
  smooth();
  noStroke();
  
}

void draw(){
  background(random(130));
  float ellSize = 20;
  
  for(int x = 0; x < width; x +=10){
    for (int y = 0; y < height; y+=50){
      ellSize = cos (x*y+120)*30;
      
  ellipse(x,y,ellSize,ellSize);
    }
  }
      
  
  x = cos (radians(angle)) *50 + width/2;
  y = tan (radians (angle/2)) *20 + height/2;
  x2 = cos (radians (angle)) *20 + width/4;
  y2 = sin (radians (angle*2)) *10 +height/2;
  
  fill(130,angle,145,90);
  ellipse(x-200,y,140,140);
  fill(angle,20,angle,180);
  rect(x,angle,30,angle);
  fill(130,23,angle,50);
  rect(x,y,angle,230);
  fill(angle,23,140,90);
  ellipse(angle,y-200,120,100);
  fill(340,angle,324,180);
  rect(x-100,y-200,angle,50);
  
  angle++;
  

    
}


