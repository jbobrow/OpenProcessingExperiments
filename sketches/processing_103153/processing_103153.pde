

int s=25;
int[][] N = new int[5][5];
int[][] X = new int[5][5];
int[][] Y = new int[5][5];
int[][] Check = new int[5][5];
int n=0;
int id=0;
int Num=0;
int Sum=0;
int change=0;
int score=0;

void setup(){
  size(400,400);
  background(255);


  for (int i=1; i<=5; i++) {
    for (int j=1; j<=5; j++) {
      smooth();
      fill(220);
      noStroke();
      X[i-1][j-1] = (i*(s*2));
      Y[i-1][j-1] = (j*(s*2));
      ellipse(X[i-1][j-1],Y[i-1][j-1],s,s);
      
      n = int(random(1,7));
      N[i-1][j-1] = n;
      textAlign(CENTER,CENTER);
      fill(0);
      text(N[i-1][j-1],X[i-1][j-1],Y[i-1][j-1]);
    }
  }
  fill(175);
  ellipse(50,350,s,s);
  ellipse(250,350,s,s);
  fill(0);
  text("+1",50,350);
  text("-1",250,350);
  
}

void draw(){
  background(255);
  fill(175);
  ellipse(50,350,s,s);
  ellipse(250,350,s,s);
  fill(0);
  text("+1",50,350);
  text("-1",250,350);
  if (mousePressed==true) {
    if(mouseX <= 50+s && mouseX >= 50-s && mouseY <= 350+s && mouseY >= 350-s){
      fill(205,205,205,100);
      ellipse(50,350,s+10,s+10);   
    }  
    if(mouseX <= 250+s && mouseX >= 250-s && mouseY <= 350+s && mouseY >= 350-s){
      fill(205,205,205,100);
      ellipse(250,350,s+10,s+10);   
    }  
    for (int i=1; i<=5; i++) {
      for (int j=1; j<=5; j++) {
        if(mouseX <= X[i-1][j-1]+s/2 && mouseX >= X[i-1][j-1]-s/2 && mouseY <= Y[i-1][j-1]+s/2 && mouseY >= Y[i-1][j-1]-s/2){
          Check[i-1][j-1]=1;
          fill(205,205,205,100);
          ellipse(X[i-1][j-1],Y[i-1][j-1],s+10,s+10);          
        }
      }
    }

  }
    
  
  
  for (int i=1; i<=5; i++) {
    for (int j=1; j<=5; j++) {  
      smooth();
      fill(205,205,205);
      noStroke();
      ellipse(X[i-1][j-1],Y[i-1][j-1],s,s);
      textAlign(CENTER,CENTER);
      fill(0);
      text(N[i-1][j-1],X[i-1][j-1],Y[i-1][j-1]);
       
    }
  }
  fill(235);
  ellipse(150,350,s,s);
  fill(0);
  text(score,150,350);

}

void mouseReleased() {
  for (int i=1; i<=5; i++) {
    for (int j=1; j<=5; j++) {
      if(Check[i-1][j-1]==1){
        Num=N[i-1][j-1];
        Sum+=N[i-1][j-1];
      }     
    }
  }
  if (Sum > 0 && (Sum/Num)==Num){
    for (int i=1; i<=5; i++) {
      for (int j=1; j<=5; j++) {
        if(Check[i-1][j-1]==1){
          for(int k=(j-1); k>(0); k--){
            N[i-1][k]=N[i-1][k-1];
          }
          N[i-1][0]=int(random(1,7));
          Check[i-1][j-1]=0;
        }
      }
    }
    score+=Num;
  }
  for (int i=1; i<=5; i++) {
    for (int j=1; j<=5; j++) {
      Check[i-1][j-1]=0;
    }
  }
      
  Sum=0;
  Num=0;
    for (int i=1; i<=5; i++) {
    for (int j=1; j<=5; j++) {
      if(mouseX <= X[i-1][j-1]+s/2 && mouseX >= X[i-1][j-1]-s/2 && mouseY <= Y[i-1][j-1]+s/2 && mouseY >= Y[i-1][j-1]-s/2){
        if(N[i-1][j-1]==1 && change==-1){
        }
        else if(N[i-1][j-1]==6 && change==1){
        }
        else {
          N[i-1][j-1]+=change;
          score-=((change*change));
          change=0;   
        }        
      }
    }
  }
  change=0;
}

void mouseDragged(){
  if(mouseX <= 50+s && mouseX >= 50-s && mouseY <= 350+s && mouseY >= 350-s){
    change=1;
  }  
  if(mouseX <= 250+s && mouseX >= 250-s && mouseY <= 350+s && mouseY >= 350-s){
    change=-1;
  }   

}




