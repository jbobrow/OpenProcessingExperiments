
float o, time, x, y, ball1, ball2, yh1, yh2, speedoftime, s1, s2, s3, s4, s5, s6;

float xpress,ypress;

float effectsize;
void setup(){
  size(550,500);
  strokeWeight(4);
  //stroke(100);
}
void draw(){
  background(0,150,150);
  fill(100,50,0);
  for (int j=0; j<700; j+=40)
  for (int i=0; i<550; i+=40)
  rect(i,j,40,20);
  for (int l=-20; l<700; l+=40)
  for (int k=-20; k<550; k+=40)
  //blocks
  rect(k,l,40,20);
  fill(50,0,20);
  rect(30,180,150,80);
  
  //timing recorder board
  fill(150);
  rect(20,250,50,100);
  fill(0);
  if(s1>0){
    text(s1,25,265);
  }
  if(s2>0){
    text(s2,25,280);
  }
  if(s3>0){
    text(s3,25,295);
  }
  if(s4>0){
    text(s4,25,310);
  }
  if(s5>0){
    text(s5,25,325);
  }
  if(s6>0){
    text(s6,25,340);
  }
  
  //time ellipse
  //fill(50,200,50);
  fill(50);
  //ellipse(265,115,450,150);
  rect(70,60,380,110);
  fill(200,0,0);
  textSize(100);
  text(time,50,150);
  //restart botton
  fill(200,0,50);
  if((abs(mouseX-440)<=30)&&(abs(mouseY-70)<=40)&&(mousePressed)){
    fill(250,0,70);
    restart();
  }
  ellipse(440,70,70,70);
  fill(0);
  textSize(60);
  text("R",420,90);
  if ((mousePressed)&&(abs(mouseX-267)<93)&&(abs(mouseY-200)<30)){
    fill(0,100,140);
  }else{
    fill(0,0,150);
  }
  ellipse(265,200,200,75);
  fill(0);
  textSize(60);
  if(speedoftime==0){
    text("Start",200,220);
  }else{text("Stop",200,220);
  }
  fill(255);
  line(260,230,ball1,yh1);
  line(280,230,ball2,yh2);
  ellipse(260,230,10,10);
  ellipse(280,230,10,10);
  ellipse(ball1,yh1,20,20);
  ellipse(ball2,yh2,20,20);
  ball1=x-10;
  ball2=x+10;
  yh1=y;
  yh2=y;
  if (ball1>260){
    //ellipse(100,100,100,100);
    ball1=260;
    yh1=430;
  }else if (ball2<280){
    //ellipse(100,100,100,100);
    ball2=280;
    yh2=430;
  }
  
  
  
    
  time+=speedoftime;
  o=PI/2+(sin(PI*time));
  x=200*cos(o)+270;
  y=200*sin(o)+230;
  mousehelper();
}
void mouseClicked(){
  //start
  if((abs(mouseX-267)<93)&&(abs(mouseY-200)<30)){
    if (speedoftime<=0){
    speedoftime=0.01669477234;
    }else{
    speedoftime=0;
    if(s1<=0){
      s1=time;
      }else if(s2<=0){
        s2=time;
      }else if(s3<=0){
        s3=time;
      }else if(s4<=0){
        s4=time;
      }else if(s5<=0){
        s5=time;
      }else if(s6<=0){
        s6=time;
      }
    }
    //lap
  }else if((abs(mouseX-270)<200)&&(abs(mouseY-115)<55)){
    if(s1<=0){
      s1=time;
      }else if(s2<=0){
        s2=time;
      }else if(s3<=0){
        s3=time;
      }else if(s4<=0){
        s4=time;
      }else if(s5<=0){
        s5=time;
      }else if(s6<=0){
        s6=time;
      }
  }
    
}
void keyPressed(){
  if (key=='s'){
    if (speedoftime<=0){
    speedoftime=0.01669477234;
    }else{
    speedoftime=0;
    s1=time;
    }
  }if (key=='r'){
    restart();
  }
}

void restart(){
  time=0;
  s1=0;
  s2=0;
  s3=0;
  s4=0;
  s5=0;
  s6=0;
}

void mousehelper(){
  
  noStroke();
  fill(255-effectsize,0,effectsize,255-effectsize);
  ellipse(xpress,ypress,effectsize,effectsize);
  if (effectsize<255){
    effectsize+=10;
  }
  
  fill(250,100);
  rect(mouseX-5,mouseY-10,40,20);
  stroke(0);
  fill(0);
  textSize(10);
  text(mouseX,mouseX-3,mouseY-2);
  text(mouseY,mouseX+6,mouseY+8);
  
  if (mousePressed){
   effectsize=0;
   xpress=mouseX;
   ypress=mouseY;
  }
  
}
