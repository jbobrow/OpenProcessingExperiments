
int a=0;
int c=325;

int r=255;
int g=0;
int b=255; 
boolean red=true; 
boolean rpos=false;
boolean bpos=false; 

boolean cpos=true; 


void setup() {
  size(500,500);
  background(0);
  smooth(); 
}

void draw() {
  fill(0,5);
  rect(0,0,500,500); 
  
  
  for(int i=0; i<4;i++){
    fill(r,g,b);
    noStroke(); 
    ellipse(a, c,50,50);
    ellipse(a, (c+100)%width,50,50);
    ellipse(a, (c+200)%width,50,50);
    ellipse(a+20, c,50,50);
    ellipse(a+20, (c+100)%width,50,50);
    ellipse(a+20, (c+200)%width,50,50);
    
    for(int j=0; j<6;j++){
    fill(g,r,b);
    ellipse((a+random(width))%width, (c+50)%width,20,20);
    ellipse((a+random(width))%width, (c+150)%width,20,20);
    }
  }
  
  if(a==500){
    cpos=false; 
    c=int(random(width)); 
  }
  if(a==0){
    cpos=true; 
    c=int(random(width)); 
  }
  
  if(cpos==true){
    a+=1; 
  } else{
    a-=1; 
  }
  
  
  
  
  if( red==true){
    if(r>=255){
      rpos=false;
    }
    if(r<=150){
      rpos=true;
    }
    if(rpos==true){
      r+=2;
      println("rincrement");
    }else {
      r-=2;
      println("rdencrement");
    }
  }else {
    if(b>=255){
      bpos=false;
    }
    if(b<=150){
      bpos=true;
    }
    if(bpos==true){
      b+=2;
      println("bincrement");
    }else {
      b-=2;
      println("bdencrement");
    }
  }
 
}
  
  
void mousePressed(){
  if (red==true){
    red=false;
    println("redoff"); 
  }
  else{
    println("redon"); 
    red=true; 
  }
}


