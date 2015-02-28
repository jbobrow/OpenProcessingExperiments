


class Sprite{
  
 
  
  float radius;
//  float hei;
  float x;
  
  float wei;
  
  boolean growing = false;
  
  int xpos;
  int ypos;
  
  float frequency = random(-5, 12);
  
  float angle;
  
  Sprite(int x, int y, float rr){
    xpos = x;
    ypos = y;
    radius = rr;
    
  }

  void display(){
   
    float px, py;
    
   //main circle
//  stroke(255);
  noStroke();
  noFill();
  ellipse(xpos, ypos, radius, radius);
  
  //rotate dot around circle
  px = xpos + cos(radians(angle))*(radius/2);
  py = ypos + sin(radians(angle))*(radius/2);
  
  //rotating dot
  noStroke();
  fill(255, 90);
  ellipse(px, py, radius/5, radius/5);
  
  
  
  
  //circle highlighting the origin of the rotatin point
  fill(255);
  ellipse(xpos, ypos, 3, 3);
  
   float c = map(px, 20, 800, 100, 255);
  
  //line from the center to the outer rotating circle
  stroke(c);
  //strokeWeight(wei);
  line(xpos, ypos, px, py);
  
  //additional circle that lives on the rotating circle
  noStroke();
  fill(255);
  ellipse(px, py, radius/30, radius/30);
  

  
  if(px <= xpos){
    c = 0;
    //wei = wei *wei+1;
    
  }else{
    c = 255;
    //wei = wei* -1;
  }
  
  //center point rectangle
//  noStroke();
//  fill(100);
//  rectMode(CENTER);
//  rect(xpos, ypos, radius/25,radius/25);
  
  angle -= frequency;
  x+=1;
  
  if(growing == true){
    radius = radius+1;
  }
  
 
  println(growing);
  
  }
  
  
  

}

