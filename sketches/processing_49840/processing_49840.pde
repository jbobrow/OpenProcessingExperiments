
int score = 0; int timeLeft = 30; int highScore = -1;
boolean gameOn = false;
boolean isGood;
boolean virgin = true;
ArrayList<Thing> enemies = new ArrayList<Thing>();
Thing p = new Thing(true);
void setup(){
  
  
  
//  textFont(createFont("",10));
  frameRate(30);
     size(500,600);   
     for(int x = 0; x < 15;x++){
        enemies.add(new Thing(false));
    }
     background(200);
    smooth();
}

void reset(){
 gameOn = true; 
 score = 0;
 timeLeft = 30;
}

void mousePressed(){
   if(!gameOn){
      reset();
      background(200);
      p = new Thing(true);
   } 
}

void draw(){
   
  if(frameCount % 30 == 0){
    if(gameOn) timeLeft--;
    if(timeLeft <= 0){
      virgin= false;
       gameOn=false; 
       if(score > highScore){
        highScore = score; 
       }
    }
  }
  
   p.mouseMove();
   p.draw();
   p.grow();
    for(Thing e : enemies){
        e.move();
        e.draw();    
    }      
    
    for(int a = 0; a < enemies.size(); a++){
        Thing at = enemies.get(a);
    if(at.hit(p)) at.bounce(p,true);
      for(int b = a+1; b < enemies.size(); b++){
        Thing bt = enemies.get(b);
        if(at.hit(bt)){
          
          at.bounce(bt,false);
           //stroke(255,0,0);
           //line(at.x,at.y,bt.x,bt.y); 
        }
      }    
    }
    
    printScore();
}

class Player{
  float x, y; float sz = 20;
  float xs,ys;

 
 void draw(){
  fill(255);
  ellipse(x,y,sz,sz);
 } 
}
float MM = .2;

color GREEN = color(100,200,100);
float MAX = 1;
class Thing {
    float x,y,sz;
    float xs,ys;
    color c;
    
    boolean hit(Thing t){
       if(dist(x,y,t.x,t.y) < (sz+t.sz)/2) return true;
       return false;
    }
    void grow(){
      if(sz < 50){
      sz+=.2;
      
        isGood = false;
      } else {
          if(gameOn)score++;
         isGood = true;
      }
      
    }
    
    void bounce(Thing t, boolean shrink){
       float totalsz = sz + t.sz;
       float totalxs = xs + t.xs;
        float totalys = ys + t.ys;
       xs = totalxs * (sz/totalsz);
       ys = totalys * (sz/totalsz);
       t.xs = totalxs * (t.sz/totalsz);
       t.ys = totalys * (t.sz/totalsz);
       
       if(shrink){
           t.sz -= 2;
           }
   /* 
      xs *= -1;
      ys *= -1;
      t.xs *= -1;
      t.ys *= -1;
     */   
    }
    Thing(boolean player){

    if(! player){
        x = random(width);
        y = random(width);    
        sz = random(5,20);
        c = color(random(50,200),random(50,200),random(50,200));
    } else {
        x = 250;
        y = 250;    
        sz = 50;
        c = color(255);
    
    }  
  }
  
  void mouseMove(){
 //   xs += (mouseX -x) / 500;
 //   ys += (mouseY -y )/ 500;
   if(mouseX < x) xs -= MM;
   if(mouseX > x) xs += MM;
   if(mouseY < y) ys -= MM;
   if(mouseY > y) ys += MM;
   
   
    x += xs;
    y += ys;
    
        if(x < 0) { x = 0; xs *= -.5;}
        if(x > 500) { x = 500; xs *= -.5;}
        if(y < 0) { y = 0; ys *= -.5;}
        if(y > 500) { y = 500; ys *= -.5;}
  
    
    
  }
  
    void draw(){
        fill(c);
        stroke(0);
        //noStroke();
        ellipse(x,y,sz,sz);
        fill(0);
        //ellipse(
    }
    void move(){
        xs += random(-MAX,MAX);

        ys += random(-MAX,MAX);
        x+= xs;
        y += ys;
        
        if(x < 0) { x = 0; xs *= -.5;}
        if(x > 500) { x = 500; xs *= -.5;}
        if(y < 0) { y = 0; ys *= -.5;}
        if(y > 500) { y = 500; ys *= -.5;}
        
        
        
    }
    
}



void printScore(){
   noStroke();
  fill(200);
 rect(0,550,500,60);
 fill(0);stroke(0);
 textAlign(CENTER);
 int per = Math.round(100 * (p.sz / 50));
 if(!gameOn){
   String txt = "TENDRILS -- try to stay full size by avoiding being hit - click to start";
   if(! virgin){
    txt+="\nlast score: "+score +"\nrecent high score:"+highScore; 
   }
    text(txt,0,550,500,50);
    
 } else{
   text("size:"+per+"%   time left:"+timeLeft+"   score:"+score,0,550,500,50);
 }
}

