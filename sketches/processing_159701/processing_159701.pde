
ArrayList<Raindrop> Rainstorm;

void setup(){
  size(500, 500);
  background(42, 56, 57);
  noStroke();
  
  Rainstorm = new ArrayList<Raindrop>();
  for (int i = 0; i < 50; i++){
    Raindrop drop= new Raindrop();
    drop.x = int(random(0, width));
    drop.y = int(random(0, height));
    Rainstorm.add(drop);
  }
}

void draw(){
  background(42, 56, 57);
  handle();
  ghostBody();
  ghostBottom();
  rain();
}

void ghostBody(){
  fill(200);
  ellipse(width/2, height/3, width/2, height/2);
  rect(width/4, height/3, width/2, 18*height/24-height/2);
  fill(0);
  ellipse(4*width/10, 3*height/8, width/10, height/8);
  ellipse(6*width/10, 3*height/8, width/10, height/8);
  ellipse(width/2, 2*height/24, 12, 8);
}

void ghostBottom(){
  fill(200);
  beginShape();
  int count = 0;
  for (int i = 0; i < width; i+= width/24){
    count++;
    
    curveVertex(i+frameCount%(width/12), 14*height/24+(10*(count%2)));
  }
  endShape();
  fill(42, 56, 57);
  rect(0, 0, width/4, height); 
  rect(3*width/4, 0, width/4, height); 
  fill(0, 80);
  ellipse(width/2, 13*height/15, width/2, height/12);
  
}

void handle(){
  fill(70);
  rect(width/2-1*width/50, height/2 , width/25, 3*height/14); 
  ellipse(width/2-2*width/50, height/2+2*height/10+height/45, width/9+width/100, width/9);
  fill(42, 56, 57);
  rect(width/2-3*width/50, height/2, width/25, 3*height/14);
  ellipse(width/2-3*width/50+width/50, height/2+3*height/14, width/25, width/25);
  rect(width/2-width/4, height/2, width/5, 3*height/14);
}

void rain(){
  
  for (int i = 0; i < Rainstorm.size(); i++){
    Raindrop thisDrop = Rainstorm.get(i);
    thisDrop.advanceDrop();
  }
}

class Raindrop{
  int x;
  int y;

  void drawRaindrop(){
    fill(175, 213, 216, 100);
    beginShape();
    curveVertex(this.x, this.y);
    curveVertex(this.x, this.y+4);
    curveVertex(this.x, this.y+16);
    curveVertex(this.x+4, this.y+20);
    curveVertex(this.x+8, this.y+20);
    curveVertex(this.x+8, this.y+12);
    curveVertex(this.x, this.y+4);
    curveVertex(this.x-4, this.y);
    endShape();    
  }  
  
  void advanceDrop(){
    this.x = this.x+2;
    this.y = this.y+4;
    if (this.x > width){
      this.x = 0;
    }
    if (this.y > height){
      this.y = 0;
    }
    else{
      this.drawRaindrop();
    }
  }
}




