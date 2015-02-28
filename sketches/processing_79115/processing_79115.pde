
float sec;
float vx=5;
float vy=5;
float x=0;
float y=10;
float frictionx=.998;
float frictiony=-.75;
float gravity=.1;

PFont font;



void setup(){
  size(600,600);
  background(0,0,0);
  sec=0;

}


void draw(){
  println("x: "+mouseX+"y: "+mouseY);
  vy += gravity;
  vx*= frictionx;
  x += vx;
  y += vy;

  
  
  if(y > height){
    y=height;
    vy*= frictiony;
    vx*= frictionx;
  }
  
  
  //fill(random(100,300),194,132,90);
  fill(mouseX-100,mouseY-100,random(150,200),90);
  noStroke();
  ellipse(x,y,15,20);
    if(x>600){
      x +=-1;
      vx +=-5;
    }
    if(x<0){
      x+=1;
      vx +=5;
    }
    if(y<0){
      y+=-1;
      vy+=5;
    }
    
    fill(random(247),162,162,60);
    ellipse(width/2,400,40,40);
    fill(random(193),121,156);
    ellipse(width/2,400,30,30);
    fill(random(193),121,156);
    ellipse(width/2,400,20,20);
    
    fill(random(247),162,162,60);
    ellipse(width/2,200,40,40);
    fill(random(193),121,156);
    ellipse(width/2,200,30,30);
    fill(random(193),121,156);
    ellipse(width/2,200,20,20);
    
    fill(random(247),162,162,60);
    ellipse(200,height/2,40,40);
    fill(random(193),121,156);
    ellipse(200,height/2,30,30);
    fill(random(193),121,156);
    ellipse(200,height/2,20,20);
    
    fill(random(247),162,162,60);
    ellipse(400,height/2,40,40);
    fill(random(193),121,156);
    ellipse(400,height/2,30,30);
    fill(random(193),121,156);
    ellipse(400,height/2,20,20);
    
  if(dist(x,y,width/2,400)<10){
    fill(random(200),random(132),124,90);
    rect(0,0,600,600);
  }
  
    if(dist(x,y,width/2,200)<10){
    fill(random(200),random(132),124,90);
    rect(0,0,600,600);
  }
  
    if(dist(x,y,200,height/2)<10){
    fill(random(200),random(132),124,90);
    rect(0,0,600,600);
  }
  
    if(dist(x,y,400,height/2)<10){
    fill(random(200),random(132),124,90);
    rect(0,0,600,600);
  }
  
  
}


void mouseReleased(){
  vy-=4;
  vx-=4;
}

