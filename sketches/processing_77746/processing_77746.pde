
class mover{
  PVector loc, vel, acc;
  float topspeed;
  color col;
  mover[] temp;
  int id;
  
  mover(mover[] temp_,int id_){
    loc = new PVector(random(width),random(height));
    vel = new PVector(0,0);
    topspeed = 4;
    temp = temp_;
    id = id_;
    col = color(random(255), random(255), random(255));
  }
  
  void update(){
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse,loc);
    dir.normalize();
    dir.mult(0.1);//计算出加速度，然后单位化，最后来考虑大小
    acc = dir;
    
    vel.add(dir);
    vel.limit(topspeed);//做一个速度限制
    loc.add(vel);
  }
  
  void connect(){
    for(int i = id+1;i<ball.length;i++){
      float d = PVector.dist(loc,temp[i].loc);
      if(d < dista_max){//感谢贝赛尔
        fill(int((red(col)+red(temp[i].col))/2),int((green(col)+green(temp[i].col))/2),int((blue(col)+blue(temp[i].col))/2));
        float angle = atan2(temp[i].loc.y-loc.y,temp[i].loc.x-loc.x);
        float angle1 =atan2(loc.y-temp[i].loc.y,loc.x-temp[i].loc.x);
        beginShape();
        vertex(loc.x+r*cos(PI/4+angle),loc.y+r*sin(PI/4+angle));
        bezierVertex(loc.x+r*cos(PI/36+angle),loc.y+r*sin(PI/36+angle),
                     temp[i].loc.x+r*cos(-PI/36+angle1),temp[i].loc.y+r*sin(-PI/36+angle1),
                     temp[i].loc.x+r*cos(-PI/4+angle1),temp[i].loc.y+r*sin(-PI/4+angle1));
        
        vertex(temp[i].loc.x+r*cos(PI/4+angle1),temp[i].loc.y+r*sin(PI/4+angle1));
        bezierVertex(temp[i].loc.x+r*cos(PI/36+angle1),temp[i].loc.y+r*sin(PI/36+angle1),
                     loc.x+r*cos(-PI/36+angle),loc.y+r*sin(-PI/36+angle),
                     loc.x+r*cos(-PI/4+angle),loc.y+r*sin(-PI/4+angle));
        endShape();
        }
    }
  }
 
    
  void display(){
    stroke(0);
    fill(col);
    ellipse(loc.x,loc.y,2*r,2*r);
  }
  
  void checkEdges(){
    if(loc.x > width){
      loc.x = 0;
    }else if(loc.x < 0){
      loc.x = width;
    }
    
    if(loc.y > height){
      loc.y = 0;
    }else if(loc.y < 0){
      loc.y = height;
    }
  }
}
    

