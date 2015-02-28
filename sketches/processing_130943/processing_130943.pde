
 int x=0;
int y=0;
int speed=12;
int state=0;
void setup(){
  size(600,400);
  background(0);
}
void draw(){
//background(0);
  noStroke();
  rect(x,y,30,30);
  if(state==0){
    x=x+speed;
    fill(255);
    if(x>width-30){
      x=width-30;
      state=1;
      fill(random(255,245),0,0);
  
    }
  }else if(state==1){
    y=y+speed;
    if(y>height-30){
      y=height-30;
      state=2;
      fill(random(245,235),0,0);
      
    }
  }else if(state==2){
    x=x-speed;
    if(x<0){
      x=0;
      state=3;
      fill(random(235,225),0,0);
    }
  }else if(state==3){
    y=y-speed;
    if(y<30){
      y=30;
      state=4;
      fill(random(225,215),0,0);
      }
  }else if(state==4){
    x=x+speed;
 
    if(x>width-60){
      x=width-60;
      state=5;
      fill(random(215,205),0,0);
    }
  }else if(state==5){
    y=y+speed;
    if(y>height-60){
      y=height-60;
      state=6;
      fill(random(205,195),0,0);
       }
  } else if(state==6){
    x=x-speed;
    if(x<30){
      x=30;
      state=7;
      fill(random(195,185),0,0);
    }
  }else if(state==7){
    y=y-speed;
    if(y<60){
      y=60;
      state=8;
      fill(random(185,175),0,0);
    }
  }else if(state==8){
    x=x+speed;
    if(x>width-90){
      x=width-90;
      state=9;
      fill(random(175,165),0,0);
    }
  }else if(state==9){
    y=y+speed;
    if(y>height-90){
    y=height-90;
    state=10;
    fill(random(165,155),0,0);
     }
}else if (state==10){
  x=x-speed;
  if(x<60){
    x=60;
    state=11;
    fill(random(155,145),0,0);
  }
}else if(state==11){
  y=y-speed;
  if(y<90){
    y=90;
    state=12;
    fill(random(145,135),0,0);
  }
}else if(state==12){
  x=x+speed;
  if(x>width-120){
    x=width-120;
    state=13;
    fill(random(135,125),0,0);
  }
}else if(state==13){
  y=y+speed;
  if(y>height-120){
    y=height-120;
    state=14;
    fill(random(125,115),0,0);
  }
}else if(state==14){
  x=x-speed;
  if(x<90){
    x=90;
    state=15;
    fill(random(115,105),0,0);
}
}else if(state==15){
  y=y-speed;
  if(y<120){
    y=120;
    state=16;
    fill(random(105,95),0,0);
}
}else if(state==16){
  x=x+speed;
  if(x>width-150){
    x=width-150;
    state=17;
    fill(random(95,85),0,0);
  }
}else if(state==17){
  y=y+speed;
  if(y>height-150){
    y=height-150;
    state=18;
    fill(random(85,75),0,0);
  }
}else if(state==18){
  x=x-speed;
  if(x<120){
    x=120;
    state=19;
    fill(random(75,65),0,0);
  }
}else if(state==19){
  y=y-speed;
  if(y<150){
    y=150;
    state=20;
    fill(random(65,55),0,0);
  }
}else if(state==20){
  x=x+speed;
  if(x>width-180){
    x=width-180;
    state=21;
    fill(random(55,45),0,0);
  }
}else if(state==21){
  y=y+speed;
  if(y>height-180){
    y=height-180;
    state=22;
    fill(random(45,35),0,0);
  }
}else if(state==22){
  x=x-speed;
  if(x<150){
    x=150;
    state=23;
    fill(random(45,35),0,0);
  }
}else if(state==23){
  y=y-speed;
  if(y<180){
    y=180;
    state=24;
    fill(random(45,35),0,0);
  }
}else if(state==24){
  x=x+speed;
  if(x>width-210){
    x=width-210;
    state=25;
    fill(random(45,35),0,0);
  }
}else if(state==25){
  y=y+speed;
  if(y>height-210){
  y=height-210;
  state=26;
  fill(random(45,35),0,0);
  }
}else if(state==26){
  x=x-speed;
  if(x<180){
    x=180;
    state=27;
    fill(random(45,35),0,0);
  }
}else if(state==27){
  background(0);
 x=0;
 y=0;
 state=0;
}
}



