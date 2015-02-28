
Enemy e1 = new Enemy(250,250,1);
Enemy e2 = new Enemy(random(250,500),random(250,500),1);
Enemy e3 = new Enemy(random(250,500),random(250,500),1);
Enemy e4 = new Enemy(random(250,500),random(250,500),1);
Enemy e5 = new Enemy(random(250,500),random(250,500),1);
Enemy e6 = new Enemy(random(250,500),random(250,500),1);
Enemy e7 = new Enemy(random(250,500),random(250,500),1);
Enemy e8 = new Enemy(random(250,500),random(250,500),1);
Enemy e9 = new Enemy(random(250,500),random(250,500),1);

int cx = 0; 
int cy = 0; //click X and Y

void setup(){
    size(650,500);
    smooth();
    

}

void draw(){
  background(128);
  
  e1.update();
  e2.update();
  e3.update();
  e4.update();
  e5.update();
  e6.update();
  e7.update();
  e8.update();
  e9.update();
  
  
  
  
  

}

void mousePressed(){
  cx = mouseX;
  cy = mouseY;

}

class Enemy{
  float xpos,ypos,speed;
   Enemy (float x, float y, int s){
     xpos = x;
     ypos = y;
     speed = s;
   } 
   void update(){
     ellipse(xpos, ypos, 10,10);
     
     xpos += sin(xpos * 50) * .5;
     ypos += cos(ypos * 50) * .5;
     if(mousePressed && mouseButton == LEFT){
     run();
     }
     if(mousePressed && mouseButton == RIGHT){
     attack();
     }
     
     }
   
   void run(){
     if(cx < xpos && cy < ypos){        //top-left
     xpos -= cx/50;
     ypos -= cy/50;
     }else if(cx > xpos && cy < ypos){  // top right
     xpos += cx/50;
     ypos -= cy/50;
     }else if(cx < xpos && cy > ypos){  //bottom -left
     xpos -= cx/50;
     ypos += cy/50;
     }else if(cx > xpos && cy > ypos){  //botom-right
     xpos += cx/50;
     ypos += cy/50;
     }
     if(xpos > width){
       xpos = 0;
     }else if(xpos < 0){
       xpos = width;
     }
     if(ypos > height){
       ypos = 0;
     }else if(ypos < 0){
       ypos = height;
     }   
   }
   void attack(){
     if(cx < xpos && cy < ypos){        //top-left
     xpos += cx/50;
     ypos += cy/50;
     }else if(cx > xpos && cy < ypos){  // top right
     xpos -= cx/50;
     ypos += cy/50;
     }else if(cx < xpos && cy > ypos){  //bottom -left
     xpos += cx/50;
     ypos -= cy/50;
     }else if(cx > xpos && cy > ypos){  //botom-right
     xpos -= cx/50;
     ypos -= cy/50;
     }
     if(xpos > width){
       xpos = 0;
     }
     if(ypos > height){
       ypos = 0;
     }
     if(xpos < 0){
       xpos = width;
     }
     if(ypos < 0){
       ypos -= height;
     }
   }
}
