
public float barWidth = 40;
public float time;
public color barC;

void setup(){
  size(1000,1000);
  colorMode(RGB);
}

void draw(){
  noStroke();
  time = millis()%9000;
  barC = color(0,255,0);
  if(time<5000){
    background(100);
    for(int i=0;i<ceil(width/(2*barWidth));i++){
      fill(barC);
      rect(i*2*barWidth,0,barWidth,height);
    }
    fill(color(255,0,0));
    ellipse(width/2,height/2,3,3);
  }else if(time<6000){
    background(190);
    for(int i=0;i<ceil(width/(2*barWidth));i++){
      //fill(color(200,150,200));
      fill(color(230,180,230));
      rect(i*2*barWidth+barWidth,0,barWidth,height);
    }
    fill(color(255,0,0));
    ellipse(width/2,height/2,3,3);
  }else if(time<7000){
    background(150);
    for(int i=0;i<ceil(width/(barWidth*2));i++){
      fill(100);
      rect(i*2*barWidth+barWidth/2,0,barWidth,height);
    }
    fill(color(255,0,0));
    ellipse(width/2,height/2,3,3);
  }else{
    background(color(255,100,100));
  }
}
      


