
void setup(){
  size(450,800);
  background(0);
}

void draw(){
  background(25);
  noStroke();
  for(int j=0; j<12; j++){

   for(int i=0;i<=60; i++){
              fill(i*40,i*4,0,i*4);
              if(mousePressed){
       rect(70+25*sin(frameCount*j*0.01 + .001*frameCount*i),60*i/5 +30+j, 5,5);
       
         fill(i*2,i*40,i*5,i*4);
       rect(140+25*sin(frameCount*j*0.001 + .001*frameCount*i),60*i/5 +30+j, 5,5);
       
         fill(i*50,i*4,i*4,i*4);
       rect(210+25*sin(frameCount*j*0.002 + .009*frameCount*i),60*i/5 +30+j, 5,5);
     
       
         fill(i*5,i*5,i*30,i*4);
       rect(280+25*sin(frameCount*j*.01 + .0001*frameCount*i),60*i/5 +30+j, 5,5);
     
       fill(j*20,j*100,i*5);
       rect(350+25*sin(frameCount*j*.0097 + 0.0003*frameCount*i),60*i/5 +30+j, 2,2);
       }
       else{
        ellipse(70+25*sin(frameCount*j*0.01 + .001*frameCount*i),60*i/5 +30+j, 5,5);
       
         fill(i*2,i*40,i*5,i*4);
       ellipse(140+25*sin(frameCount*j*0.001 + .001*frameCount*i),60*i/5 +30+j, 5,5);
       
         fill(i*50,i*4,i*4,i*4);
      ellipse(210+25*sin(frameCount*j*0.002 + .009*frameCount*i),60*i/5 +30+j, 5,5);
     
       
         fill(i*5,i*5,i*30,i*4);
       ellipse(280+25*sin(frameCount*j*.01 + .0001*frameCount*i),60*i/5 +30+j, 5,5);
     
       fill(j*20,j*100,i*5);
       ellipse(350+25*sin(frameCount*j*.0097 + 0.0003*frameCount*i),60*i/5 +30+j, 2,2);
       
       }
    
     
     
     
   }
  }
}

