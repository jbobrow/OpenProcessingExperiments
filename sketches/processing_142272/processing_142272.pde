
size(800,800);
int a;
int b;
a=width/2;
b=height/2;
background(255);

strokeWeight(4);
stroke(0,0,0);
fill(35,175,14);
triangle(width*0.25,height*0.1,width*0.4,height*0.3,width*0.25,height*0.4);

strokeWeight(4);
stroke(0,0,0);
fill(35,175,14);
triangle(width*0.75,height*0.1,width*0.6,height*0.3,width*0.75,height*0.4);

strokeWeight(4);
stroke(0,0,0);
fill(35,175,14);
ellipse(a,b,a+a/2,b+b/2);
arc(a,b-b/1.6,a/1.6, b/1.7, -PI, 0);

strokeWeight(4);
stroke(0,0,0);
fill(255,255,255);
ellipse(a,b-b/4,a/1.5,b/1.5);

strokeWeight(4);
stroke(0,0,0);
fill(27,178,203);
ellipse(a,b-b/4,a/3,b/3);

strokeWeight(4);
stroke(0,0,0);
fill(0,0,0);
ellipse(a,b-b/4,a/6,b/6);

strokeWeight(4);
stroke(0,0,0);
fill(255,255,255);
ellipse(a+a/25,b-b/3.6,a/20,b/20);


strokeWeight(4);
stroke(0,0,0);
fill(35,175,14);
arc(a,b+b/6,a/1.2,b/1.2,0,PI*1);



