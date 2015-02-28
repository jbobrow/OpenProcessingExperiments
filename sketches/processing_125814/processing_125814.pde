
int z = 0;
int x;
int y;
int joe = 0;
int c = 0;
int ted=0;
void setup(){
  
 
  size(1000,1000);
}

void draw(){
  if (z%2==0){
    x = mouseX;
    y = mouseY;
    if (joe%200==0){
      background(random(500),random(500),random(500));
    }
    fill (random(500),random(500),random(500));
    ellipse(x,y,random(300),random(300));
    fill (random(500),random(500),random(500));
    ellipse(175,157,random(300),random(300));
    fill (random(500),random(500),random(500));
    ellipse(797,150,random(300),random(300));
    fill (random(500),random(500),random(500));
    ellipse(175,754,random(300),random(300));
    fill (random(500),random(500),random(500));
    ellipse(797,752,random(300),random(300));
    joe++;  
    rectangle();
    println(mouseX);
    println(mouseY);
}

  
  if (z%2!=0){
      x = mouseX;
    y = mouseY;
    background(random(500),random(500),random(500));
    fill (random(500),random(500),random(500));
    rect(x,y,random(300),random(300));
    fill (random(500),random(500),random(500));
    rect(175,157,random(300),random(300));
    fill (random(500),random(500),random(500));
    rect(797,150,random(300),random(300));
    fill (random(500),random(500),random(500));
    rect(175,754,random(300),random(300));
    fill (random(500),random(500),random(500));
    rect(797,752,random(300),random(300));
  if (c%2!=0){
    background (0);
  }
  }
}
void mouseClicked()
{
   if (mouseButton == LEFT)
   {
    
     z  =z + 1;
  
 }
   

}



 void keyPressed(){
   ted=ted+1;
 }
void rectangle(){
  if (ted%2!=0){
        for (int i = 0; i<4 ; i  = i+1){
          if(i==0){
            fill(random(500),random(500),random(500));
            rect(103,392,random(200),random(200));
          }
          if(i==1){
            fill(random(500),random(500),random(500));
            rect(409,702,random(200),random(200));
          }
          if(i==2){
            fill(random(500),random(500),random(500));
            rect(722,384,random(200),random(200));
          }
          if(i==3){
            fill(random(500),random(500),random(500));
            rect(417,101,random(200),random(200));
          }
          
  }
  }
}

