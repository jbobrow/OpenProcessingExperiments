

int a;
size(600,600);
a=width;

background(255,255,255);
noStroke();
fill(50,73,87,240);
ellipse(a/2,a/4,a/4,a/4);
fill(50,73,87);
ellipse(a/2,4.1*a/5.5,a/2.8,2*a/2.3);
fill(255,255,255);
rect(0,4.5*a/5,a,a);
fill(50,73,87,200);
beginShape(TRIANGLES);
vertex(a/2,9*a/10);
vertex(a/2+a/11,9*a/10);
vertex(a/2+0.5*a/11,19.5*a/20);
vertex(a/2+a/11-0.5*a/15,9*a/10);
vertex(a/2+2*a/11-0.5*a/15,9*a/10);
vertex(a/2+1.5*a/11-0.5*a/15,19.5*a/20);
vertex(a/2-a/11+0.5*a/15,9*a/10);
vertex(a/2-2*a/11+0.5*a/15,9*a/10);
vertex(a/2-1.5*a/11+0.5*a/15,19.5*a/20);
vertex(a/2,9*a/10);
vertex(a/2-a/11,9*a/10);
vertex(a/2-0.5*a/11,19.5*a/20);
vertex(a/2-0.5*a/11,9*a/10);
vertex(a/2+0.5*a/11,9*a/10);
vertex(a/2,19.5*a/20);
endShape();
fill(5,42,58); 
rectMode(CENTER);
rect(a/2,9*a/10-a/350,a/3,a/35);
fill(5,42,58,220); 
beginShape(TRIANGLES);
vertex(a/2-a/75,a/7);
vertex(a/2-a/20,a/7);
vertex(a/2-a/35,a/30);
vertex(a/2+a/75,a/7);
vertex(a/2+a/20,a/7);
vertex(a/2+a/35,a/30);
endShape();
fill(231,209,3); 
ellipse(a/2,a/2.2,a/7,a/14);
fill(5,42,58);
beginShape(TRIANGLES);
vertex(a/2,a/2.2-a/40);
vertex(a/2-a/20,a/2.2+a/50);
vertex(a/2+a/20,a/2.2+a/50);
vertex(a/2,a/2.2+a/35);
vertex(a/2-a/40,a/2.2+a/55);
vertex(a/2+a/40,a/2.2+a/55);
vertex(a/2-a/90,a/2.2-a/30);
vertex(a/2,a/2.2-a/100);
vertex(a/2-a/70,a/2.2-a/100);
vertex(a/2+a/90,a/2.2-a/30);
vertex(a/2,a/2.2-a/100);
vertex(a/2+a/70,a/2.2-a/100);
endShape();
fill(218,194,194);
arc(a/2,a/4,a/5,a/5,0, PI);



