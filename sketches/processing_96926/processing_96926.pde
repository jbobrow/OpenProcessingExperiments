
int sizeK =1;
int sizeP =1;
void setup(){
  background(225);
  size(800,600);
  frameRate(60);
}
void draw(){
  if(mousePressed){
    stroke(0,0,0);
    sizeP = sizeK;
    if (sizeK<10){
      sizeK +=2;
    }
    else{
      sizeK +=1;
    }  
    sizeK = constrain(sizeK,5,20);  
    
    int v =int(dist(mouseX,mouseY,pmouseX,pmouseY)/15);//15,min distance
    v = constrain(v,0,10);

    sizeK -=2*v; //speed faster size smaller
    //
    sizeK = constrain(sizeK,5,20);
    
    int steps = abs(sizeK-sizeP);//decade smooth
    if(steps>0){
        for(int i=0;i<=steps;i++){
          strokeWeight((sizeP+i*(sizeK-sizeP)/steps)*2);
          line(pmouseX,pmouseY,pmouseX+i*(mouseX-pmouseX)/steps,pmouseY+i*(mouseY-pmouseY)/steps);
          fill(0,0,255);
        }
    }
    else{
      strokeWeight(sizeK*2);
      line(pmouseX,pmouseY,mouseX,mouseY);
    }

  }
  else{
    sizeK =int(random(5));
    sizeP = sizeK;
  }

}

void keyPressed(){
  if(key==' '){
    background(225);
  }
}


