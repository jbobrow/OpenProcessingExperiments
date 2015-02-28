
void setup() {
size(300,300);

}
  
void draw() {
  background(#f6acac);

  for(int x=0; x<300; x=x+30){
   for(int y=0; y<300; y=y+30){
     pushMatrix();
     translate(x+x,y+y);
     scale(0.2);
     rotate(radians(5));
     kyeongrin_draw();
     popMatrix();
      
   }
  }
 }
   void kyeongrin_draw() {

  
//눈1

stroke( #000000 );
fill(#ffffff);
strokeWeight(4);
 
int[] a={50,10};
 
for (int i=0; i<a. length; i=i+1)
{
     ellipse(50,70,a[i],a[i]);
}
  
int[] c={50,10};
  
for (int i=0; i<c. length; i=i+1)
{
     ellipse(150,70,c[i],c[i]);
}
  

//눈2
strokeWeight(1);

 
int[] b={50,10,};
 
for (int i=0; i<a. length; i=i+1)
{
     ellipse(50,70,a[i],a[i]);
}
  
int[] d={50,10};
  
for (int i=0; i<c. length; i=i+1)
{
     ellipse(150,70,c[i],c[i]);
}
  
  
//얼굴
  
//hair
fill( #8e0808 );
stroke ( #ce4b4b );
strokeWeight(3);
  
int[] e={25,75,125,175};
  
for (int i=0; i<e. length; i=i+1)
{
     ellipse(e[i],0,50,50);
}
 
 
//nose
fill(#ec1e1e );
stroke ( #ce4b4b );
ellipse(100,120,20,20);
 
//mouth
stroke(#ce4b4b);
strokeWeight(5);
line(70,150,100,170);
line(100,170,130,150);

}

