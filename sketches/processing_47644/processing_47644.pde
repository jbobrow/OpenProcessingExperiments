
int raster = 5;
G grid;
P player;
P bot1;
P bot2;
int pressed=0;

void setup(){
  frameRate(15);
  size(500,500);
  grid = new G();
  bot1 = new P(color(255,0,0));
  bot2 = new P(color(0,0,255));
  player = new P(color(0,255,0));
  background(0);
  grid.draw();
}

void draw(){
  bot1.position();
  bot1.direction();
  bot1.collision();
  bot1.display();
  bot2.position();
  bot2.direction();
  bot2.collision();
  bot2.display();
  player.position();
  player.collision();
  player.display();
  if(player.alive==0){
    fill(255);
    text("game over...",200,height/2);  
   // exit();
  }else if(bot1.alive==0 && bot2.alive==0){
    fill(255);
    text("You Won..!",200,height/2);      
  }
  
}

void keyPressed(){
  if(pressed==0){
    if(key == 'y' || key == 'Y'){
        player.dir--;
        pressed = 1;
    }else if(key == 'x' || key == 'X'){
        player.dir++;
        pressed = 1;
    }
  }
}
void keyReleased(){
  pressed=0;
}

class G{
  int x = width / raster - 1;
  int y = height / raster - 1;
  int[][] active = new int[x][y];
 
  G(){
    for(int i = 0; i < x; i++){
      for(int j = 0; j < y; j++){
        active[i][j]=0;
      }
    }
  }
  void draw(){
    stroke(255,20);
    for(int i = 0; i < x; i++){
      line(i*raster,0,i*raster,height);
    }
    for(int j=0;j < y; j++){
      line(0, j*raster, width, j*raster);
    }
    text("turn Left: x",10,10);
    text("turn Right: y", 10,20);
    text("player-color: green",10,40);
    text("bots are still quite stupid...",10,50);
 
  }
  
}

class P{
  int alive=1;
  int x;
  int y;
  int dir;
  color c;
  P(color tempC){
    x = int(random(grid.x));
    y = int(random(grid.y));
    dir=int(random(0,3));
    c = tempC;
  }
  
  void direction(){
    int newDir=int(random(-49,50));
    if(newDir<=0){newDir=-1;}else{newDir=1;}
    
    int xTmp = x, yTmp = y;
    switch(dir){
      case 0:
        xTmp++;
        break;
      case 1: 
        yTmp++; 
        break;
      case 2:
        xTmp--;
        break;
      case 3:
        yTmp--;
        break;      
    }
    if(xTmp<0){xTmp=grid.x-1;}
    if(xTmp>grid.x-1){xTmp=0;}
    if(yTmp<0){yTmp=grid.y-1;}  
    if(yTmp>grid.y-1){yTmp=0;}
    
    if(grid.active[xTmp][yTmp]==1){dir+=newDir;}
    if(dir<0){dir=3;}
    if(dir>3){dir=0;}
  }
  void position(){
    if(alive==0){return;}
    if(dir < 0){dir = 3;}
    if(dir > 3){dir = 0;}
    
    switch(dir) {
      case 0:
        x++;
        break;
      case 1: 
        y++; 
        break;
      case 2:
        x--;
        break;
      case 3:
        y--;
        break;
    }
    if(x > grid.x-1){x = 0;}
    if(x < 0){x = grid.x-1;}
    if(y > grid.y-1){y = 0;}
    if(y < 0){y = grid.y-1;}
  }
  
  void collision(){
    if(grid.active[x][y] == 1){
      alive = 0;
    }else{
      grid.active[x][y]=1;
      
    }
  }
  
  void display(){
    if(alive==0){return;}
    fill(c);
    stroke(0);
    rect(x * raster, y * raster, raster, raster);
  }

}
                
