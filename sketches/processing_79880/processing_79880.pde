
float xpos=0.0;
float ypos=0.0;
float angle;
float scaler;
float X,Y;
float Cx,Cy;
float r;
float i;

void setup(){
  
  size(500,500);
  smooth();
  scaler = 5;
}

void draw(){
 
  //float back=map(mouseY,0,500,255,0);
  background(255);
  float nami=17.82;
  float nami2=1.118;
  float nami3=74.25;
  //float nami=map(mouseY,0,500,17.82,19.14);
  //float nami2=map(mouseY,0,500,1.188,1.276);
  //float nami3=map(mouseY,0,500,74.25,79.75);
  
  fadeToWhite();
  
  

  for(float Cx=0;Cx<=500;Cx=Cx+250/2){
   for(float i=0;i<=10+nami;i=i+5){//波の高さ
      Cy=height+210;
      noStroke();
      fill(185,254,255,80);
        
      angle+=0.05+nami*0.3;//波の動きの速さ
      X=Cx+(i*sin(radians(angle)));
      Y=Cy+(i*cos(radians(angle)));
      ellipse(X,Y,1000,1000);
 
}
}


 for(float Cx=0;Cx<=500;Cx=Cx+250/nami2){
   for(float i=0;i<=30+nami;i=i+8){//波の高さ
      Cy=height+220;
      noStroke();
      fill(173,224,255,70);
        
      angle+=0.05+nami*0.3;//波の動きの速さ
      X=Cx+(i*sin(radians(angle)));
      Y=Cy+(i*cos(radians(angle)));
      ellipse(X,Y,1000,1000);
 
}
}

for(float Cx=125-nami3;Cx<=500;Cx=Cx+250/nami2){
   for(float i=0;i<=50+nami;i=i+10){//波の高さ
      Cy=height+270;
      noStroke();
      fill(155,199,255,60);
        
      angle+=0.05+nami*0.3;//波の動きの速さ
      X=Cx+(i*sin(radians(angle)));
      Y=Cy+(i*cos(radians(angle)));
      ellipse(X,Y,1000,1000);
 
}
}

 }


void fadeToWhite(){
  fill(255,20);
  rectMode(CORNER);
  rect(0,0,width,height);
}



