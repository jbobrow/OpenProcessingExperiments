
int gridNum =15;
int dotsNum_X = gridNum; 
int dotsNum_Y = gridNum; 
int counter = 0;
Dot dots[][] = new Dot[dotsNum_X][dotsNum_Y];
void setup(){
  rectMode(CORNERS);
  size(400,400);
  colorMode(HSB);
  background(50);
  //dots[][] = new Dot[dotsNum_X][dotsNum_Y];
  //for(int i=0;i<dotsNum_X;i++){
    //for(int j=0;j<dotsNum_Y;j++){
   for(int i=0;i<dotsNum_X;i++){
     for(int j=0;j<dotsNum_Y;j++){
         
         dots[i][j] = new Dot();
         dots[i][j].setup(i, j);//xNo,yNo
     }
   }
      
    //}
  //}
  
}
 float pointingX = 0;
 float pointingY = 0;

void draw(){
  translate(50,50);
  background(100);
  stroke(255,0,0);
  pointingX = cos(radians(counter))*100;
  pointingY = sin(radians(counter))*130;
  //pointingX = mouseX;
  //pointingY = mouseY;
  
  for(int i=0;i<dotsNum_X;i++){
    for(int j=0;j<dotsNum_Y;j++){
      
      //dots[i][j].setHomePos(20*i,20*j);
      dots[i][j].setPos();
      dots[i][j].getDistance(pointingX+ pointingY+100,pointingY+ pointingX+100);
      dots[i][j].setSize();
      //dots[i][j].draw();
      if(i>0){
        line(dots[i][j].xpos, dots[i][j].ypos, dots[i-1][j].xpos, dots[i-1][j].ypos);        
      }
      if(j>0){
        line(dots[i][j].xpos, dots[i][j].ypos, dots[i][j-1].xpos, dots[i][j-1].ypos);        
      }
    }
  }
  if(counter>360){
    counter-=360;
  }else{
  counter++;
  }
  
}



class Dot{
  float xHomepos,yHomepos = 0;
  float xpos,ypos = 0;
  int xNo,yNo = 0;
  float d_HomeSize,d_size = 5;
  float d_distance = 0;
  float kankaku = 20;
  
  void Dot(){
    

    xpos = 0;
    ypos = 0;
    d_size = 5;
    d_distance = 0;
  }
  void setup(int i, int j){
    xHomepos = i*kankaku;
    yHomepos = j*kankaku;
    xNo = i;
    yNo = j;
  }
  
  void getDistance(float pX,float pY){
    
    d_distance = dist(xHomepos,yHomepos,pX, pY);
  }
  void setPos(){
    float limitDistance =100;
    float movelimit = 20;
    if (d_distance < limitDistance){
      if(xHomepos<pointingX)
        xpos = xHomepos- (1-d_distance/limitDistance)*movelimit;
      else if(xHomepos>pointingX)
        xpos = xHomepos+ (1-d_distance/limitDistance)*movelimit;
        
      if(yHomepos<pointingY)
        ypos = yHomepos- (1-d_distance/limitDistance)*movelimit;
      else if(yHomepos>pointingY)
        ypos = yHomepos+ (1-d_distance/limitDistance)*movelimit;
      /*if(xHomepos<mouseX)
        xpos = xHomepos+(10 * d_distance/100);
      else if(xHomepos>=mouseX)
        xpos = xHomepos-(10 * d_distance/100);
        
      if(yHomepos<mouseY)
        ypos = yHomepos+(10 * d_distance/100);
      else if(yHomepos>=mouseY)
        ypos = yHomepos-(10 * d_distance/100);
        */
      
    }else{
      xpos = xHomepos;
      ypos = yHomepos;
    }
    /*xpos = 20*xNo;
    ypos = 20*yNo;
    
    xpos = xHomepos;
    */
  }
  
  void setSize(){
    
  /*if (100>d_distance){
    d_size = 15 * d_distance/100;
  }else{
    d_size = 15;
  }*/
  d_size = 3;
  }
  
  void draw(){
    

    rect(xpos, ypos, d_size, d_size);
  }
}

                
