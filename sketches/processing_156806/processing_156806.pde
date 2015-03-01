
int i=0;
int j=0;

void setup(){
  size(500,500);
  background(0);

}

void draw(){
   
  noStroke();
  fill(i,random(255),random(255));
  do{
    ellipse(250,250,50+i,50+i);
    i++;
  }while(i<10);
  if(50+i==width)
   {
    
    i=0;
   }  
   for(int i=0;i<10;i++){
     
     
}

  noStroke();
  fill(random(255),j,random(255),50);
  do{
    ellipse(250,250,50+j,50+j);
    j++;
  }while(j<15);
    if(50+i>=width)
   {
    
    fill(random(255),j,random(255),20);
   }  
 


}
