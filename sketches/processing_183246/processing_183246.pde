
size(500,500);
background(0,12,51);

int a=width;
int b=height;
float d=3.1415;



for(int i=1;i<=a;i=i+=2){
  for(int j=1; j<=b; j=j+2){
    float r=random(420);
    float s=random(500);
    float t=random(10);
    float x=random(500);
    float z=random(255);
    float p=random(360);
        float q=random(360);

    
    pushMatrix();
    translate(250,250);
    fill(i,x%d,t,z);
    rotate(radians(p));
    noStroke();
            ellipse(s%6,i%z,s/d,x/z);
rotate(radians(q));
      fill(x%z,i%z,a%z,b);
       ellipse(r%j,j%a,(a)%j,j%4);
       fill(a,b,t,z);
       ellipse(a%q,b%t,b%t,a%q);
popMatrix();


}
}
  
  

 

