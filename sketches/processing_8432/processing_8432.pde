
boolean light = false;
boolean faucet = false;
boolean porthole = false;
int raise=height;

float curve1a=random(-50,50);
float curve1b=random(-70,70);
float curve2a=random(-50,50);
float curve2b=random(-70,70);
float curve3a=random(-50,50);
float curve3b=random(-70,50);
float curve4a=random(-50,50);
float curve4b=random(-50,70);
float curve5a=random(-50,50);
float curve5b=random(-70,70);
float curve6a=random(-50,50);
float curve6b=random(-70,70);
float x =110;
float y=360;
float speed =0;
float gravity=0.3;

float fishX=0;
float fishY=200;
float fishSpeed=1;

float fish2X=100;
float fish2Y=300;
float fish2Speed=3;

float fish3X=0;
float fish3Y=400;
float fish3Speed=2;

void setup(){
  size(800,600);
  strokeWeight(2);
 

}


void draw (){
  //background(255);
  //fill(0,0,0,50);
  smooth();
 
  //Landscape
  background(150);
  stroke(0);
  rectMode(CORNERS);
  fill(50);
  rect(0,0,width,40);
  fill(10,70,70);
  quad(150,height-80,width-150,height-80,width,height,0,height);//floor
  fill(120);
  quad(150,height-80,120,40,0,0,0,height);//leftwall
  quad(width-150,height-80,width-120,40,width,0,width,height);//rightwall
 
 
  //fish
  fill(0,0,0,15);
  noStroke();
  ellipse(fishX,fishY,50,20);
  fishX=fishX+fishSpeed;
  if (fishX==width){
    fishX=0;
    fishY=fishY+(random(-100,100));
  }
   ellipse(fish2X,fish2Y,20,10);
  fish2X=fish2X-fish2Speed;
  if (fish2X<=0){
    fish2X=width;
    fish2Y=fish2Y+(random(-100,100));
  }
  ellipse(fish3X,fish3Y,120,30);
  fish3X=fish3X+fish3Speed;
  if (fish3X>width){
    fish3X=0;
    fish3Y=fish3Y+(random(-100,100));
  }
  //star change
    if (mouseX<width/2-70 && mouseX>170 && mouseY>240 && mouseY<310 && mousePressed){
    fill(1200,70,70);
    stroke(20,90,90);
  }else{
   fill(10,90,90);
  stroke(10,50,50);
  }
 
      //starfish
  strokeWeight(3);
  //fill(10,90,90);
  //stroke(10,50,50);
  beginShape();
  vertex(230,300);
  vertex(259,290);
  vertex(277,308);
  vertex(275,283);
  vertex(300,273);
  vertex(275,265);
  vertex(270,240);
  vertex(258,261);
  vertex(232,257);
  vertex(245,275);
  vertex(230,300);
  endShape();
 
  fill(255,255,255,10);
  noStroke();
  ellipse(random(255,265),random(270,280),15,15);
  noFill();
  stroke(100,100,100,100);
  ellipse(random(250,270),random(265,285),2,2);
  ellipse(random(250,270),random(265,285),2,2);
 
 
    //SeaWeed!!
   noFill();
   stroke(10,50,50);
   strokeWeight(5);
  
  
   float beginSeaweed =200;
   //for(float seaweed1=random(,height); seaweed1<800; seaweed1++){
   //float seaweed2 = random(300,width);
   beginShape();
   vertex(beginSeaweed,10);
   bezierVertex(beginSeaweed+curve1a, 100+curve1a, beginSeaweed+curve1a, 450, beginSeaweed+curve1b,450+curve1b);
   endShape();
  
  
   beginShape();
   vertex(240,20);
   bezierVertex(beginSeaweed+curve2a, 100+curve2a, beginSeaweed+curve2a, 450, beginSeaweed+curve2b,450+curve2b);
   endShape();
  
   beginShape();
   vertex(188,30);
   bezierVertex(beginSeaweed+curve3a, 100+curve3a, beginSeaweed+curve3a, 450, beginSeaweed+curve3b,450+curve3b);
   endShape();
  
   beginShape();
   vertex(beginSeaweed,530);
   bezierVertex(beginSeaweed+curve4a, 100+curve4a, beginSeaweed+curve4a, 50, beginSeaweed+curve4b,50+curve4b);
   endShape();
  
  
   beginShape();
   vertex(230,535);
   bezierVertex(beginSeaweed+curve5a, 100+curve5a, beginSeaweed+curve5a,50, beginSeaweed+curve5b,50+curve5b);
   endShape();
  
   beginShape();
   vertex(158,543);
   bezierVertex(beginSeaweed+curve6a, 100+curve6a, beginSeaweed+curve6a, 50, beginSeaweed+curve6b,50+curve6b);
   endShape();

  
   //end Seaweed
 
 
 
  //PORTHOLE
    stroke(0);
  strokeWeight(2);
  fill(0);
  ellipse(746,250,109,157);
  fill(120);
  ellipse(742,250,107,157);
  fill(50);
  ellipse(740,250,85,130);
 
  //porthole window shine
  fill(0);
  noStroke();
  ellipse(740,250,85,130);
  fill(255,255,255,20);
  ellipse(735,250,60,130);
  ellipse(720,220,15,20);
 
  //porthole bolts
  stroke(0);
  strokeWeight(10);
  point(740,178);
  point(772,305);
  strokeWeight(11);
  point(786,226);
  strokeWeight(8);
  point(708,302);
  point(698,220);
 
  //porthole bolts highlights
  stroke(60);
  strokeWeight(5);
  point(738,178);
  point(770,305);
  strokeWeight(6);
  point(784,226);
  strokeWeight(3);
  point(706,302);
  point(696,220);
//end porthole

//porthole Monster
if (keyPressed) {
    //porthole window
    stroke(0);
  strokeWeight(2);
  fill(0);
  ellipse(746,250,109,157);
  fill(120);
  ellipse(742,250,107,157);
 
  //porthole window background
  fill(10,20,20);
  noStroke();
  ellipse(740,250,85,130);
 
  //monster
  stroke(0);
  strokeWeight(2);
  fill(0);
  beginShape();
  vertex(703,280);
  vertex(717,260);
  bezierVertex(725,200,753,200,763,260);
  vertex(763,260);
  vertex(777,278);
  bezierVertex(760,325,725,325,703,280);
  endShape();
 
  //mouth
  noStroke();
  fill(30);
  ellipse(740,250,30,30);
  fill(0);
  ellipse(740,246,32,30);
 
  //L eye
  strokeWeight(1);
  stroke(100,0,0);
  fill(200,20,0);
  beginShape();
  vertex(725,230);
  vertex(735,237);
  bezierVertex(735,255,725,232,725,230);
  endShape();
 
  //R eye
  beginShape();
  vertex(755,230);
  vertex(745,237);
  bezierVertex(745,255,755,232,755,230);
  endShape();
 
  //porthole window shine
  noStroke();
  fill(255,255,255,20);
  ellipse(735,250,60,130);
  ellipse(720,220,15,20);
 
  //porthole bolts
  stroke(0);
  strokeWeight(10);
  point(740,178);
  point(772,305);
  strokeWeight(11);
  point(786,226);
  strokeWeight(8);
  point(708,302);
  point(698,220);
 
  //porthole bolts highlights
  stroke(60);
  strokeWeight(5);
  point(738,178);
  point(770,305);
  strokeWeight(6);
  point(784,226);
  strokeWeight(3);
  point(706,302);
  point(696,220);
}//end MOnster

 
 
 
   //faucet
  fill(200);
  stroke(0);
  //ellipse(60,2*(height/3),20,40);
  ellipse(60,2*(height/3),15,30);
  ellipse(60,2*(height/3),8,20);
  ellipse(112,2*(height/3)-30,25,10);
  beginShape();
  vertex(60,2*(height/3)+10);
  vertex(85,2*(height/3)+10);
  vertex(86,2*(height/3)+20);
  vertex(88,2*(height/3)+22);
  //middle of faucet handle
  vertex(96,2*(height/3)+22);
  vertex(98,2*(height/3)+20);
  vertex(99,2*(height/3)+10);
  vertex(119,2*(height/3)+10);
  vertex(121,2*(height/3)+8);
  vertex(121,2*(height/3)-10);
  vertex(121,2*(height/3)-30);
  vertex(103,2*(height/3)-30);
  vertex(103,2*(height/3)-10);
  vertex(60,2*(height/3)-10);
  endShape();
 
  //faucet shading
  strokeWeight(6);
  stroke(150);
  line(61,405,117,405);
  strokeWeight(3);
  line(106,373,118,373);
 
  strokeWeight(2);
  stroke(0);
 
  //faucet button
  if(mouseX>50 && mouseX<122 && mouseY>320 && mouseY<450 && mousePressed) {
    faucet=!faucet;
  }

  if (faucet) {
     float faucetHandle=440;
     strokeWeight(4);
    line(92, 422, 92,faucetHandle);
    strokeWeight(2);
    ellipse(92,faucetHandle,13,8);
   
      //dripping water
  y =y-speed;
  x=x*1.006;
  speed = speed + gravity;
 
  if (y<10) {
    speed = speed * -0.95;
  }
  stroke (10,50,50);
  fill(0,0,100,170);
  ellipse (x,y,4,6);
  if (x>width){
    x=110;
    y=360;
    speed =0;
    gravity=0.3;
  }//end dripping water
   
  }if (!faucet) {
     float faucetHandle=430;
     strokeWeight(4);
    line(92, 422, 92,faucetHandle);
    strokeWeight(2);
    ellipse(92,faucetHandle,13,8);
  }
 
  //Light Buttons
  noStroke();
 
  if (mouseX > width/2-50 && mouseX < width/2+50 && mouseY>0 && mouseY<70 && mousePressed) {
    light=(!light);
  }

  //dark w/flickering light
  if (!light) {
    
    //float flicker=random(0,200);
    fill(0,0,0,240);
    rectMode(CENTER);
    rect(width/2,height/2,width,height);
   
    fill(random(0,200));
    ellipse(width/2, 56, 20,20);
   
   
    strokeWeight(2);
   
    //bulb shade
   
    fill(0);
  stroke(0);
  beginShape();
  vertex(width/2+60,55);
  vertex(width/2-35,55);
  vertex(width/2,0);
  endShape();

   
   
  }
   if(light){
    
  //turning lightbulb and covering shade
 
  if (mouseX<=width/2) {
    //Light/Shade area
    fill(0,0,0,230);
  beginShape();
  vertex(width/2,0);
  vertex(width/2,35);
  vertex(width/2+25+10,80+mouseX/-15);
  vertex(mouseX+150,mouseY);
  bezierVertex(mouseX+120,mouseY+150,mouseX-120,mouseY+150,mouseX-150,mouseY);
  vertex(mouseX-150,mouseY);
  vertex(width/2-mouseX/15-10,30+mouseX/15);
  vertex(width/2,35);
  vertex(width/2,0);
  vertex(0,0);
  vertex(0,height);
  vertex(width, height);
  vertex(width,0);
  vertex(width/2,0);
  endShape();
 
  fill(255);
  stroke(random(200,255));
  strokeWeight(3);
  ellipse(width/2, 56, 20,20);
  strokeWeight(2);
 
  fill(10,20,20);
  stroke(30);
  beginShape();
  vertex(width/2+25+10,80+mouseX/-15);
  vertex(width/2-mouseX/15-10,30+mouseX/15);
  vertex(width/2,0);
  endShape();
   
  }else {
      //Light/Shade area
  fill(0,0,0,230);
  beginShape();
  vertex(width/2,0);
  vertex(width/2,35);
  vertex(width/2+60-mouseX/15,80+mouseX/-15);
  vertex(mouseX+150,mouseY);
  bezierVertex(mouseX+120,mouseY+150,mouseX-120,mouseY+150,mouseX-150,mouseY);
  vertex(mouseX-150,mouseY);
  vertex(width/2-35,30+mouseX/15);
  vertex(width/2,35);
  vertex(width/2,0);
  vertex(0,0);
  vertex(0,height);
  vertex(width, height);
  vertex(width,0);
  vertex(width/2,0);
  endShape();
 
  fill(255);
  stroke(random(200,255));
  strokeWeight(3);
  ellipse(width/2, 56, 20,20);
  strokeWeight(2);

  fill(10,20,20);
  stroke(35);
  beginShape();
  vertex(width/2+60-mouseX/15,80+mouseX/-15);
  vertex(width/2-35,30+mouseX/15);
  vertex(width/2,0);
  endShape();   
   
  }
 
    //air bubbles
  strokeWeight(1);
  stroke(50);
  fill(255,255,255,random(10,50));
  ellipse(570,random(0,height),5,5);
  ellipse(580,random(0,height),10,10);
  ellipse(590,random(0,height),5,5);
  ellipse(600,random(0,height),10,10);
  ellipse(610,random(0,height),5,5);
  strokeWeight(2);
 
}
}

