
HashSet balls = new HashSet();

void setup(){
  size(250,250);
    ellipseMode(CENTER);
    frameRate(30);
}

void draw(){
  background(0,0,80);
   Iterator i = balls.iterator();
  while(i.hasNext()){
     Ball b = (Ball)i.next();
     b.move();
     b.draw();
  } 

}

void mouseDragged(){
   balls.add(new Ball(mouseX,mouseY)); 
}
void mousePressed(){
   balls.add(new Ball(mouseX,mouseY)); 
}

void keyPressed(){
  if(key == ' '){
   balls = new HashSet(); 
  }
}

class Ball{
  float x,y;
  float xspeed;
  color c;
  Ball(float startx, float starty){
    float xoff = 0;
    if(starty > 200){
      c = color(139,69,19);
      xoff = 10;
    }else {
      if(starty < 10){ c=color(255,255,0); }
      else {c = color(0,200,0);}
       xoff = map(starty,0,200,0,(width/2)-50); 
    }
    if(startx < width/2){
      xoff *= -1;
    }
    this.x = width/2 + xoff;
    
    this.y = starty;
  }    
 void draw(){
    noStroke();
   fill(c);
  ellipse(x,y,width/30,width/30); 
 }
  void move(){
    if(x< width/2) {
       xspeed++; 
    } else {
       xspeed--; 
    }
    x+=xspeed;
  }  
}




