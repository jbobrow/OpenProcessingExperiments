
void setup(){
  size(1460,200);
  
}

void draw(){
  background(#616364);
  noStroke();
  for(int j=0; j<10; j++){

   for(int i=0;i<=60; i++){
         fill(j*30,90,0,190);
                                            //added j instead of i, can change back for wave
  ellipse(12*i/2 +j,70 + 30*sin(frameCount*j*0.01 + .001*frameCount*i), 10,10);
  fill(j*30,0,100,190);
  ellipse(720+12*i/-2 +j,70 + 30*sin(frameCount*j*0.01 + .001*frameCount*i), 10,10);
  fill(0,j*30,100,190);
  ellipse(719+12*i/2 +j,70 + 30*sin(frameCount*j*0.01 + .001*frameCount*i), 10,10);
  fill(random(256)*frameCount/30,random(256)*frameCount/30,random(256)*frameCount/30,190);
   ellipse(1440+12*i/-2 +j,70 + 30*sin(frameCount*j*0.01 + .001*frameCount*i), 10,10);
    
    fill(100000000+i*10000,i*4,0,190);
     ellipse(12*i/2 +j,140 + 30*sin(frameCount*j*0.01 + .001*frameCount*i), 10,10);
  fill(i*10,i*600,0,190);
  ellipse(716+12*i/-2 +j,140 + 30*sin(frameCount*j*0.01 + .001*frameCount*i), 10,10);
  fill(0,100000000-i*2,i*5,190);
  ellipse(710+12*i/2 +j,140 + 30*sin(frameCount*j*0.01 + .001*frameCount*i), 10,10);
  fill(60+i,i*4,i*5,190);
   ellipse(1432+12*i/-2 +j,140 + 30*sin(frameCount*j*0.01 + .001*frameCount*i), 10,10);
 }
 
  }
}


