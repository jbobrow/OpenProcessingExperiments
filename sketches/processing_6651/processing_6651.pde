
HashSet balls = new HashSet();

void setup(){
  size(250,250);
    ellipseMode(CENTER);
    frameRate(30);

for(float y = 5; y < 250; y++){
     //balls.add(new Ball(50,y));
     //balls.add(new Ball(150,y));
}

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

float figureX(float starty,float middle,float radius){
  return sqrt(pow(radius,2) - pow(middle - starty,2));
}

class Ball{
  float x,y;
  float xspeed;
  color c = color(255);
  Ball(float startx, float starty){
    float xoff = 0;

    if(starty > 150){
      xoff = figureX(starty, 200,50);
    } else {
       if(starty > 90){
          xoff = figureX(starty, 130,40); 
       }  else {
               if(starty > 42){
          xoff = figureX(starty, 70,30); 
       } else {
         c = color(128); 
         if(starty > 34){
             
            xoff = 30;
          } else {
           xoff=10; 
          }
         
       }

       } 
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



