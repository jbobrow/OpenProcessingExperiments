
Slider slide01, slide02, slide03, slide04;

void setup(){
  size(800,450);
  background(255);
  smooth();
  
  slide01 = new Slider(width/8,height/4,50,250);
  slide02 = new Slider((width/8)*2,height/4,50,250);
  slide03 = new Slider((width/8)*3,height/4,50,250);
  slide04 = new Slider((width/8)*4,height/4,50,250);
  
}

void draw(){
  
  background(255);
  
  slide01.update();
  slide01.display();
  
  slide02.update();
  slide02.display();
  
  slide03.update();
  slide03.display();
  
  slide04.update();
  slide04.display();

  float v1 = map(slide01.value,0,255,100,50);
  float v2 = map(slide02.value,0,255,0,100);
  float v3 = map(slide03.value,0,255,0,100);
  float v4 = map(slide04.value,0,255,1,15);

//use sliders
 fill(slide03.value);
// strokeWeight(map(slide04.value,0,255,1,10));
 kittyHead(width-(width/4),height/2,v1,v2,v3,v4);


}


void kittyHead(float x, float y, float e, float c, float s, float b){ 

  pushMatrix();
  translate(x,y);
  scale(1.5);
  colorMode(HSB, 100);
  fill(c,s,300-s*3);
  colorMode(RGB,255);
  stroke(75);
  strokeWeight(12);
  ellipse(0,0,125,125);
  triangle(-70,-e,-30,-50,-50,-30);
  triangle(70,-e,30,-50,50,-30);
  
  noStroke();
  ellipse(0,0,125,125);
  triangle(-70,-e,-30,-50,-50,-30);
  triangle(70,-e,30,-50,50,-30);
  
  colorMode(HSB, 100);
  fill(c/2,c,100);
  colorMode(RGB,255);
  ellipse(-27,0,15,b);
  ellipse(27,0,15,b);
  
  fill(0);
  ellipse(-27,0,5,b);
  ellipse(27,0,5,b);
  
  stroke(75);
  strokeWeight(1);
  fill(75);
  triangle(-8,22,0,30,8,22);
  
  popMatrix();
  noStroke();

  
}

class Slider{
  
float sliderX;
float sliderY;
float sliderSize;
float posX,posY;
float sWidth;
float sHeight;

float value;

float dir;
  
  Slider(float x, float y, float w, float h){

  sliderX = x;        //SLIDER H POSITION
  sliderY = y;       //SLIDER V POSITION
  sliderSize = w;
  
  posX = sliderX;
  posY = sliderY;
  
  value = 0;
  
  sWidth = w;
  sHeight = h;
  
  }
  
  void update(){
    
    
    
    
  
  if(mousePressed && dist(mouseX,mouseY,sliderX,sliderY)<sliderSize){    
  
   sliderY = mouseY;
  

  sliderSize = sWidth*3;
  
  }
  
  else{
    sliderSize = sWidth;
    
  
  }
  
  if(sliderY < posY){
    sliderY = posY;
    dir = 0;
  }
  if(sliderY > (posY+sHeight)-sWidth){
    sliderY = (posY+sHeight)-sWidth;
    dir=0;
  }
  
  println(dir);
    
  if(dist(mouseX,mouseY,sliderX,sliderY)<sWidth){    
  cursor(HAND);
  }else{
    cursor(ARROW);
  }
    
    value = map((sliderY-posY),0,sHeight-sWidth,255,0);
    
    
    
  }

  
  void display(){
    
  noStroke();  
  strokeWeight(3);
  fill(value/1.5);
  rect(posX-(sWidth/2),posY-(sWidth/2),sWidth,sHeight);
  fill(255);
  stroke(100);
  rect(sliderX-(sWidth/2),sliderY-(sWidth/2),sWidth,sWidth); 
    
  }
  
  
  
  
}


