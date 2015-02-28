
import netscape.javascript.*;


int pinky=-500;
int pacman=-500;


void setup(){
  
  size (800,250);
  background(0,0,0);
  noStroke();
}

void draw(){
  background(0);
  pacman (0,0);
  the3ghost_parameter (0,0);


}


void pacman (int x, int y){
  
  pacman=pacman+1;
  pacman=min(0, pacman);
  fill(255, 255, 0);
  ellipse(x+400+pacman,120,180,180);
  fill(0);
  triangle(x+450+pacman, 200, x+700+pacman, 80, x+380+pacman, 80);
    

}
void body_parameter (int x, int y){
  
  

  
  rect(x+100,y+100,10,100);                                    
  rect(x+110,y+60,10,150);
  rect(x+120,y+50,10,160);
  rect(x+130,y+40,10,160);
  rect(x+140,y+40,10,150);
  rect(x+150,y+30,10,170);
  rect(x+160,y+30,10,180);
  rect(x+170,y+30,10,180);
  rect(x+180,y+30,10,170);
  rect(x+190,y+40,10,150);
  rect(x+200,y+40,10,160);
  rect(x+210,y+50,10,160);
  rect(x+220,y+60,10,150);
  rect(x+230,y+100,10,100);
}

void eyes_parameter (int u, int v){
  
  fill(255);
  rect(u+120, v+70, 10, 40);
  rect(u+130, v+60, 10, 60);
  rect(u+140, v+60, 10, 60);
  rect(u+150, v+70, 10, 40);
  rect(u+180, v+70, 10, 40);
  rect(u+190, v+60, 10, 60);
  rect(u+200, v+60, 10, 60);
  rect(u+210, v+70, 10, 40);

}

void irises_parameter (int x, int y, int lr, int ud){
  
  x=x+10*lr;
  y=y+10*ud;
  
  
  fill(0);
  rect(x+130, y+80, 10, 30);
  rect(x+140, y+80, 10, 30);
  rect(x+190, y+80, 10, 30);
  rect(x+200, y+80, 10, 30);
  
}

void the3ghost_parameter (int x, int y){                           //
  
  //Ghost in the top right corner
  
  pinky=pinky+1;
  pinky=min(0, pinky);
  fill(20,0,255);                                               //Color Pink
  body_parameter (x+500+pinky,y);                                        //Calling Body
  eyes_parameter (x+500+pinky,y);                                        //Calling Eyes
  irises_parameter (x+500+pinky,y,1,0);                                  //Calling Irises
 

  
}

