
class Critter{
    float x;
    float y;  
    color col;
    color colAlt;
    color bodyColor;
    float cornerRadius = 5;
    float noRadius = 0;
    float bodyW = 50;
    float bodyH = 60;
    float legW = 15; 
    float legH = 20;
    float hornW = 7;
    float hornH = 5;
    float eyeSize = 8;
    float hoofColor = 150;
    float mouthH = 18;
    float mouthW = 20;
    float mouthWeight = 2;
    float toothH = 2;
    float toothW = 3;
    float earStroke = 4;
    float earH = 36;
    float innerEarH = 8;
    float mouthRValue = 113;
    float mouthGValue = 49;
    float mouthBValue = 46;
    float earRValue = 247;
    float earGValue = 228;
    float earBValue = 227; 
    boolean hit = false;

  
  Critter(float x_, float y_, color col_, color colAlt_) {
    x = x_;
    y = y_;
    col = col_;
    colAlt = colAlt_;
  }
  
  void drawCritter(float x_, float y_) {
    x = x_;
    y = y_;
  
    
    //body
    rectMode(CENTER);
    noStroke();
    fill(bodyColor);
    rect(x,y,bodyW,bodyH,cornerRadius,cornerRadius,cornerRadius,cornerRadius);
  
    //legs
    rectMode(CORNER);
    rect(x-bodyH/3,y+bodyH/2,legW,legH,noRadius,noRadius,cornerRadius,cornerRadius);
    rect(x+bodyH/12,y+bodyH/2,legW,legH,noRadius,noRadius,cornerRadius,cornerRadius);
    //hooves
    fill(hoofColor);
    rect(x-legH,y+legW*3,legW,legH/4,noRadius,noRadius,cornerRadius,cornerRadius);
    rect(x+legH/4,y+legW*3,legW,legH/4,noRadius,noRadius,cornerRadius,cornerRadius);
    
    //horns
    fill(hoofColor);
    rect(x-legW,y-hornH*7,hornW,hornH,cornerRadius,cornerRadius,noRadius,noRadius);
    rect(x+legW,y-hornH*7,hornW,hornH,cornerRadius,cornerRadius,noRadius,noRadius);
    
    //eyes
    fill(0);
    ellipse(x-bodyW/5,y-bodyH/12,eyeSize,eyeSize);
    ellipse(x+bodyW/5,y-bodyH/12,eyeSize,eyeSize);
    //pupils
    fill(255);
    ellipse(x-bodyW/5,y-bodyH/12,eyeSize/4,eyeSize/4);
    ellipse(x+bodyW/5,y-bodyH/12,eyeSize/4,eyeSize/4);
  
    //mouth
    fill(mouthRValue,mouthGValue,mouthBValue);
    if(hit){
      arc(x,y+mouthH,mouthW,mouthH,PI,PI*2);
    //tooth
    fill(255);
    rect(x+toothW,y+mouthH-toothH,toothW,toothH);
    } else {
      noFill();
      strokeWeight(mouthWeight);
      stroke(mouthRValue,mouthGValue,mouthBValue);
      arc(x,y+mouthH/2,mouthW,mouthH,0+HALF_PI/2,PI-HALF_PI/2);
    }
    
    //ears
    stroke(bodyColor);
    strokeWeight(earStroke);
    strokeJoin(ROUND);
    fill(bodyColor);
    quad(x-bodyW/2,y-bodyW/2,x-bodyW*4/5,y-earH,x-bodyW*4/5,y,x-bodyW/2,y-bodyH/6);
    quad(x+bodyW/2,y-bodyW/2,x+bodyW*4/5,y-earH,x+bodyW*4/5,y,x+bodyW/2,y-bodyH/6);
    //inside of ear
    fill(earRValue,earGValue,earBValue);
    noStroke();
    triangle(x-bodyW/2,y-earH/2,x-earH,y-bodyW/2,x-earH,y-innerEarH);
    triangle(x+bodyW/2,y-earH/2,x+earH,y-bodyW/2,x+earH,y-innerEarH);
    
    //change body color if hit
    if (hit){
     bodyColor = colAlt;
    } else {
     bodyColor = col;
    }
  } 
  
  //test to see if critter is hit
  void hitTest(Critter bump){
    float rad = (bodyW > bump.bodyW ? bodyW : bump.bodyW);
    
    if (dist(x,y,bump.x,bump.y) <= rad) {
      bump.hit = true;
    } else {
      bump.hit = false;
      hit = false;
    }
  }
}


