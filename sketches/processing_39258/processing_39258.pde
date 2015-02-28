
int x=150;
int y=150;
int i=0;

void setup(){
  size(300,300);
  background(0);
  smooth();
  rectMode(CENTER);
}
void draw(){
  if(mousePressed){
      if(mouseButton==LEFT){
        i=int(random(255));
      }else if(mouseButton==CENTER){
        noStroke();
      }
          
  }
  if(keyPressed){
    if(key=='a'){
      x--;
    }else if(key=='d'){
      x++;
    }else if(key=='w'){
      y--;
    }else if(key=='s'){
      y++;
    }else if(key=='e'){
      stroke(random(255),mouseX*255/300,mouseY*255/300);
    }
  
    fill(i,mouseX*255/300,mouseY*255/300,150);
    ellipse(x,y,mouseX/3,mouseY/3);
  }
  }

void mousePressed(){
   if(mouseButton==RIGHT){
       background(0);
   }
}
                
                
