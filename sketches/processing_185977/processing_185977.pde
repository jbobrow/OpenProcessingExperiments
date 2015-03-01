
Pipe player;
NPC oponent;
Ball ball;
int o_point = 0, p_point = 0;

void setup(){
   size(800, 600);
   player = new Pipe(0);
   oponent = new NPC(1);
   ball = new Ball();
}

void draw(){
  background(#333333);
  stroke(#EEEEEE);
  strokeWeight(2);
  line(width/2, 0, width/2, height);
   textSize(36);
    text("Yogesh Pong Game", 200, 200);
  score();
  player.render_pipe();
  oponent.render_pipe();
  oponent.follow_ball();
  ball.render_ball();
  ball.move();
}


void score(){
  textSize(32);
  text(o_point, width/4, 50);
  text(p_point, width/1.35, 50);  
}

class Pipe{
  
  int position = 0;
  float py = (height/2)-62.5;
  float py_temp = 0;
  
  Pipe(int side){
    position = side == 1 ? 15 : width-15;
  }

  void render_pipe(){
    rect(position, py, 5, 125);    
  }
  
  void move(boolean direction){     
     py_temp = direction ? -8.55 : 8.55;
     check_limits(py + py_temp);
     py += py_temp;
  }  
  
  void check_limits(float antecipate){
    if(antecipate <= 2 || antecipate >= height - 127){
      if(py - 2 < 0){
        py_temp = 0;
      } else if(py + 127 > height){
         py_temp = height - (py + 125);
      }  
    }   
  }
}

class NPC extends Pipe{
 int press_time = 0;
 NPC(int side){
   super(side);  
 }
 
  void follow_ball(){
    if(millis() - press_time >= 45){
      if(ball.by < py+64.5){
        super.move(true);
      } else if(ball.by > py+64.5){
        super.move(false);
      }
      press_time = millis();
    }
  } 
}

class Ball{
   float bx, by;
   boolean wall_collision, pipe_collision;
   
   Ball(){
    ball_configure();
   }
   
   void ball_configure(){
     bx = width/2;
     by = height/2;   
     wall_collision = random(1) > .5? true : false;
     pipe_collision = random(1) > .5? true : false;     
   }
   
   void render_ball(){
     strokeWeight(3);
     stroke(#CCCCCC);
     ellipse(bx, by, 15, 15); 
   }
   
   void move(){
     check_limits();
     check_collision(); 
     by += wall_collision? 3.4 : -3.4;
     bx += pipe_collision? 2.75 : -2.75;
   }
   
   void check_limits(){
     if(by <= 10 || by >= height){
       wall_collision = !wall_collision;       
     } 
     if(bx < 0){
       p_point++;
       ball_configure();
     } else if(bx > width){
       o_point++;
       ball_configure();
     }
   }
   
   void check_collision(){
      if(bx >= width-20){
        if(by <= player.py + 125 && by >= player.py ){
          pipe_collision = !pipe_collision;
        }
      }
      if(bx <= 20){
        if(by < oponent.py + 125 && by >= oponent.py){
          pipe_collision = !pipe_collision;
        }
      }
   }
  
}

void keyPressed(){
  if(keyCode == UP){
    player.move(true);
  } else if(keyCode == DOWN) {
    player.move(false);
  }
}
// gui.pde





