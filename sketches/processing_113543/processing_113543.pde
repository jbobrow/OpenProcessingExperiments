
int s=10;

size(800,800);
background(120);
stroke(0);
smooth();

for(int a=0;a<800;a+=10){
for(int b=0;b<800;b+=10){
  for(int c=0;c<100;c+=10){
    
    if(a<100||a>700){
       ellipse(a,b,s,s);    
      
    fill(c,c,0);
    }
    else {

    fill(a,a,0);
          ellipse(a,b,s,s);
    }
  

}}}




