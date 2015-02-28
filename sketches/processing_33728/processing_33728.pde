
int numCircles=75;
float [] circX = new float [numCircles];
float [] circY = new float [numCircles];

float [] circXvel= new float [numCircles];
float [] circYvel= new float [numCircles];

float gravity=.95;
float a=.5;

void setup() {
  size(500,500);
  for(int i=0;i<numCircles;i++){
    circX[i]=random(0,500);
    circY[i]=random(0,500);
    circXvel[i]=4;
    circYvel[i]=1;
  }  
}

void draw() {  
  background(255);
  if((mouseX>width/2)&&(mouseY>height/2)){
    for(int i=0;i<numCircles; i++){
      fill(random(150,255),0,random(150,255),75);
      ellipse(circX[i],circY[i],20,20);
      
      circX [i] = circX [i] + circXvel[i];
      circY [i] = circY [i] + circYvel[i];
    
      circYvel [i]=circYvel[i] + gravity;
      circXvel [i]=circXvel[i] + a;
      
      if((circY[i]>height)||(circY[i]<0)){
        circYvel[i] = circYvel[i]*-.95;
      }  
      if((circX[i]>width)||(circX[i]<0)){
        circXvel[i]=circXvel[i]*-1;
      }
    }
  }
  else if((mouseX>width/2)&&(mouseY<height/2)){
      for(int i=0;i<numCircles; i++){
      fill(255,0,0,75);
      ellipse(circX[i],circY[i],20,20);
      
      circX [i] = circX [i] + circXvel[i];
      circY [i] = circY [i] + circYvel[i];
    
      circYvel [i]=circYvel[i] + gravity;
      circXvel [i]=circXvel[i] + a;
      
      if((circY[i]>height)||(circY[i]<0)){
        circYvel[i] = circYvel[i]*-.95;
      }  
      if((circX[i]>width)||(circX[i]<0)){
        circXvel[i]=circXvel[i]*-1;
      }
    }
  }
    else if((mouseX<width/2)&&(mouseY<height/2)){
      for(int i=0;i<numCircles; i++){
      fill(0,0,255,75);
      ellipse(circX[i],circY[i],10,10);
      
      circX [i] = circX [i] + circXvel[i];
      circY [i] = circY [i] + circYvel[i];
    
      circYvel [i]=circYvel[i] + gravity;
      circXvel [i]=circXvel[i] + a;
      
      if((circY[i]>height)||(circY[i]<0)){
        circYvel[i] = circYvel[i]*-.95;
      }  
      if((circX[i]>width)||(circX[i]<0)){
        circXvel[i]=circXvel[i]*-1;
      }
    }
  }
  else if((mouseX<width/2)&&(mouseY>height/2)){
      for(int i=0;i<numCircles; i++){
      fill(0,255,0,75);
      ellipse(circX[i],circY[i],40,40);
      
      circX [i] = circX [i] + circXvel[i];
      circY [i] = circY [i] + circYvel[i];
    
      circYvel [i]=circYvel[i] + gravity;
      circXvel [i]=circXvel[i] + a;
      
      if((circY[i]>height)||(circY[i]<0)){
        circYvel[i] = circYvel[i]*-.95;
      }  
      if((circX[i]>width)||(circX[i]<0)){
        circXvel[i]=circXvel[i]*-1;
      }
    }
  }
    
  
  
}


