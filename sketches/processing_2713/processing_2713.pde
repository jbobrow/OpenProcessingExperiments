
void setup(){
  size(400,300);
 
  smooth();
}
int ng=0;
int gg=35;
int e=450;
int a=20;

void draw (){
 background(154,234,7,250);
  for (int x =ng;x<=e;x+=gg){
  for (int y =ng;y<=e;y+=gg){
    
    fill(0,100);
    noStroke();
    ellipse(x,y,a,a);
   
   }
  }
  for (int m =ng;m<=e;m+=gg){
  for (int n =ng;n<=e;n+=gg){
    
    fill(34,232,237,100);
    noStroke();
    rect(m,n,a,a);
    ellipse(m,n,mouseX,mouseY);
  }
  }
}

 
  
   


