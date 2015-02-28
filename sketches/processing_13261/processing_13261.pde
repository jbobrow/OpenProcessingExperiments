
// hungry coding ~
size(200,200);

for(int c=0; c<=200; c=c+3)
{
int[] a={c};
for(int b=0; b<a. length; b=b+1)
{
stroke(#ff0000);
strokeWeight(1);
line(a[b],0,a[b],random(200));
}
} 

//머리
stroke(#000000);
fill(#000000);
ellipse(100,100,140,140);

//얼굴
int[] a={80,120,180,205};

noStroke();
fill(#C49A6C);
beginShape();
vertex(a[0],a[2]);
vertex(a[1],a[2]);
vertex(a[1],a[3]);
vertex(a[0],a[3]);
endShape();
ellipse(100,120,130,130);

//머리숱
int[] b={35,60,100,165};
fill(#000000);
beginShape();
vertex(b[0],b[1]);
vertex(b[0],b[2]);
vertex(b[3],b[2]);
vertex(b[3],b[1]);
endShape();

int[] c={40,60,70,130};
fill(#000000);
beginShape();
vertex(c[2],c[0]);
vertex(c[2],c[1]);
vertex(c[3],c[1]);
vertex(c[3],c[0]);
endShape();

//머리똥
int[] d={20,25,35,40,50,60,80,95,160,165};

ellipse(d[2],d[7],d[0],d[0]);
ellipse(d[2],d[6],d[1],d[1]);
ellipse(d[3],d[5],d[2]-5,d[2]-5);
ellipse(d[5],d[3],d[3],d[3]);
ellipse(d[7]+5,d[1]+5,d[4],d[4]);
ellipse(d[9]-25,d[3],d[3],d[3]);
ellipse(d[8],d[5],d[1]+5,d[1]+5);
ellipse(d[9],d[6],d[1],d[1]);
ellipse(d[9],d[7],d[0],d[0]);

//머리 가르마
int[] f={80,100,110,120,130,140};

fill(#C49A6C);
noStroke();
beginShape();
vertex(f[3],f[2]);
vertex(f[4],f[0]);
vertex(f[5],f[2]);
endShape();

beginShape();
vertex(f[1],f[2]);
vertex(f[2],f[0]+5);
vertex(f[3],f[2]);
endShape();

//눈
noStroke();
fill(#ff0000);
ellipse(f[0]-10,f[3],20,20);
ellipse(f[4],f[3],20,20);
fill(#000000);
ellipse(f[0]-10,f[3],2,2);
ellipse(f[4],f[3],2,2);

//코
fill(#000000);
ellipse(95,145,2,5);
ellipse(105,145,2,5);

//입
int[] g={90,110,115,160,165};
stroke(#ff0000);
strokeWeight(3);
fill(#C49A6C);
beginShape();
vertex(g[0],g[4]);
vertex(g[1],g[4]);
vertex(g[2],g[3]);
endShape();
