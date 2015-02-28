
float i = 0;

void setup()
{
  size(640, 480);
  smooth();
  rectMode(CENTER);
  
  for(int x=0; x<width; x+=150){
    
    for(int y=0; y<height; y+=150){
      drawMickey(x,y,10);
    }
    
  }
  

}

void draw(){
/*
  i++;
  
  if(i > 60){
    i = 0;
  
    background(255);
  
  }
*/  

}

void drawMickey(float x, float y, float num){
  if(num <= 0){
    return;
  }

  fill(255,255,255,50);
  stroke(200);
  ellipse(x,y,10*num,10*num);
  
  fill(0,0,0,50);
  stroke(50);
  ellipse(x + 5*num, y - 5*num, 5*num,5*num);
  ellipse(x - 5*num, y - 5*num, 5*num,5*num);
  
  ellipse(x - 2*num, y, 1*num,5*num);
  ellipse(x + 2*num, y, 1*num,5*num);
  
  drawMickey(x,y,num-1);
}


void drawS(float x, float y, float n){
  //beginShape();
  fill(random(255),random(255),random(255)); stroke(0); strokeWeight(2);
  drawSnowflake(x,y,n);
  //endShape(CLOSE);  
}

void drawSnowflake(float x0, float y0, float num){
  if(num <= 0){
    return;
  }
  
  //ellipse(x0,y0,random(num),random(num));
  
  ellipse(x0, y0, num*10 ,num*10);
  fill(0);
  ellipse(x0-num*5, y0-num*4 , num*2, num*4);
  fill(0);
  ellipse(x0+num*2, y0-num*2 , num*2, num*4);
  fill (255);
  //bezier(150, 295, 200, 370, 300, 370, 350, 295);
  //line(150, 295, 350, 295);
  //line(160, 180, 210, 135);
  //line(340, 100, 290,75 );

  
  
  
  
  
  float x1 = x0 + random(20)-10;
  float y1 = y0 + random(20)-10;
    
  drawSnowflake(x1,y1,num-1);  
}
