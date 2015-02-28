
size (200,200);

background( #ffcc99 );
stroke( #000000 );

//eye
strokeWeight(2);
line (50,80,150,80);
int[] a={60,50,40,30,20,10};

for (int i=0; i<a. length; i=i+1)
{
     ellipse(50,80,a[i],a[i]);
}

int[] c={60,50,40,30,20,10};

for (int i=0; i<c. length; i=i+1)
{
     ellipse(150,80,c[i],c[i]);
}


//얼굴

//hair
fill( #000000 );
stroke ( #838382 );
strokeWeight(2);

int[] b={0,15,30,45,60,75,90,105,120,135,150,165,180,195,210,};

for (int i=0; i<b. length; i=i+1)
{
     ellipse(b[i],0,80,80);
}

//mouth
stroke( #000000 );
fill(#ec1e1e);
beginShape ();
vertex (60,150);
vertex (125,150);
vertex (100,180);
endShape (CLOSE);

//
point(50,120);
point(40,125);
point(30,130);
point(20,140);
point(10,135);
point(10,120);
point(25,115);
point(35,134);
point(15,142);
point(10,132);

point(150,120);
point(140,125);
point(130,130);
point(155,140);
point(167,135);
point(154,120);
point(135,115);
point(142,134);
point(157,142);
point(162,132);

                
                
