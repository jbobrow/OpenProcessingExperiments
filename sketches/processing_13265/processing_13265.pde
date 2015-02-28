

size(200,200);
background(90,0,150);


//background
strokeWeight(3);
fill(#211c39);
stroke(#ff0000);
int[] e={20,60,100,140,180,5};
for(int i=0; i<5; i=i+1)
{
  ellipse(e[i],50,50,50);
}
int[] h={10,20,30};
int[] j={40,50,60};
int[][] d={{10,40},{20,50},{30,60}};
for(int i=0; i<d.length; i=i+1) {
  vertex(d[i][0], d[i][1]);
}
line(20,0,20,25);
line(180,200,180,75);

//body
strokeWeight(1);
stroke(0);
fill(255);
beginShape();
vertex(90,100);
vertex(60,200);
vertex(140,200);
vertex(110,100);
endShape(CLOSE);
fill(255,0,100);
beginShape();
vertex(80,160);
vertex(80,140);
vertex(120,160);
vertex(120,140);
endShape(CLOSE);



//head
strokeWeight(1);
stroke(0);
fill(255);
ellipse(100,100,100,100);
ellipse(70,80,30,30);
ellipse(140,80,30,30);
line(110,75,110,85);

stroke(255,0,100);
for( float a=0; a<PI*2; a=a+0.01) {
  point(70+sin(a)*5, 110+cos(a*5)*5);
}
for( float a=0; a<PI*2; a=a+0.01) {
  point(140+sin(a)*5, 110+cos(a*5)*5);
}

//eye
stroke(0);
fill(0);
int x=80;
int y=80;
ellipse(x,y,10,10);
ellipse(x*2-10,y,10,10);

//lip
ellipse(x+30,y+40,13,60);


//hair
strokeWeight(1);
stroke(0);
fill(200,255,0);
int[] a={20,40,60,65};
beginShape();
vertex(80,a[2]);
vertex(95,a[3]);
vertex(95,a[2]);
vertex(115,a[3]);
vertex(115,a[2]);
vertex(125,a[3]);
vertex(125,a[2]);
vertex(121,a[1]+10);
vertex(115,a[1]+5);
vertex(110,a[1]);
vertex(105,a[1]-5);
vertex(100,a[0]);
vertex(80,a[2]);
endShape(CLOSE);


  


                
                
