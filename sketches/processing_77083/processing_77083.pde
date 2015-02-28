
float dist3(float a,float b,float c,float d){
 float retval = 0;

float k1 = abs(a-c);
float k2= abs(b-d);
if(k1>k2)retval=k1;
if(k2>k1)retval=k2;
if(k1==k2)retval=k1;

return retval; 
  
}

float dist2(float a,float b,float c,float d){
  float retval = abs(a-c)+abs(b-d);
 return retval; 
}

void setup(){
  
 size(255,255,P2D);
 
}

void setx(int a,int b,int c){
point(a,b);
}

void draw(){
 background(255);
for (int x=0;x<255;x++){
 for (int y = 0;y<255;y++){
  float dis3 = dist3(mouseX,mouseY,x,y);
  float dis = dist(mouseX,mouseY,x,y);
  float dis2 = dist2(mouseX,mouseY,x,y);
  dis=(dis2+dis3)/3;
  
 if(int(dis)==50)setx(x,y,1); 
 if(int(dis2)==50)setx(x,y,1);
 if(int(dis3)==50)setx(x,y,1);
 }
} 
}
