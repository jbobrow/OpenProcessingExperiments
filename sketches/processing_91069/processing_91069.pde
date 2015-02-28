
void setup(){
size (390,390);
}

void draw(){
  noFill();
  strokeWeight(3);
  
  //pattern loops
  for (int xRect1=5; xRect1<390; xRect1+=55){
    for (int yRect1=5; yRect1<390; yRect1+=55){
      
      //box
      rect(xRect1,yRect1,50,50);
      rect(xRect1 + 5,yRect1 +5,40,40);
      rect(xRect1 + 10,yRect1 + 10,30,30);
      rect(xRect1 + 15,yRect1 + 15,20,20);
      rect(xRect1 + 20,yRect1 + 20,10,10);
    }
  }
}

