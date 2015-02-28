
int a = 0;
int b = 0;
int c = 100;

int d = 100;
int e = 0;

int f = 100;
int g = 100;
int h = 100;

int i = 200;



void setup(){
  size (700,400);
  background(255);
}

void draw(){
  background(255);
  
  fill(255,3,239,100);
  rect(a,b,c,c);
  while(b > 0 && b < 300){
    b = b + 1;
  }
  
  fill(5,118,255,100);
  rect(d,e,c,c);
  while(d > 100 && d < 400){
   d = d + 1; 
  }
  
  fill(5,255,3,100);
  rect(b,c,d,d);
  
  
  fill(10,3,255,100);
  rect(f,g,h,h);
  while(h > 100 && h < 200){
    h = h + 1;}
    
   fill(170,3,255,100);
   rect(i,h,c,c);
   while (i < 200 && i > 0){
    i = i - 1; 
   }

}
void mousePressed(){
  
  if(mouseX < 100 && mouseY < 100){
   b = b + 1; 
  }
  
  if(mouseX < 200 && mouseX > 100 && mouseY < 100){
  d = d + 1;
  }  
  
  if(mouseX < 100 && mouseY < 200 &&  mouseY > 100){
   c = c - 1;
  } 
  
  if(mouseX > 100 && mouseX < 200 && mouseY > 100 && mouseY < 200){
  h = h + 1;  
  }
  
  if(mouseX > 200 && mouseX < 300 && mouseY > 100 && mouseY < 200){
  i = i - 1;  
  }
}

