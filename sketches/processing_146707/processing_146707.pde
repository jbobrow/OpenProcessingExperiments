
float [] x = {0,0,0,0,0,0,0};
float [] y = {50,100,150,200,250,300,350};
float [] speed = {2,3,4,5,6,7,8};
boolean [] goingRight = {true,true,true,true,true,true,true}; 
color  green = color(0,200,0);
color  blue = color(0,0,200);
color  red = color(200,0,0);
color  yellow = color(255,255,0);
color  pink = color(255,105,180);
color  lightBlue = color(135,206,250);
color [] col = {green, green, blue,yellow,pink,lightBlue, lightBlue};

void setup(){
  size(400,400);
  smooth();
  strokeWeight(3);
  rectMode(CENTER);
}


void drawBackground(){
  background(0,200,0);
  fill(red);
  ellipse(width/2,height/2,width*2/3,width*2/3); 
  fill(blue);
  ellipse(width/2,height/2,width*1/3,width*1/3);  
}

void draw(){
  drawBackground();
  drawFigures();
  moveFigures();
}

void drawFigures(){
  for(int i=0; i<x.length; i++){
    color pixelColor=get(int(x[i]),int(y[i]));
    fill(col[i]);
    ellipse(x[i],y[i],3,3);
    if(pixelColor == red){
      ellipse(x[i],y[i],30,30);
    }    
    if(pixelColor == blue){
      rect(x[i],y[i],30,30);
    
    }
    
  }
}

void moveFigures(){
    for(int i=0; i<x.length; i++){
     if(x[i]< width && goingRight[i])
       x[i]=speed[i]+x[i];
     //can only have the variable on the left
     
     else if(x[i] >= width){
       goingRight[i] = false;
       x[i]=x[i]-speed[i];
     } 
     else if(0<x[i] && x[i] < width && !goingRight[i]){
        x[i]=x[i]-speed[i];
     }
     else if(x[i] <=0 && !goingRight[i]){
        x[i]=x[i]+speed[i];
        goingRight[i] = true;
     }
  }
}



