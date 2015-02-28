
int sizework = 150;
int sizeside = 10;

int hsizework = sizework/2;
int hsizeside = sizeside/2;

void setup() {  //setup function called initially, only once

  size(sizework, sizework);

  background(255);  //set background white
  
for (int i = 0; i < sizework; i = i+(sizeside*2)) {
for (int j = 0; j < sizework; j = j+(sizeside*2)) {
 fill(255,255,255);
 ellipse(i+hsizeside,j+hsizeside,sizeside,sizeside); //first line
 ellipse(i+hsizeside+sizeside,j+hsizeside+sizeside,sizeside,sizeside); //second line
 fill(255,0,0);
 rect((i+hsizeside*2),j,sizeside,sizeside); //first line
 rect(i,j+sizeside,sizeside,sizeside);  //second line
}
}

}


  


 
  
  

  
