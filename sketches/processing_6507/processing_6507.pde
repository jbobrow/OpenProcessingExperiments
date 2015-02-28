

Candle[] candles = new Candle[9];
Shamash s;
void setup(){
  size(250,250); 
  frameRate(20);

makeCandles();

}

void makeCandles(){
    
   for(int i = 0; i < 4; i++){
    candles[i] = new Candle(18+(i*25),60);
    candles[i+4] = new Candle(142+(i*25),60);

  } 
  candles[8] = null;
  s =  new Shamash();
}

void keyPressed(){
   if(key == ' '){
      makeCandles();
   } 
}

void draw(){
  background(0,56,184);
  noFill();

  strokeWeight(18);
  stroke(0);
  drawMenorah();
  strokeWeight(10);
  stroke(200);
  drawMenorah();

  


  for(int i = 0; i < candles.length; i++){
    if(candles[i] != null){
      candles[i].draw();
    } 
  }

  
  if(s != null){
    s.move();
    s.draw();
   
  }
}

void mousePressed(){
   if(s == null){
      s = new Shamash(candles[8]);
      candles[8] = null;
   } else {
     candles[8] = new Candle(s);
     s = null;
   }
}


void drawMenorah(){
  rect(123,100,4,100);
  rect(110,200,30,10);

  arc(125, 100, 200,100, PI/2, PI);
  arc(125, 100, 150,80, PI/2, PI);
  arc(125, 100, 100,60, PI/2, PI);
  arc(125, 100, 50,40, PI/2, PI);

  arc(125, 100, 200,100, 0, PI/2);
  arc(125, 100, 150,80,  0, PI/2);
  arc(125, 100, 100,60,  0, PI/2);
  arc(125, 100, 50,40,  0, PI/2);


}

class Shamash{
  color c = color(random(128,255),random(128,255),random(128,255));
  float x = 10;
  float y = 20;
  
  Shamash(){
    
  }
  Shamash(Candle c){
    this.c = c.c;
  }
  
  void move(){
  x = mouseX -5;
    y = mouseY - 10;
    

      
      for(int i = 0; i < 8; i++){
         Candle c = candles[i];
         
           if(isNear(c)){
              c.lit = true; 
           }
      }
      

  }
  
 boolean  isNear(Candle c) {
   if(c == null) return false;
   return (   abs((c.x +4)- x) < 5 && abs(c.y -23- y) < 10);   
 }
  
  void draw(){
    pushMatrix();
    translate(x,y);
    pushMatrix();
    
    rotate(3*PI/4);
          strokeWeight(4);
    stroke(0);
    fill(c);

    rect(0,0,15,40);
    line(7,0,7,-10);

    popMatrix();

      noStroke();
    fill(255,200,0);
    float s = random(10,20);
  ellipse(3,5,8,s);
    
    popMatrix();
  }

}

class Candle{
  float x,y;
  color c;
  boolean lit = false;

  Candle(Shamash s){
    this.c = s.c;
    this.x = 118;
    this.y = 52;
    lit = true;
  }

  Candle(float x,float y){
    this.x = x;
    this.y = y;
    this.c = color(random(128,255),random(128,255),random(128,255));
  } 

  void draw(){
    strokeWeight(4);
    stroke(0);
    fill(c);

    rect(x,y,15,40);
    line(x+7,y,x+7,y-10);
    if(lit) {
      noStroke();
    fill(255,200,0);
    float s = random(10,20);

   ellipse(x+7,y-s/2-4,8,s);
    }
  }


}


