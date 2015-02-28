
float a=0;

void setup(){
  size(600,600);
  background(0);
}

void draw(){
  translate(120+noise(a)*100,-100+a*30);
  
  //rocks on right bank
  fill(59,40,16,100);
  ellipse(450,0,400+noise(a)*100,400+noise(a)*200);
  ellipse(350,0,300+noise(a)*70,250+noise(a)*90);
  ellipse(300,0,300,150+sin(a)*100+noise(a)*50);
  
  //rocks on left bank
  ellipse(-100,0,400,100+cos(a)*75);
  
  //water
  fill(134,158,170,a*10);
  ellipse(120,0,a*15,noise(a)*20);
  fill(250,10);
  ellipse(120,3,a*5,noise(a)*30);
  fill(201,248,202,100);
  ellipse(120,2,10,noise(a)*20);
    
  strokeWeight(2);
  stroke(95,54,29,30);
  
  a+=0.03;
  
  if (a>30){
      a=30;
  }
}

