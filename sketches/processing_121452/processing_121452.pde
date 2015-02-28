
float timer;

int y= int(random(500));
int c=0;
int p=0;

boolean gameover = false;
Ball theBall;
Paddle playerPaddle;
ai aiPaddle;

float xPos=10, yPos=250;
Dot[] dots = new Dot[5];

void setup(){
  timer = 0;
  size(500, 500);
  smooth();
  
  //Pong stuff
  theBall = new Ball();
  playerPaddle = new Paddle();
  aiPaddle = new ai();
  
  //PacMan stuff
  for (int i=0; i < dots.length;i++) {
  dots[i] = new Dot(i*100+35, 250, 30, 30, xPos, yPos);
}
  }

void draw() {
    timer = timer + 0.25;
    background(0);
    //Title Page
    if (timer <50){
    textSize(32);
    text("Press the Up/Down keys", 50,250);
  }
    
    if (timer >= 50 && timer <150){//Display Pong
      background(0);
      aiPaddle.aishow();
      playerPaddle.display();
      playerPaddle.keyMovement();
      theBall.move();
      theBall.bounce();
      theBall.display();
  }
    if (timer >=150 && timer <200){ //Display PacMan
       background(0);
       textSize(32);
       text("Press the Left/Right keys", 50,250);
     }
       
     if (timer >=200 && timer <300){
       drawpacMan(); //showpacMan when keys are pressed
  
        //key movement
        if (keyPressed) {
          /*if (keyCode==UP||key=='w') {
            yPos--;
          }
          else*/ if (keyCode==RIGHT||key=='d') {
            xPos=xPos+2;
          }
         /* else if (keyCode==DOWN||key=='s') {
            yPos++;
          }*/
          else if (keyCode==LEFT||key=='a') {
            xPos--;
        } 
  }
  
  //Draw dots on screen
  for (int i=0; i <dots.length; i++) {
    dots[i].display();
    dots[i].collision(xPos,yPos);
  }
    }
    
    //Draw Mario
    if (timer >=300){
      background(0);
  } 
    if (timer >=310){
      noStroke();
        
      fill(255,0,0);
      rect(200,125,120,20);
}
    if (timer >=320){
      rect(180,145,200,20);
}  
    if (timer >=330){
      fill(102,51,0); //brown
      rect(180,165,60,20);
      fill(255,229,204); //skin
      rect(240,165,60,20);
      fill(0); 
      rect(300,165,20,20);
      fill(255,229,204);
      rect(320,165,20,20);
} 
    if (timer >=340){
      fill(102,51,0);
      rect(160,185,20,20);
      fill(255,229,204);
      rect(180,185,20,20);
      fill(102,51,0);
      rect(200,185,20,20);
      fill(255,229,204);
      rect(220,185,80,20);
      fill(0);
      rect(300,185,20,20);
      fill(255,229,204);
      rect(320,185,60,20);
}  

    if (timer >=350){
      fill(102,51,0);
      rect(160,205,20,20);
      fill(255,229,204);
      rect(180,205,20,20);
      fill(102,51,0);
      rect(200,205,40,20);
      fill(255,229,204);
      rect(240,205,80,20);
      fill(0);
      rect(320,205,20,20);
      fill(255,229,204);
      rect(340,205,60,20);
}

    if(timer >=360){
      fill(102,51,0);
      rect(160,225,40,20);
      fill(255,229,204);
      rect(200,225,100,20);
      fill(0);
      rect(300,225,80,20);    
}

    if(timer >=370){
      fill(255,229,204);
      rect(200,245,160,20); 
}
    if(timer >=380){
      fill(255,0,0);
      rect(180,265,40,20);
      fill(0,0,255);
      rect(220,265,20,20);
      fill(255,0,0);
      rect(240,265,80,20);
}
    if(timer >=390){
      rect(160,285,60,20);
      fill(0,0,255);
      rect(220,285,20,20);
      fill(255,0,0);
      rect(240,285,40,20);
      fill(0,0,255);
      rect(280,285,20,20);
      fill(255,0,0);
      rect(300,285,60,20);
}
    if(timer >=400){
      rect(140,305,80,20);
      fill(0,0,255);
      rect(220,305,80,20);
      fill(255,0,0);
      rect(300,305,80,20);
}
    if(timer >=410){
      fill(255,229,204);
      rect(140,325,40,20);
      fill(255,0,0);
      rect(180,325,20,20);
      fill(0,0,255);
      rect(200,325,20,20);
      fill(255,255,0);
      rect(220,325,20,20);
      fill(0,0,255);
      rect(240,325,40,20);
      fill(255,255,0);
      rect(260,325,20,20);
      fill(0,0,255);
      rect(280,325,20,20);
      fill(255,0,0);
      rect(300,325,20,20);
      fill(255,229,204);
      rect(320,325,40,20);
}
    if(timer >=420){
      rect(140,345,60,20);
      fill(0,0,255);
      rect(200,345,120,20);
      fill(255,229,204);
      rect(320,345,60,20);
}
    if(timer >=430){
      fill(0,0,255);
      rect(180,365,60,20);
      rect(280,365,60,20);
}
    if(timer >=440){
      fill(102,51,0);
      rect(160,385,60,20);
      rect(300,385,60,20);
}

    if(timer >=450){
      rect(140,405,80,10);
      rect(300,405,80,10);
}

    if(timer>480){
      size(1000,700);
      background(255);
    }
    if(timer>490){
fill(0);
rect(105,125,20,10);
rect(410,125,20,10);
    }
        if(timer>500){
rect(105,135,40,10);
rect(390,135,40,10);
    }
    
            if(timer>510){
rect(105,145,50,10);
rect(380,145,50,10);
    }
    
             if(timer>520){
rect(105,155,60,10);
rect(370,155,60,10);
    }
             if(timer>530){
rect(105,165,40,10);
fill(255,255,0);
rect(145,165,20,10);
fill(0);
rect(165,165,10,10);
rect(360,165,10,10);
fill(255,255,0);
rect(370,165,20,10);
fill(0);
rect(390,165,40,10);
    }
               if(timer>540){
rect(115,175,30,10);
fill(255,255,0);
rect(145,175,30,10);
fill(0);
rect(175,175,10,10);
rect(350,175,10,10);
fill(255,255,0);
rect(360,175,40,10);
fill(0);
rect(400,175,20,10);

    }  
               if(timer>550){
rect(115,185,20,10);
fill(255,255,0);
rect(135,185,50,10);
fill(0);
rect(185,185,10,10);
rect(340,185,10,10);
fill(255,255,0);
rect(350,185,50,10);
fill(0);
rect(400,185,20,10);

    } 
   
               if(timer>560){
rect(125,195,10,10);
fill(255,255,0);
rect(135,195,50,10);
fill(0);
rect(185,195,20,10);
rect(235,195,70,10);
rect(330,195,10,10);
fill(255,255,0);
rect(340,195,60,10);
fill(0);
rect(400,195,10,10);

    }   
               if(timer>570){
rect(125,205,10,10);
fill(255,255,0);
rect(135,205,60,10);
fill(0);
rect(195,205,40,10);
fill(255,255,0);
rect(235,205,70,10);
fill(0);
rect(305,205,40,10);
fill(255,255,0);
rect(345,205,50,10);
fill(0);
rect(395,205,10,10);

    }  
               if(timer>580){
rect(135,215,10,10);
fill(255,255,0);
rect(145,215,40,10);
fill(0);
rect(185,215,20,10);
fill(255,255,0);
rect(205,215,130,10);
fill(0);
rect(335,215,20,10);
fill(255,255,0);
rect(355,215,30,10);
fill(0);
rect(385,215,10,10);

    }    
               if(timer>590){
rect(135,225,10,10);
fill(255,255,0);
rect(145,225,230,10);
fill(0);
rect(375,225,10,10);

    }   

               if(timer>600){
rect(145,235,10,10);
fill(255,255,0);
rect(155,235,210,10);
fill(0);
rect(365,235,10,10);
    }   
               if(timer>610){
rect(145,245,10,10);
fill(255,255,0);
rect(155,245,10,10);
fill(0);
rect(165,245,10,10);
fill(255,255,0);
rect(175,245,170,10);
fill(0);
rect(345,245,10,10);
fill(255,255,0);
rect(355,245,10,10);
fill(0);
rect(365,245,10,10);
    }       
               if(timer>620){
rect(155,255,10,10);
fill(255,255,0);
rect(165,255,190,10);
fill(0);
rect(355,255,10,10);
    }  
               if(timer>630){
rect(155,265,10,10);
fill(255,255,0);
rect(165,265,190,10);
fill(0);
rect(355,265,10,10);
    }      

               if(timer>640){
rect(145,275,10,10);
fill(255,255,0);
rect(155,275,210,10);
fill(0);
rect(365,275,10,10);
    }      
               if(timer>650){
rect(145,285,10,10);
fill(255,255,0);
rect(155,285,40,10);
fill(0);
rect(195,285,20,10);
fill(255,255,0);
rect(215,285,90,10);
fill(0);
rect(305,285,20,10);
fill(255,255,0);
rect(325,285,40,10);
fill(0);
rect(365,285,10,10);
    }    

               if(timer>660){
rect(145,295,10,10);
fill(255,255,0);
rect(155,295,30,10);
fill(0);
rect(185,295,10,10);
fill(255);
rect(195,295,10,10);
fill(0);
rect(205,295,20,10);
fill(255,255,0);
rect(225,295,70,10);
fill(0);
rect(295,295,20,10);
fill(255);
rect(315,295,10,10);
fill(0);
rect(325,295,10,10);
fill(255,255,0);
rect(335,295,30,10);
fill(0);
rect(365,295,10,10);
    }      
               if(timer>670){
rect(135,305,20,10);
fill(255,255,0);
rect(155,305,30,10);
fill(0);
rect(185,305,40,10);
fill(255,255,0);
rect(225,305,70,10);
fill(0);
rect(295,305,40,10);
fill(255,255,0);
rect(335,305,30,10);
fill(0);
rect(365,305,20,10);
    }  

               if(timer>680){
rect(135,315,10,10);
fill(255,255,0);
rect(145,315,50,10);
fill(0);
rect(195,315,20,10);
fill(255,255,0);
rect(215,315,40,10);
fill(0);
rect(255,315,20,10);
fill(255,255,0);
rect(275,315,30,10);
fill(0);
rect(305,315,20,10);
fill(255,255,0);
rect(325,315,50,10);
fill(0);
rect(375,315,10,10);
    }    

               if(timer>690){
rect(135,325,10,10);
fill(255,255,0);
rect(145,325,30,10);
fill(0);
rect(175,325,10,10);
fill(255,255,0);
rect(185,325,150,10);
fill(0);
rect(335,325,10,10);
fill(255,255,0);
rect(345,325,30,10);
fill(0);
rect(375,325,10,10);
    }       
  
                if(timer>700){
rect(135,335,10,10);
fill(255,255,0);
rect(145,335,10,10);
fill(0);
rect(155,335,30,10);
fill(255,255,0);
rect(185,335,150,10);
fill(0);
rect(335,335,30,10);
fill(255,255,0);
rect(365,335,10,10);
fill(0);
rect(375,335,10,10);
    }    
    
               if(timer>710){
rect(145,345,20,10);
fill(255,0,0);
rect(165,345,10,10);
fill(0);
rect(175,345,10,10);
fill(255,255,0);
rect(185,345,40,10);
fill(0);
rect(225,345,10,10);
fill(255,255,0);
rect(235,345,20,10);
fill(0);
rect(254,345,20,10);
fill(255,255,0);
rect(275,345,20,10);
fill(0);
rect(295,345,10,10);
fill(255,255,0);
rect(305,345,30,10);
fill(0);
rect(335,345,10,10);
fill(255,0,0);
rect(345,345,10,10);
fill(0);
rect(355,345,20,10);
    }    
    
                    if(timer>720){
rect(145,355,10,10);
fill(255,255,0);
rect(155,355,10,10);
fill(0);
rect(165,355,20,10);
fill(255,255,0);
rect(185,355,50,10);
fill(0);
rect(235,355,20,10);
fill(255,255,0);
rect(255,355,20,10);
fill(0);
rect(275,355,20,10);
fill(255,255,0);
rect(295,355,40,10);
fill(0);
rect(335,355,20,10);
fill(255,255,0);
rect(355,355,10,10);
fill(0);
rect(365,355,10,10);
    }   
    
                        if(timer>730){
rect(155,365,10,10);
fill(255,255,0);
rect(165,365,190,10);
fill(0);
rect(355,365,10,10);
    }   
    
                          if(timer>740){
rect(155,375,30,10);
fill(255,255,0);
rect(185,375,150,10);
fill(0);
rect(335,375,30,10);
    }    
                             if(timer>750){
rect(185,375,30,10);
fill(255,255,0);
rect(185,375,90,10);
fill(0);
rect(325,375,30,10);

    }     
   
   if(timer>780){
  timer = 0; }
}

//Pong stuff
class Ball {
  int x;
  boolean up, right;
  Ball() {
    x= 250;
    up=false;
    right=true;
  }
  
  void display(){
    fill(255);
    ellipse(x, y, 10, 10);
  }
  void move(){
    if (up==true){
      y=y-2;
    }
    if (up==false){
      y=y+2;
    }
    if (right==true){
      x=x+2;
    }
    if (right==false){
      x=x-2;
    }
  }
 
  void bounce(){
    if (get(x-5, y)!= color(0)){
      right=true;
    }
    if (get(x+5, y) != color(0)){
      right=false;
    }
    if (get(x, y-5) != color(0)){
      up=false;
    }
    if (get(x, y+5) != color(0)){
      up=true;
    }
    if (x<5){
      gameover = true;
      c++;
    }
  }
}
 
class ai{
  void aishow()
  {
    rect(490, y-30, 5, 60);
  }
}
 
class Paddle {
  int paddleY;
  Paddle(){
    paddleY=210;
  }
  void display(){
    rect(5, paddleY, 5, 60);
  }
  void keyMovement(){
    if (keyPressed==true){
      if (keyCode == UP){
        paddleY=paddleY-3;
      }
      if (keyCode== DOWN){
        paddleY=paddleY+3;
      }
    }
  }
}
 
void mouseClicked(){
  gameover = false;
  redraw();
}

void drawpacMan() {
  /*if (keyCode==UP||key=='w') {
    fill(255,255,0);
    arc(xPos, yPos, 80, 80, -PI/4, 5*PI/4);
    //Up
  }
  else */if (keyCode==RIGHT||key=='d') {
    fill(255,255,0);
    arc(xPos, yPos, 80, 80, PI/4, 7*PI/4);
    //Right
  }
  /*else if (keyCode==DOWN||key=='s') {
    fill(255,255,0);
    arc(xPos, yPos, 80, 80, -5*PI/4, PI/4);
    //Down
  }
  else */if (keyCode==LEFT||key=='a') {
    fill(255,255,0);
    arc(xPos, yPos, 80, 80, -3*PI/4, 3*PI/4);
    //Left
  }
}

class Dot {
  float x;
  float y;
  float w;
  float h;

  float blahX;
  float blahY;
  
  boolean colliding;
  
  
Dot (float tempX, float tempY, float tempW, float tempH, float tempXPos, float tempYPos){
  x = tempX;
  y = tempY;
  w = tempW;
  h = tempH;
  blahX = tempXPos;
  blahY = tempYPos;

  
  colliding = false;

}

void display() {
  if (colliding){
  fill (255);
  }
  else {
  fill(0);
  }
  ellipse(x,y,w,h);

}

void collision(float pacManX, float pacManY) {
  if(pacManX - x <= abs(10) && pacManY == y){
    colliding = true;
  }
  else {
    colliding = false;
  }
}

}


