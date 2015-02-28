
Raindrop[] raindrops = new Raindrop[200];

void setup(){
  size(600,600);
  background(49,79,79);
  noStroke();
  smooth();
  
  for(int i = 0; i<raindrops.length; i++){
    raindrops[i] = new Raindrop(random(5));
  } 
}

void draw(){ 
  background(49,79,79);
  
  fill(0,100,0);
  ellipse(0,600,500,500);
  ellipse(600,600,500,500);
  ellipse(300,600,500,500);
  
  for(int i = 0; i<raindrops.length; i++){
    raindrops[i].raining();
  }
  
  fill(139,69,19);
  rect(((width/2)-10),0,20,600);
  rect(0,((height/2)-10),600,20);
  
  fill(225,0,0);
  triangle(0,0,0,height,50,0);
  triangle(550,0,width,0,width,height);
} 

class Raindrop{
  float x = 0;
  float y = 0;
  float m = 0;
  
  public Raindrop(float m){
    this.x=random(width);
    this.y=random(height);
    this.m=m;
  }
  
  public void raining(){
    fill(225);
    ellipse(x,y,random(5),random(10));
    
    
    if(y<height){
      y+=m;
    }else{
      y=0;
    }
  }  
}


