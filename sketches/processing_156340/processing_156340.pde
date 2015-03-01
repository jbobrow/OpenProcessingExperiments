
int x=15;
int y=15;
int x1=900;
int y1=15;
int x2=985;
int y2=15;
int x3=400;
int y3=150;
int control=1;
int control2=2;

void setup(){
  size(1000, 700);
  frameRate(10000);
}

void draw(){
  background(#CEC8C8);
  stroke(#050000);
  fill(#FA1B0F);
  ellipse(x, y, 30, 30);
  
  fill(#AD2ABC);
  ellipse(x1, y1, 30, 30);
  fill(#4FBF57);
  rect( x3, y3, 200, 400);
   if(control==1){
    x+=2;
    y-=2;
  }
  if(control==2){
    x+=2;
    y+=2;
  }
  if(control==3){
    x-=2;
    y+=2;
  }
  if(control==4){
    x-=2;
    y-=2;
  }
  if(y<=10){
    if(control==1){
      control=2;
    }
    if(control==4){
      control=3;
    }
  }
  if(y>=690){
    if(control==2){
      control=1;
    }
    if(control==3){
      control=4;
    }
  }
  if(x<=10){
    if(control==4){
      control=1;
    }
    if(control==3){
      control=2;
    }
  }
  if(x>=990){
    if(control==2){
      control=3;
    }
    if(control==1){
      control=4;
    }
  }

  
  if(control2==1){
    x1+=2;
    y1-=2;
  }
  if(control2==2){
    x1+=2;
    y1+=2;
  }
  if(control2==3){
    x1-=2;
    y1+=2;
  }
  if(control2==4){
    x1-=2;
    y1-=2;
  }
  if(y1<=10){
    if(control2==1){
      control2=2;
    }
    if(control2==4){
      control2=3;
    }
  }
   if(y1>=690){
    if(control2==2){
      control2=1;
    }
    if(control2==3){
      control2=4;
    }
  }
  if(x1<=10){
    if(control2==4){
      control2=1;
    }
    if(control2==3){
      control2=2;
    }
  }
  if(x1>=990){
    if(control2==2){
      control2=3;
    }
    if(control2==1){
      control2=4;
    }
  }
  
  

  

  
  if(sqrt(((x1-x)*(x1-x))+((y1-y)*(y1-y)))>=25-4 && sqrt(((x1-x)*(x1-x))+((y1-y)*(y1-y)))<=25+4){
    if(control2==1 && control==2){
      control2=2;
      control=1;
    }
    if(control2==2 && control==1){
      control2=1;
      control=2;
    }
    if(control==1 && control2==3){
      control=3;
      control2=1;
    }
    if(control==1 && control2==2){
      control=2;
      control2=1;
    }
    if(control==1 && control2==4){
      control=4;
      control2=1;
    }
    if(control==2 && control2==3){
      control=3;
      control2=2;
    }
    if(control==3 && control2==4){
    control=4;
    control2=3;
    }
    if(control==4 && control2==3){
      control=3;
      control2=4;
    }
    if(control==2 && control2==1){
      control=1;
      control2=2;
    }
    if(control==3 && control2==4){
      control=4;
      control2=3;
    }
    if(control==2 && control2==4){
      control=4;
      control2=2;
    } 
  }
  if(y>=150 && y<=550){    
    if(x>=390 && x<=400){
      if(control==1){
        control=4;
      }
      if(control==2){
        control=3;
      }
    }
  }
  if(x>=400 && x<=600){
    if(y>=140 && y<=150){
      if(control==2){
        control=1;
      }
      if(control==3){
        control=4;
      }
    }
  }
  if(x>=600 && x<=610){
    if(y>=150 && y<=550){
      if(control==3){
        control=2;
      }
      if(control==4){
        control=1;
      }
    }
  }
  if(x>=400 && x<=600){
    if(y>=550 && y<=560){
      if(control==1){
        control=2;
      }
      if(control==4){
        control=3;
      }
    }
  }
  if(y1>=150 && y1<=550){    
    if(x1>=390 && x1<=400){
      if(control2==1){
        control2=4;
      }
      if(control2==2){
        control2=3;
      }
    }
  }
  if(x1>=400 && x1<=600){
    if(y1>=135 && y1<=150){
      if(control2==2){
        control2=1;
      }
      if(control2==3){
        control2=4;
      }
    }
  }
  if(x1>=600 && x1<=610){
    if(y1>=150 && y1<=550){
      if(control2==3){
        control2=2;
      }
      if(control2==4){
        control2=1;
      }
    }
  }
  if(x1>=400 && x1<=600){
    if(y1>=550 && y1<=565){
      if(control2==1){
        control2=2;
      }
      if(control2==4){
        control2=3;
      }
    }
  }
}
