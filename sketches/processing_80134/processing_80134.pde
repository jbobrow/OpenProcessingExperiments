
void setup(){
  size(280, 200);
  noStroke();
  
}
void draw(){
  background(255);
  
  int i = 0;
  fill(255);
  
  while (i < 290){
    ellipse (140,100,55,55);
    fill(i);
    rect(i, 0, 10, height);
    i = i + 10;
  }
  

 if(mouseX>=0&&mouseX<=10){
    fill(0,10,0);
    rect(0,0,10,200);
    
  }
    if(mouseX>=11&&mouseX<=20){
    fill(0,20,0);
    rect(10,0,10,200);
    
  }
    if(mouseX>=21&&mouseX<=30){
    fill(0,30,0);
    rect(20,0,10,200);
    
  }
    if(mouseX>=31&&mouseX<=40){
    fill(0,40,0);
    rect(30,0,10,200);
    
  }
    if(mouseX>=41&&mouseX<=50){
    fill(0,50,0);
    rect(40,0,10,200);
  }
    if(mouseX>=51&&mouseX<=60){
    fill(0,60,0);
    rect(50,0,10,200);
  }
    if(mouseX>=61&&mouseX<=70){
    fill(0,70,0);
    rect(60,0,10,200);
    
  }
    if(mouseX>=71&&mouseX<=80){
    fill(0,80,0);
    rect(70,0,10,200);
   
  }
  if(mouseX>=81&&mouseX<=90){
    fill(0,90,0);
    rect(80,0,10,200);
    
  }
    if(mouseX>=91&&mouseX<=100){
    fill(0,100,0);
    rect(90,0,10,200);
    
  }
    if(mouseX>=101&&mouseX<=110){
    fill(0,110,0);
    rect(100,0,10,200);
    
  }
    if(mouseX>=111&&mouseX<=120){
    fill(0,120,0);
    rect(110,0,10,200);
    
  }
    if(mouseX>=121&&mouseX<=130){
    fill(0,130,0);
    rect(120,0,10,200);
    
  }
    if(mouseX>=131&&mouseX<=140){
    fill(0,140,0);
    rect(130,0,10,200);
    
  }
    if(mouseX>141&&mouseX<=150){
    fill(0,150,0);
    rect(140,0,10,200);
  } 
     if(mouseX>=151&&mouseX<=160){
    fill(0,160,0);
    rect(150,0,10,200);
  }
    if(mouseX>=161&&mouseX<=170){
    fill(0,170,0);
    rect(160,0,10,200);
  }
    if(mouseX>=171&&mouseX<=180){
    fill(0,180,0);
    rect(170,0,10,200);
    
  }
    if(mouseX>=181&&mouseX<=190){
    fill(0,190,0);
    rect(180,0,10,200);
  }
  if(mouseX>=191&&mouseX<=200){
    fill(0,200,0);
    rect(190,0,10,200);
    
  }
    if(mouseX>=201&&mouseX<=210){
    fill(0,210,0);
    rect(200,0,10,200);
    
  }
    if(mouseX>=211&&mouseX<=220){
    fill(0,220,0);
    rect(210,0,10,200);
    
  }
    if(mouseX>=221&&mouseX<=230){
    fill(0,230,0);
    rect(220,0,10,200);
    
  }
    if(mouseX>=231&&mouseX<=240){
    fill(0,240,0);
    rect(230,0,10,200);
    
  }
    if(mouseX>=241&&mouseX<=250){
    fill(0,245,0);
    rect(240,0,10,200);
    
  }
    if(mouseX>251&&mouseX<=260){
    fill(0,250,0);
    rect(250,0,10,200);
}
    if(mouseX>=261&&mouseX<=270){
    fill(0,253,0);
    rect(260,0,10,200);
    
  }
    if(mouseX>=271&&mouseX<=280){
    fill(0,255,0);
    rect(270,0,10,200);
    }
    if(mousePressed){
      
    random(0,255);
    ellipse (140,100,50,50);
  }
}

