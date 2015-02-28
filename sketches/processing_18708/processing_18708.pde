

void setup(){
  size(250,250);
  background(40);

}

void draw(){
  //background(40);
  for(int i=10;i<60;i++){
    fill(240,200,70,random(150));
    rect(random(width),random(height),10,10);
  }

  if(mousePressed){
     for(int i=10;i<60;i++){
       fill(210,30,30,random(150));
    rect(random(width),random(height),10,30);
  }
}
}



