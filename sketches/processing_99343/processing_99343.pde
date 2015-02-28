
int score= 0;
boolean gameover = false;
Food food = new Food();
ArrayList<Segment> segments = new ArrayList<Segment>(); 
int Locationx= 300;
int Locationy = 300;
char oldDirection;
char Direction;
boolean addsegment = false;
int snakeMovementTimer = 0, snakeMovementDelay = 4; 


void setup(){
 size(600,600);

 segments.add(new Segment(Locationx,Locationy));

}



void draw(){
   background(0);  

  for(int i = 0; i < segments.size(); i++) 

    segments.get(i).renderSegment(); 

  food.renderFood();  
  if (!gameover) 
    snakeMovementTimer++;
  
   update(); 
    snakeMovementTimer = 0;
}

void keyPressed(){
  switch(keyCode){
   case UP:if(segments.size() ==1 || oldDirection != 'W')
   Direction = 'W';
   break;
   case DOWN:if(segments.size() ==1 || oldDirection != 'S')
   Direction = 'S';
   break;
   case LEFT:if(segments.size() ==1 || oldDirection != 'A')
   Direction = 'A';
   break;
   case RIGHT:if(segments.size() ==1 || oldDirection != 'D')
   Direction = 'D';
   break;
   
  }
}

void update() {
   segments.add(new Segment((int)segments.get(segments.size() - 1).location.x, (int)segments.get(segments.size() - 1).location.y));
   for(int a = segments.size() - 1; a > 0; a--) { 
    if(!addsegment) segments.get(a).location = new PVector(segments.get(a - 1).location.x, segments.get(a - 1).location.y); 
    addsegment = false; 
  }


 switch(Direction) { 
    case 'W': segments.get(0).location.y -= 20; 
    break; 
    case 'S': segments.get(0).location.y += 20;
    break; 
    case 'A': segments.get(0).location.x -= 20;
    break; 
    case 'D': segments.get(0).location.x += 20;
    break;
  }
  oldDirection = Direction;
  
}

class Food { 
  PVector location; 
  Food() { 
 this.location = new PVector((int)random(20)*20, (int)random(20)*20);
  }
   
  void renderFood() { 
    fill(255, 0, 0); 
    stroke(255); 
    rect(this.location.x, this.location.y, 20, 20); 
  
  
  
  if(this.location.x == segments.get(0).location.x && this.location.y == segments.get(0).location.y){
    
   score++;
   //Food = new Food();
  }
  
  }

}

class Segment { 
  PVector location; 
  

   
  Segment(int x, int y) {
  this.location = new PVector(x, y); 
  }
  void renderSegment(){
  fill(255,255,0);
  stroke(255);
  rect(this.location.x,this.location.y,20,20);
   }
   
   
   
   
}
