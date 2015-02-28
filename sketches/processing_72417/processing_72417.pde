

float y1;
float r;
float speedChange;

void setup(){

  size(200,600);
  background(0);
  frameRate(100);
  smooth();
	
}

void draw(){
  fill(0,5);
  rect(0,0,width,height);
  r=(y1)%6.5;
  
  noStroke();
  fill(255-(y1/3)%255,random(200,255),random(20,30));
  ellipse(10,y1%height,r,r);
  
  fill(255,(255-y1/2)%height,0);
  ellipse(100,y1*3%height,r*5,r*5);
    fill(0,100);
  ellipse(100,y1*3%height,20,20);
  
  fill(255-y1,y1/3%255,random(200,255));
  ellipse(150,y1*2%height,r*3,r*3);
  fill(0,100);
  ellipse(150,y1*2%height,10,10);
  
  fill(200,y1,r*100,255-y1/2);
  ellipse(130,y1/2,r/2,r/2); 
  
  fill(y1/3%255,255,255-y1);
  ellipse(50,height-y1*2%height,r*3,r*3);
  fill(0,100);
  ellipse(50,height-y1*2%height,10,10);
  
  y1=frameCount%height;
  

}


