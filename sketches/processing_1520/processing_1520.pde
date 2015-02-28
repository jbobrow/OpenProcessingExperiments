





int counter=25;
float[]xpos=new float[counter];
float[]ypos=new float[counter];
float[]size=new float[counter];
float[]xspeed=new float[counter];
float[]gravity=new float[counter];
float[]col=new float[counter];
float []maxDistance=new float[counter];

void setup(){
  size(700,500);
  background(67,185,182);
 
smooth();
//rect array
  for(int i=0;i<counter; i++){
    xpos[i]=random(0,width);
    ypos[i]=random(0,height/5);
    xspeed[i]=random(-.50,3.50);

    size[i]=random(0.50,2.50);
    col[i]=random(255);
    maxDistance[i]=dist(0,0,width,height); //mouse distance
  }

}
void draw(){
 // background(58);
 
   


 rectDisplay();
 rectFlying();
  
  




}
  
void rectDisplay(){
  for(int i=0; i<counter; i++){
    //mouse distance interactivity 
    float mouseDist=dist(mouseX,mouseY,xpos[i],ypos[i]);
    float diameter=(mouseDist/maxDistance[i])*36.0;
    stroke(diameter,random(col[i]));
    fill(random(col[i]),diameter/random(col[i]));
    rect(xpos[i]+diameter,ypos[i]+diameter,size[i]+diameter,size[i]+diameter);
  }
}
void rectFlying(){
  for(int i=0; i<counter; i++){
    ypos[i]=ypos[i]+xspeed[i];
    if(ypos[i]>=height||ypos[i]<=0/size[i]){
      xspeed[i]*=-1;
      // xspeed[i]*=gravity[i];
    }
  }
}



