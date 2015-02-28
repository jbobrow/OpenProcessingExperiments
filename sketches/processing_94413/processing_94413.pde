
float a = random(8,12);
float b=random(3,7);
float c=random(1,8);

void setup(){
  size(600,600);
  background(255);
  noStroke();
  frameRate(40);
}

void draw(){
  translate(mouseX,mouseY);
  if (mousePressed){
  splash();
  splash();
  splash();
  }
}
  
 void splash(){
   pushMatrix();
    fill(random(0,100),random(100,255),random(100,150),random(1,255));
      translate(random(-10,10),random(-10,10));
      ellipse(0,0,a,a);
      ssplash();
     recsplash();
      ssplash();
      recsplash();
      ssplash();
      popMatrix();
    }
    
    
    
    
    
    void ssplash(){

      pushMatrix();
      fill(random(100,255),random(0,100),random(150,200),random(1,255));
      translate(random(-10,10),random(-10,10));
      ellipse(0,0,b,b);
      popMatrix();
    }
    void recsplash(){
      pushMatrix();
      fill(random(50,100),random(0,100),random(100,200),random(1,255));
      translate(random(-10,10),random(-10,10));
      rect(0,0,c,c);
      popMatrix();
    }
