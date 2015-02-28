
/* @pjs preload = "seasons.png, winter.png, spring.png, summer.png, autumn.png" ; */

int State = 0 ;
 
void setup() {
  
  size(600, 400) ;
  
  
}

void draw() {
  
  
  switch(State) {
    case 0:
    PImage seasons ;
    seasons = loadImage("seasons.png") ;
    image(seasons, 0, 0) ;
    break ;
    
    case 1:
    PImage winter ;
    winter = loadImage("winter.png") ;
    image(winter, 0, 0) ;
    break ;
    
    case 2:
    PImage spring ;
    spring = loadImage("spring.png") ;
    image(spring, 0, 0) ;
    break ;
    
    case 3:
    PImage summer ;
    summer = loadImage("summer.png") ;
    image(summer, 0, 0) ;
    break ;
    
    case 4:
    PImage autumn ;
    autumn = loadImage("autumn.png") ;
    image(autumn, 0, 0) ;
    break ;
  }
}

void mousePressed() {
  State = State + 1 ;
  if (State > 4) {
    State = 0 ;
  }
}


