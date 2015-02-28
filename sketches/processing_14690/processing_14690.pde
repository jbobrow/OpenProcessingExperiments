

int a;
int b=100;
void setup(){
size(200,200);
background(255);
}
void draw(){
for(a=0; a<b*2; a=a+5){
line(b-a/2,b-a/2,b+a/2,b-a/2);
line(b-a/2,b*2-a/2,b+a/2,b*2-a/2);
}
}
  
                
