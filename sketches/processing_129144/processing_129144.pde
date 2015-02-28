
int a = 0;
float b = 255;
int c = 0;
float d = 0;

void setup (){
size(600,600);
background(255);

}

void draw (){
  while(a < 600){
    stroke(b);
    line(a,0,0,a);
    a=a+1;
    b=b-(.425);
    
}
while(c < 600){
    stroke(d);
    line(c,600,600,c);
    c=c+1;
    d=d+(.425);
    
    
}

}


