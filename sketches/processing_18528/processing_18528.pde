
class Bez{
  
  float x1 = 0; // the x coordinate of the beginning of the line
  float y1 = height/2; // the y coordinate of the beginning of the line
  
  float xspeed = 1; // horizontal speed
  float yspeed = 2; // vertical speed
  
  float cx1; //the x coordinate of the first control handle
  float cy1; //the y cooridnate of the first control handle
  
  float cx2; //the x coordinate of the second control handle
  float cy2; // the y coordinate of the second control handle
  
  float x2; //the x coordinate of the end of the line
  float y2; //the y coordinate of the end of the line
  
  float opac; //the opacity or color
  
  float strk; // the stroke weight
  
 

  Bez(float _cx1, float _cy1, float _cx2, float _cy2, float _strk){//constructor for the bezier
    
    cx1 = _cx1;
    cy1 = _cy1;
    
    cx2 = _cx2;
    cy2 = _cy2;
    
    strk = _strk;
  
  }
  
  
  void display(){
    
    //these variables make the end of the line match up to the position of the mouse on the screen
    x2 = mouseX;
    y2 = mouseY;
    
    //this is the bezier line that gets generated
    stroke(255, opac);
    noFill();
    strokeWeight(strk);
    bezier(x1, y1, cx1, cy1, cx2, cy2, x2, y2);
    
    //this is a red line that shows the handle being emitted from the beginning of the line
    stroke(255,0,0,30);
    line(x1, y1, cx1, cy1);
    ellipse(cx1, cy1, 5, 5);
    
    //this is a red line that shows the handle being emitted from the end of the line
    stroke(0,255,0,30);
    line(x2,y2, cx2, cy2);
    ellipse(cx2, cy2, 5,5);
    
    //this moves the begnning of the line horizontally across the screen
    x1 = x1 + xspeed;
    
    //this makes the beginning of the line change directions if it hits the left or right of the screen
    if(x1 > width){
      xspeed = xspeed *-1;
    }if(x1 < 0){
      xspeed = xspeed *-1;
    }
    
    //this moves the beginning of the line vertically
    y1 = y1 + yspeed;
    
    //this makes the beginning of the line change directions if it hits to the top or bottom of the screen
    if(y1 > height){
    yspeed = yspeed *-1;
    } if(y1 < 1){
      yspeed = yspeed *-1;
    
    }
    
    //this returns a number and changes the opacity based on the location of the beginnin of the line
     opac = map(x1, width/2, width, 130, 180);
  }
  
}
  

