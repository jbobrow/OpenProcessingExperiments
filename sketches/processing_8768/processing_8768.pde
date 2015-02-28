
int Number = 10;
float X, Y;
int Radius[] = new int[Number+1];
int Deg[] = new int[Number+1];

void setup(){
  size(500, 500);
  colorMode(HSB,359,100,100,100);
  smooth();

  frameRate(25);
  X=Y=0;

  for(int i=Number; i>0; i--){
    Radius[i] = 10 + i*40;
    Deg[i] = 0;
  }
}


void draw(){
  fadeToWhite();  
  translate(width/2, height/2);
  noStroke();

  for(int i=Number; i>0; i--){
    rotate(radians(-i*50));

    fill(224, 99 - i*10, 97,75);
    arc(0,0,Radius[i],Radius[i],
    radians(Deg[i] + i*30), radians(Deg[i] + i*30 + i*15));

    fill(359,0,359,70);
//    fill(359,0,0,100);
//    ellipse(0,0,Radius[i]*.75, Radius[i]*.75);
    ellipse(0,0,Radius[i]*.75+i*20, Radius[i]*.75+i*5);

    X = Radius[i] * cos(radians(Deg[i])); 
    Y = Radius[i] * sin(radians(Deg[i])); 



    if(Deg[i] < 360){
      Deg[i] += i;
    }
    else{
      Deg[i]=0;
    }

  }
}

void fadeToWhite(){
  noStroke();
  fill(359,0,359,30);
  //  fill(359,0,0,90);
  rect(0,0,width,height);
}  


