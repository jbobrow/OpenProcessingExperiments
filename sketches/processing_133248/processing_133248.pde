
int p, s, h, point = 1;
float pTime = 0;
float x = 0;
float GRAV = 0.2;
float y = 200;
float yv;
float n = 0;
PImage fish, pipe;
int frame = 0;
ArrayList pop;

void setup(){
    size(400, 400);
    background(100, 100, 200);
    strokeWeight(2);
    pop = new ArrayList();
    fish = loadImage("http://piq.codeus.net/static/media/userpics/piq_164380_400x400.png");
    pipe = loadImage("http://piq.codeus.net/static/media/userpics/piq_164386_400x400.png");
    imageMode(CENTER);
    rectMode(CENTER);
    fill(255);
    textSize(32);
    text("Click to fly", width/3-10, height/2);
}

void draw(){
  if(focused && frame == 1){
      background(100, 100, 200);
      parallax();
      update();
      drawPillar();
      drawFish();
      drawScore();
      text(y, width/2, height/2);
      
      game();
  }
}

void keyPressed(){
    if(key == CODED && keyCode == UP){
        yv = -5;
    }
}

void mousePressed(){
    if(frame == 0){
        frame = 1;
    }
    yv = -5;
}

void update(){
    if(n>2 && (pop.get(point-1).xPos() <= (-300) && pop.get(point-1).xPos() >= (-320))){ 
          point += 1;
          
    }
    if(n>2){
      fill(255);
      text(pop.get(point-2).yPos(), width/2, height-50);
    }
         
       
    if(y<=0) yv = 5;   
    if(y>=height-40){ 
        yv = -3;
    }else{
        yv += GRAV;
    }
    if(yv >= 4){
      y += 4;
    }else{
      y += yv; 
    }
    x += 1.5;
}

void drawPillar(){
  
  pTime += 1.5;
   if(pTime >= 150){
      pop.add(new Pipe());
      pTime = 0;
      if(n<4) n += 1;
   } 
   for(int i=pop.size()-n; i< pop.size(); i++){
       pop.get(i).draw();
     }
    
   
}

void parallax(){
  p = 3;
  s = 100;
  h = 50;
  stroke(0);
  for(int j=0; j<2; j++){
     for(int i=0; i<20; i++){
         fill(p*50, 200+p*50, 100+p*50);
         translate(width*(i)-x/p, height-h);
         ellipse(0, 0, s, 200); 
         resetMatrix();
         translate(width/2, height-h);
         fill(0, 220+p*20, 10+p*20);
         rect(0, 0, width, 40);
         resetMatrix();
      }
      s += 50;
      p -= 1;
      h -= 20;
  }
  translate(width/2, height-20);
  fill(0, 220, 10);
  rect(0, 0, width, 40);
  resetMatrix();
}

class Pipe{
    float x;
    float r;
    Pipe(){
        r = random(100, height-100);
    }
    
    void draw(){
        x -= 1.5;
        fill(180);
        noStroke();
        translate(40+width+x, r);
        rect(0,-250,30,400);
        rect(0,250,30,400);
        image(pipe, 0, 0, 400, 550);
        resetMatrix();
    }
    
    float xPos(){
       return x; 
    }
    float yPos(){
       return r; 
    }
}

void drawFish(){
      stroke(0);
      translate(120, y);
      fill(200, 50, 50);
      rotate(yv/14);
      ellipse(0, 0, 30, 20);
      image(fish, 0, 0, 50, 50);
      resetMatrix();
}

void drawScore(){
    fill(255);
    textSize(32);
    text(point-1, width/2-20, height/8);
}

void game(){
   if(frame == 2){
        fill(255);
        textSize(64);
        text("Game Over", width/10, height/2);
    } 
}
