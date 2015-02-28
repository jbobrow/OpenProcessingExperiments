
void setup(){
size(400,400,P3D);

}
void draw(){
  background(100);
  float mod=width/12.0;
  for(int i=0;i<18;i++){
  for(int j=0;j<18;j++){
   float tam=map(mouseX,0,400,0,20);
    float tam2=map(mouseX,0,400,50,0);
   float tama=dist(tam,tam2,mouseX,mouseY);
   
    rectMode(CENTER);
    pushMatrix();
    translate((i*mod)+mod/2,(j*mod)+mod/2,tama);
    rotate(frameRate*50);
    if((j+i)%2==0){
    fill(0);
      ellipse(0,0,tam,tam);
    fill(100);
    
    }else{
      fill(255);
    rect(0,0,tam2,tam2);
 
    
    }
    popMatrix();
  }


  }
}

