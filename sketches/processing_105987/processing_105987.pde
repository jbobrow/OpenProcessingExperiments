
//TIME- millis(), second(), minute(), hours()
//Can you create an interesting clock?

int rectH;
float bgCol = 255;

void setup(){
  size(500,500); 
  rectH = height/3;
}

void draw(){
  background(bgCol);
  int ms = millis();
  int s = second();//values from 0-59
  int m = minute();//values from 0-59
  int h = hour();//values from 0-23
  float newS = map(s,0,59,0,width);
  float newM = map(m,0,59,0,width);
  float newH = map(h,0,23,0,width);
  
  //SECONDS
  stroke(255);
  for(int i=0;i<6;i++){
    float rectWidth= 0;
    if(s>=10*(i+1)){
      rectWidth=width;
    }else if(s>=10*i){
      rectWidth= map(s-10*i,0,10,0,width);
    }
    fill(248-15*i,170-15*i,150-15*i);//pink
    rect(0,i*rectH/6.0,rectWidth,rectH/6.0); 
  }
  
  
  
//  fill(248,170,150);//pink
//  rect(0,i*rectH/6,newS,rectH/6); 
//  
//  fill(248,170,150);//pink
//  rect(0,2*rectH/6,newS,rectH/6); 
//  
//  fill(248,170,150);//pink
//  rect(0,3*rectH/6,newS,rectH/6); 
//  
//  fill(248,170,150);//pink
//  rect(0,4*rectH/6,newS,rectH/6); 
//  
//  fill(248,170,150);//pink
//  rect(0,5*rectH/6,newS,rectH/6); 

  //Minutes
   stroke(255);
  for(int i=0;i<6;i++){
    float rectWidth= 0;
    if(m>=10*(i+1)){
      rectWidth=width;
    }else if(m>=10*i){
      rectWidth= map(m-10*i,0,10,0,width);
    }
    fill(140-15*i,207-15*i,182-15*i);//green
    rect(0,i*rectH/6.0+rectH,rectWidth,rectH/6.0); 
  }
  
  //hours
  stroke(255);
  for(int i=0;i<2;i++){
    float rectWidth= 0;
    if(h>=12*(i+1)){
      rectWidth=width;
    }else if(h>=12*i){
      rectWidth= map(h-12*i,0,12,0,width);
    }
    fill(0,79-30*i,143-30*i);//blue
    rect(0,rectH*2 + i*rectH/2.0,rectWidth,rectH/2.0);
  }
  
  
  
  
//  if(s>10 && s<=20){
//    bgCol= (0);
//  } else if (s>20 && s<=30){
//    bgCol= (100);
//  } else if (s>30){
//    bgCol= (255);
//  }
 
 
  println("MS = " + ms + "S = " + s + "M = " + m + "H = " + h);
}


