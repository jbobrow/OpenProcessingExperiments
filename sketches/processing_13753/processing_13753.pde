
int R = 40;
int[] Xspeed =new int[30];
int[] Yspeed =new int[30];
int[] Bx = new int[30];
int[] By = new int[30];
 





void setup(){
  
  size(900,450);
  colorMode(HSB,100);
  background(0);
  noStroke();
  smooth();
  frameRate(50);
  
  
  for (int k=0;k<=29;k++){
  
  Bx[k] = int(random(0+40,width-40));
  By[k] = int(random(0+40,height-40));
  Xspeed[k] = int(random(-5,5));
  Yspeed[k] = int(random(-5,5));
  
  if(Xspeed[k] == 0 ){
  
    Xspeed[k] = 1;
    
  }
  if(Yspeed[k] == 0){
  
    Yspeed[k] = 1;
    
  }
  }
}
void draw(){
  fadeTowhite();
  
  for (int i=0;i<=29;i++){
  
  Bx[i] = Bx[i] + Xspeed[i];
  By[i] = By[i] + Yspeed[i];
  
  fill(0,0);
  rectMode(CENTER);
  strokeWeight(2);
  stroke(99);
  ellipse(Bx[i],By[i],R,R);
  
  
  for(int s=1;s<=3;s++){
  switch(i){
    
   case 27:
   strokeWeight(1);
           line(Bx[27],By[27],Bx[s],By[s]);   
   break;
   case 28:
   strokeWeight(1);
           line(Bx[28],By[28],Bx[s],By[s]);
   break;
   case 29:
   strokeWeight(1);
           line(Bx[29],By[29],Bx[s],By[s]);
   break;
   
   default :
   strokeWeight(1);
      line(Bx[i],By[i],Bx[i+s],By[i+s]);
   break;
  }
  }
  if(Bx[i] < R/2 || Bx[i] > width - R/2){
  
    Xspeed[i] = -Xspeed[i];
  
//    Xspeed[i] += int (random(-5,5));
  }
  if(By[i] < R/2 || By[i] > height - R/2 ){
  
    Yspeed[i] = -Yspeed[i];
  
//    Yspeed[i] += int (random(-5,5));
  }
  
  }
}
void fadeTowhite(){
  rectMode(CORNER);
  fill(0);
  rect(0,0,width,height);
}

void mouseClicked (){
  rectMode(CORNER);
  fill(0);
  rect(0,0,width,height);
  
  for(int j=0;j<=29;j++){
  
  Xspeed[j] = 1;
  Yspeed[j] = 1;
  }
}
                
