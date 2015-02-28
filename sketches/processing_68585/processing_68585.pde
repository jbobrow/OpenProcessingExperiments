
void bonus(){
  randomSeed(bonus);
  p1=random(width);
  q1=random(height-border);
  float d1=dist(ellipsex,ellipsey,p1,q1);
  //bonustime1=5000;
  fourth=floor(tails/4);
  noStroke();
  
 
  fill(255,0,0,nol);
  ellipse(p1,q1,seedr,seedr);
  float g=dist(ellipsex,ellipsey,p,q);
  if((tails*0.25==fourth)&&(fourth!=0)&&(g<rad)){
  bonus=millis()*1234;
  bonustime= millis()+4000;
 }

 if((tails*0.25!=fourth)&&(fourth!=0)&&(g<rad)){
  nol=0;
   rayhead=200; 
 }

if((d1<10)&&(tails*0.25==fourth)&&(tails<raylimit)){
  nol=255;
  rayhead=400;
}

if((d1<200)&&(d1>10)&&(tails<raylimit)&&(tails*0.25!=fourth)){
  nol=0;
  rayhead=200;
}

if((d1>10)&&(d1<200)&&(tails<raylimit)&&(tails*0.25==fourth)){
  nol=255;
  fill(255,0,0);
  strokeWeight(100/d1);
  stroke(255,0,0);
  line(ellipsex,ellipsey,p1,q1);
  rayhead=400;
} 
if((d1>200)&&(tails*0.25==fourth)){
  nol=255;
}
if((d1>200)&&(tails*0.25!=fourth)){
  nol=0;
}

strokeWeight(1);
if(tails>raylimit){
rayhead=200;
nol=0;
}

strokeWeight(1);
}




