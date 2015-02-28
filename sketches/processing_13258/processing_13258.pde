
// happy coding ~
size(200,200);

 
background(200,100,180);
stroke( #000000 );
 
//eye
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
 
// happy coding ~
size(200,200);

 
background(#f6acac);
stroke( #4baece );
 
//eye
strokeWeight(4);

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
save("20083449.png");
                
                
