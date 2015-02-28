
int pos = 10;
 
void setup (){
  size (345,200);
  background (0);
  frameRate (60);
}
 void draw (){
   pos--;
  
  
   for(int i = 30; i < 60; i += 5) {
   fill (213,229,random(192));
   noStroke();
   rect(i,200,10,pos);

  for (int j = 95; j < 135; j += 5) {
  fill (176,201,random(144));
  noStroke();
  rect(j,250,10,pos);

   
  for (int l =170; l <220; l +=5) {
  fill (136,165,random(100));
  noStroke();
  rect(l,350,10,pos);
   

  for (int n =255;n<315; n +=5)  {
  fill(88,118,random(48));
  noStroke();
  rect(n,450,10,pos);
     
  }
  }
}
 }
 }

