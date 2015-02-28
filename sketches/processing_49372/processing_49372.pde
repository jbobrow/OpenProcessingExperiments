
class Mac{
    
 float x;
 float y;
 color col;
  
 boolean hit= false;
 
 Mac(float x_,float y_,color col_){
   col = col_;
   x = x_;
   y = y_;
 }
    
 void display (float x_,float y_){
   
   x = x_;
   y = y_;
   
  //body
  noStroke();
  fill(26,84,183);
  beginShape();
  vertex(x+5, y+20);
  vertex(x+10,y+20);
  vertex(x+10, y);
  vertex(x+40,y);
  vertex(x+40,y+20);
  vertex(x+45,y+20);
  vertex(x+45,y+30);
  vertex(x+40,y+30);
  vertex(x+40,y+50);
  vertex(x+30,y+50);
  vertex(x+30,y+45);
  vertex(x+20,y+45);
  vertex(x+20,y+50);
  vertex(x+10,y+50);
  vertex(x+10,y+30);
  vertex(x+5,y+30);
  endShape(CLOSE);
  
  //eyes
  noStroke();
  if(hit){
    stroke(0);
    fill(x/10,y,x);
    ellipse(x+17,y+10,x/10,x/10);
    ellipse(x+33,y+10,x/10,x/10);   
  } else {
    noStroke();
    fill(0,255,0);
    ellipse(x+17,y+10,8,8);
    ellipse(x+33,y+10,8,8);
    }

 }
 
 void hitTest(Mac m) {
   
    if (dist(x, y, m.x, m.y) <= 90) {
      m.hit = true;
      hit = true;
    } else {
      m.hit = false;
      hit = false;
    }
  }
}


