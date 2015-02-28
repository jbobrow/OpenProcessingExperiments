
int x=20;
int y=40;
int speed=5;
int state=0;
int a=60;
int b=40;

void setup(){
  size(500,300);
}
void draw(){
  //background(0);
  fill(245,150,35);
  noStroke();
  rect(x,y,40,40);
  if(state==0){
    x=x+speed;
    if(x>200){
      x=200;
      state=1;
  }
  }else if(state==1){
    y=y+speed;
    if(y>height/2){
      y=height/2;
      state=2;
    }
  }else if(state==2){
    x=x+speed;
    if(x>360){
      x=360;
      state=3;
    }
  }else if(state==3){
  y=y-speed;
  if(y<100){
    y=100;
    state=4;
  }
  }else if(state==4){
    x=x+speed;
    if(x>420){
      x=420;
      state=5;
    }
  }else if(state==5){
    y=y+speed;
    if(y>240){
      y=240;
      state=6;
    }
  }else if(state==6){
    x=x-speed;
    if(x<60){
      x=60;
      state=7;
    }
  }else if(state==7){
    y=y-speed;
    if(y<120){
      y=120;
      state=8;
    }
  }else if(state==8){
    x=x+speed;
    if(x>200){
      x=200;
      state=9;
    }
  }else if(state==9){
    y=y-speed;
    if(y<40){
      y=40;
      state=10;
    }
  }else if(state==10){
    x=x+speed;
    if(x>300){
      x=300;
      state=11;
    }
  }else if(state==11){
    y=y+speed;
    if(y>220){
      y=220;
      state=12;
    }
  }else if(state==12){
    x=x-speed;
    if(x<100){
      x=100;
      state=13;
    }
  }else if(state==13){
    y=y-speed;
    if(y<120){
      y=120;
      state=14;
    }
  }else if(state==14){
    x=x+speed;
    if(x>400){
      x=400;
      state=15;
    }
  }else if(state==15){
    y=y-speed;
    if(y<20){
      y=20;
      state=16;
    }
  }else if(state==16){
    x=x-speed;
    if(x<260){
      x=260;
      state=17;
    }
  }else if(state==17){
    y=y+speed;
    if(y>120){
      y=120;
      state=18;
    }
  }else if(state==18){
    x=20;
    y=40;
    state=0;
  }

//LEFT EYE//
strokeWeight(2);
stroke(255);
fill(0);
ellipse(x,y,15,15);
//RIGHT EYE//
ellipse(a,b,15,15);
  if(state==0){
    a=a+speed;
    if(a>200){
      a=200;
      state=1;
  }
  }else if(state==1){
    b=b+speed;
    if(b>height/2){
      b=height/2;
      state=2;
    }
  }else if(state==2){
    a=a+speed;
    if(a>360){
      a=360;
      state=3;
    }
  }else if(state==3){
  b=b-speed;
  if(b<100){
    b=100;
    state=4;
}
  }else if(state==4){
    a=a+speed;
    if(a>420){
      a=420;
      state=5;
}
  }else if(state==5){
    b=b+speed;
    if(b>240){
      b=240;
      state=6;
}
  }else if(state==6){
    a=a-speed;
    if(a<60){
      a=60;
      state=7;
}
  }else if(state==7){
    b=b-speed;
    if(b<120){
      b=120;
      state=8;
    }
  }else if(state==8){
    a=a+speed;
    if(a>200){
      a=200;
      state=9;
    }
  }else if(state==9){
    b=b-speed;
    if(b<40){
      b=40;
      state=10;
}
  }else if(state==10){
    a=a+speed;
    if(a>300){
      a=300;
      state=11;
}
  }else if(state==11){
    b=b+speed;
    if(b>220){
      b=220;
      state=12;
}
  }else if(state==12){
    a=a-speed;
    if(a<100){
      a=100;
      state=13;
    }
  }else if(state==13){
    b=b-speed;
    if(b<120){
      b=120;
      state=14;
}
  }else if(state==14){
    a=a+speed;
    if(a>400){
      a=400;
      state=15;
}
  }else if(state==15){
    b=b-speed;
    if(b<20){
      b=20;
      state=16;
}
  }else if(state==16){
    a=a-speed;
    if(a<260){
      a=260;
      state=17;
}
  }else if(state==17){
    b=b+speed;
    if(b>120){
      b=120;
      state=18;
}
  }else if(state==18){
    a=60;
    b=40;
    state=1;
}
}



