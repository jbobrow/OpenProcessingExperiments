
//by Aleksandra Sacha Lopatic : January 29, 2009 : Built in Processing : Move mouse over to see- red lights through the city darkness
int counter=300;
float[]xpos=new float[counter];
float[]ypos=new float[counter];
float[]size=new float[counter];
float[]xspeed=new float[counter];
float[]gravity=new float[counter];
float[]col=new float[counter];
float []maxDistance=new float[counter];
void setup(){
  size(900,550);
  background(67,185,182);
  smooth();
  noStroke();
  //  frameRate(20);
  for(int i=0;i<counter; i++){
    xpos[i]=random(0,width);
    ypos[i]=random(50,height);
    xspeed[i]=random(-.50,3.50);

    size[i]=random(0.10,1.50);
    col[i]=random(255);
    maxDistance[i]=dist(0,0,width,height); //mouse distance
  }
}
void draw(){
  // background();
  rectDisplay();
  rectFlying();
}
void rectDisplay(){
  for(int i=0; i<counter; i++){
    //mouse distance interactivity 
    float mouseDist=dist(mouseX,mouseY,xpos[i],ypos[i]);
    float diameter=(mouseDist/maxDistance[i])*36.0;
    fill(random(col[i])/diameter,diameter/random(col[i]),diameter);
    rect(xpos[i]+diameter,ypos[i]+diameter,size[i]+diameter,size[i]+diameter);
  }
}
void rectFlying(){
  for(int i=0; i<counter; i++){
    ypos[i]=ypos[i]+xspeed[i];
    if(ypos[i]>=height||ypos[i]<=30/size[i]){
      xspeed[i]*=-1;
      // xspeed[i]*=gravity[i];
    }
  }
}


