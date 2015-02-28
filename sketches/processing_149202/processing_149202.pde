
/* @pjs preload="win.jpg,gameover.jpg"; */    
    int xdirection = 1; 
    int ydirection = 1; 
    int value = 0;
    Clickball ball1;
    Clickball ball2;
    Clickball ball3;
    Clickball ball4;
    boolean hard = false;
    boolean easy = true;
    boolean winning=false;
    boolean over=false;
    PImage win;
    PImage gameOver;
    float time;
    float targettime=10;
    void setup() {
      size(500,500);
      cursor(CROSS);
      noStroke();
      ball1 = new Clickball(color(255,0,0),10,100,2,8);
      ball2 = new Clickball(color(0,0,255),10,130,1,7);
      ball3 = new Clickball(color(0,255,0),10,100,3,8);
      ball4 = new Clickball(color(0,255,255),10,130,4,9);
    }

    void draw() {
      time = millis()/1000;
      background(255);
      stroke(175);
      fill(0);
      if(time>=targettime){
        if(!winning==true){
        over=true;
        easy=false;
        hard=false;}
      }
      if(winning==true){
        imageMode(CENTER);
        background(255);
        win = loadImage("win.jpg");
        image(win,250,250);
        time=0;
      }
      if(over==true){
        imageMode(CENTER);
        background(255);
        win = loadImage("gameover.jpg");
        image(win,250,250);
      }
      if(keyPressed == true){
        targettime=time+10;
        if(key=='h' || key == 'H'){
          hard = true;
          easy = false;
          winning=false;
          over= false;
         }
         else{easy = true;
               hard = false;
              winning=false;
              over= false;}
       }
      if(hard == true){
      ball1.bounce();
      ball1.display();
      ball2.bounce();
      ball2.display();
      ball3.bounce();
      ball3.display();
      ball4.bounce();
      ball4.display();}
      if(easy==true){
      ball1.bounce();
      ball1.display();
      }

    }
    
    void mousePressed(){
      if(ball1.isOver()==true || ball2.isOver() == true || ball3.isOver()==true || ball4.isOver() == true){
        winning=true;
        easy=false;
        hard=false;
      }}

    class Clickball {
      color c;
      float xpos;
      float ypos;
      float xspeed;
      float yspeed;

      Clickball(color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempYspeed) {
        c = tempC;
        xspeed = tempXspeed;
        yspeed = tempYspeed;
          if (xpos > width-500 || xpos < 0) {
          xdirection *= -1;
          }
            if (ypos > height-500 || ypos < 0) {
        ydirection *= -1;
      }
      }

      void display() {
        stroke(0);
        fill(c);
        ellipseMode(CENTER);
        if (hard==true){
        ellipse(xpos,ypos,20,20);}
        else{
          ellipse(xpos,ypos,70,70);}
      }
     
      void bounce() {
        xpos = xpos + xspeed;
       
        xpos = xpos + ( xspeed * xdirection );
        ypos = ypos + ( yspeed * ydirection );
     
        if (xpos > width) {
          xspeed = xspeed * -1;
        }
        if (xpos < 0) {
          xspeed = xspeed * -1;
        }
        if (ypos > height) {
          yspeed = yspeed * -1;
        }
        if (ypos < 0) {
          yspeed = yspeed * -1;
        }
      }
      
      boolean isOver(){
        if(hard==true){
           if (dist(xpos, ypos, mouseX, mouseY) < 10){
                  return true;}
            else{
                  return false;}
        }
        else{
        if (dist(xpos, ypos, mouseX, mouseY) < 35){
          return true;}
        else{
          return false;}}
    }
}


