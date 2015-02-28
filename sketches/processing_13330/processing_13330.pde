
//I'm hungry...


size(200,200);

background(#87CEFA);

float a;
for(a=0; a<=500; a+=0.5)
  {
    float[] snow={a};
    
    for(int b=0; b<snow.length; b+=1)
    {
     fill(255);
     stroke(255);
     ellipse(random(snow[b]),random(snow[b]),random(10),random(10)); 
    }
  }
//  
//  int stair[] = {10,20.30.40.50.60};
//  int i, si;
//  si=7;
//  for(i=0; i<=si;i++)
//  {
//   rect(0,200,stair[i],stair[i]); 
//  }

stroke(0);
strokeWeight(1);
fill(255);
int[] q = {100,80,30,30,40};
int[] w = {25,50,70,100,10};
int[] e = {1,2,3,4,5,6,7,8,9};
int[] r = {10,20,30,40,50,60,70,80,90,100};

ellipse(w[1],q[1],q[2],q[3]);
ellipse(150,q[1],q[2],q[3]);

beginShape();
fill(#87CEFA);
vertex(50,130);
vertex(60,140);
vertex(70,150);
vertex(130,150);
vertex(140,140);
vertex(150,130);

endShape(CLOSE);

beginShape();
fill(#F0E68C);
vertex(130,130);
vertex(140,150);
vertex(150,130);
endShape(CLOSE);


fill(#87CEFA);
rect((r[1]+e[4]),w[1],w[1],w[4]);
rect(125,w[1],w[1],w[4]);

{
fill(0);
ellipse(w[1],q[1],e[8],e[8]);
ellipse(150,q[1],e[8],e[8]);
}
stroke(#1E90FF);
strokeWeight(5);
line(80,30,90,50);
line(100,30,100,50);
line(120,30,110,50);

ellipse(100,100,10,7);

  

