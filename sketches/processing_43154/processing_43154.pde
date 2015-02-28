
int data[]={616, 605, 657, 673, 740, 880, 868, 1039};



void setup(){
  background(0);
  size(1500,800);
  smooth();
  colorMode(HSB, 360, 100, 100);
}
  
  
void draw(){
  
  for(int i=0; i<data.length; i++){
  float ellSize=map(data[i], 100, 1500, 0, 800);
  float clr1=map(data[i], 600, 1050, 0, 360);
  //float clr2=map(data[i], 600, 1050, 0, 100);
  //float clr3=map(data[i], 600, 1050, 0, 100);
 
  ellipse(i*150+150, 400, ellSize, ellSize); 
  //fill(clr);
  
  if(dist(mouseX, mouseY, i*150+150, 400)<ellSize/2){
    fill(clr1,100,100);
  }else{
    fill(0,0,0);
  }
    
  }
  
  
}


