
void setup() {
  size(200,200);
}
 
void draw() {


 
background(0);

fill(100,200,0);

noStroke();
for(int a=10; a<195; a=a+20)
for(int b=10; b<195; b=b+20)
{

ellipse(a,b,11,11,random);
}  

}
                        
