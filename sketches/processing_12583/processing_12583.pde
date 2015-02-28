
void setup(){
 size (1000,1000);
 smooth();
 background(255,255,255);
 

//gradient
  colorMode(HSB, 1200);
  for(int i=0; i<height; i++){
    stroke(width*0.6, i, height);
    line(i,0,i,height);
  }
  
   fill(100,2000,2000,160);
  for(int x = 0; x<1200; x+=200) {
    for(int y= 0; y<1200; y+=200){
      ellipse(x,y,200,200);}}
  
 strokeWeight(5);
 stroke(100,80,150);
 noFill();
 strokeJoin(ROUND);
 

 //BIRD Green
 fill(500,3000,1000);
 //1
 int a=250;
 int b=450;
 int c=a+120; 
 int d=b-180;
 int e=c+20;
 int f=d-50;
 int g=e-100;
 int h=f-15;
 int i=g-20;
 int j=h+80;
   int k= i-100;
  int l= j+230;
  int m= k+150;
  int n= l+50;
 
 beginShape();
 vertex(a,b);//first anchor pt
 //stomach
 bezierVertex(a+150, b-20, a+125,b-75,a+120, b-180);//c1,c2,v2
 //neck
 vertex(c,d);//first anchor pt
 bezierVertex(c-5,d-30,c,d-40,c+20,d-50);//c1,c2,v2
 //head
 vertex(e,f);//first anchor pt
 bezierVertex(e+100,f-80,e-130,d-130,e-100,f-15);//c1,c2,v2
//back of neck
 vertex(g,h);//first anchor pt
 bezierVertex(g+10,h+20,g+10,h+40,g-20,h+80);//c1,c2,v2
//back
 vertex(i,j);//first anchor pt
 bezierVertex(i-50,j+50,i-100,j+50,i-100,j+230);//c1,c2,v2

 //lower body

 vertex(a,b);//first anchor pt
 bezierVertex(a-45,b+20,a-5,b-10,i-100,j+230);//c1,c2,v2
endShape(); 

  //7
//tail curve 1
fill(500,3000,1000);
beginShape();
 vertex(k,l);//first anchor pt
 bezierVertex(k+50,l-40,k+70,l+20,k+150,l+50);//c1,c2,v2
 //tail curve 2
 vertex(m,n);//first anchor pt
 bezierVertex(m-60,n+10,m-70,n-20,m-100,n+80);//c1,c2,v2
 //tail curve 3
  int o= m-100;
  int p= n+80;
  line(m-100,n+80,k,l);
 endShape();
 
//wing

 beginShape();
 /*vertex(i,j);//first anchor pt
 bezierVertex(i-50,j-30, i-80,j-40,i-130,j-200);//c1,c2,v2*/
 //wing 2
 vertex(i,j);//first anchor pt
 bezierVertex(i-50,j-30, i-80,j-40,i-130,j-200);//c1,c2,v2
 int q=i-130;
 int r=j-200;
 vertex(q,r);//first anchor pt
 bezierVertex(q-110,r+150,g-140,r+220,q+40,r+250);//c1,c2,v2
 
 line(q+40,r+250,q+100,r+225);
 endShape();
 
 //beak
 strokeJoin(ROUND);
 strokeWeight(6);
 line(e+25,f-35,e+180,f-50);
 
 //leg
 noFill();
 beginShape();
 vertex(a,b);//first anchor pt
 bezierVertex(a-10,b+30,a+50,b-10,a+50,b+10);//c1,c2,v2
 endShape();
 
 //claw
beginShape();
 vertex(a+40,b+10);//first anchor pt
 bezierVertex(a+40,b,a+60,b,a+40,b+20);//c1,c2,v2
 endShape();
 
//eye
 strokeWeight(11);
 point(e-35,f-35);
 
 //feathers on head
 stroke(6); 
noFill();
  stroke(500,3000,1000);
 beginShape();
 vertex(g+10,h-20);//first anchor pt
 bezierVertex(g-20,h-30,g-30,h-40,g-20,h-20);//c1,c2,v2
endShape();
 
 beginShape();
 stroke(1200);
 vertex(g+15,h-25);//first anchor pt
 bezierVertex(g-25,h-35,g-35,h-45,g-25,h-35);//c1,c2,v2
endShape();

beginShape();
stroke(200,2530,2900);
 vertex(g+20,h-30);//first anchor pt
 bezierVertex(g-35,h-45,g-45,h-55,g-35,h-45);//c1,c2,v2
 endShape();
 
 
 //BIRD TWO Yellow
 scale(.5);
 beginShape();
 vertex(a,b);//first anchor pt
 //stomach
 bezierVertex(a+150, b-20, a+125,b-75,a+120, b-180);//c1,c2,v2
 //neck
 vertex(c,d);//first anchor pt
 bezierVertex(c-5,d-30,c,d-40,c+20,d-50);//c1,c2,v2
 //head
 vertex(e,f);//first anchor pt
 bezierVertex(e+100,f-80,e-130,d-130,e-100,f-15);//c1,c2,v2
//back of neck
 vertex(g,h);//first anchor pt
 bezierVertex(g+10,h+20,g+10,h+40,g-20,h+80);//c1,c2,v2
//back
 vertex(i,j);//first anchor pt
 bezierVertex(i-50,j+50,i-100,j+50,i-100,j+230);//c1,c2,v2

 //lower body

 vertex(a,b);//first anchor pt
 bezierVertex(a-45,b+20,a-5,b-10,i-100,j+230);//c1,c2,v2
endShape(); 

  //7
//tail curve 1

beginShape();
 vertex(k,l);//first anchor pt
 bezierVertex(k+50,l-40,k+70,l+20,k+150,l+50);//c1,c2,v2
 //tail curve 2
 vertex(m,n);//first anchor pt
 bezierVertex(m-60,n+10,m-70,n-20,m-100,n+80);//c1,c2,v2
 //tail curve 3
  line(m-100,n+80,k,l);
 endShape();
 
//wing

 beginShape();
 /*vertex(i,j);//first anchor pt
 bezierVertex(i-50,j-30, i-80,j-40,i-130,j-200);//c1,c2,v2*/
 //wing 2
 vertex(i,j);//first anchor pt
 bezierVertex(i-50,j-30, i-80,j-40,i-130,j-200);//c1,c2,v2
 vertex(q,r);//first anchor pt
 bezierVertex(q-110,r+150,g-140,r+220,q+40,r+250);//c1,c2,v2
 
 line(q+40,r+250,q+100,r+225);
 endShape();
 
 //beak
 strokeJoin(ROUND);
 strokeWeight(6);
 line(e+25,f-35,e+180,f-50);
 
 //leg
 noFill();
 beginShape();
 vertex(a,b);//first anchor pt
 bezierVertex(a-10,b+30,a+50,b-10,a+50,b+10);//c1,c2,v2
 endShape();
 
 //claw
beginShape();
 vertex(a+40,b+10);//first anchor pt
 bezierVertex(a+40,b,a+60,b,a+40,b+20);//c1,c2,v2
 endShape();
 
//eye
 strokeWeight(11);
 point(e-35,f-35);
 
 //feathers on head
 stroke(6); 
noFill();
  stroke(500,3000,1000);
 beginShape();
 vertex(g+10,h-20);//first anchor pt
 bezierVertex(g-20,h-30,g-30,h-40,g-20,h-20);//c1,c2,v2
endShape();
 
 beginShape();
 stroke(1200);
 vertex(g+15,h-25);//first anchor pt
 bezierVertex(g-25,h-35,g-35,h-45,g-25,h-35);//c1,c2,v2
endShape();

beginShape();
stroke(200,2530,2900);
 vertex(g+20,h-30);//first anchor pt
 bezierVertex(g-35,h-45,g-45,h-55,g-35,h-45);//c1,c2,v2
 endShape();
 
  //BIRD THREE White
  fill(1200);
  stroke(1200);
  strokeWeight(6);
 scale(1.9);
 translate(550,100);
 beginShape();
 vertex(a,b);//first anchor pt
 //stomach
 bezierVertex(a+150, b-20, a+125,b-75,a+120, b-180);//c1,c2,v2
 //neck
 vertex(c,d);//first anchor pt
 bezierVertex(c-5,d-30,c,d-40,c+20,d-50);//c1,c2,v2
 //head
 vertex(e,f);//first anchor pt
 bezierVertex(e+100,f-80,e-130,d-130,e-100,f-15);//c1,c2,v2
//back of neck
 vertex(g,h);//first anchor pt
 bezierVertex(g+10,h+20,g+10,h+40,g-20,h+80);//c1,c2,v2
//back
 vertex(i,j);//first anchor pt
 bezierVertex(i-50,j+50,i-100,j+50,i-100,j+230);//c1,c2,v2

 //lower body

 vertex(a,b);//first anchor pt
 bezierVertex(a-45,b+20,a-5,b-10,i-100,j+230);//c1,c2,v2
endShape(); 

  //7
//tail curve 1
beginShape();
 vertex(k,l);//first anchor pt
 bezierVertex(k+50,l-40,k+70,l+20,k+150,l+50);//c1,c2,v2
 //tail curve 2
 vertex(m,n);//first anchor pt
 bezierVertex(m-60,n+10,m-70,n-20,m-100,n+80);//c1,c2,v2
 //tail curve 3
  line(m-100,n+80,k,l);
 endShape();
 
//wing

 beginShape();
 /*vertex(i,j);//first anchor pt
 bezierVertex(i-50,j-30, i-80,j-40,i-130,j-200);//c1,c2,v2*/
 //wing 2
 vertex(i,j);//first anchor pt
 bezierVertex(i-50,j-30, i-80,j-40,i-130,j-200);//c1,c2,v2
 vertex(q,r);//first anchor pt
 bezierVertex(q-110,r+150,g-140,r+220,q+40,r+250);//c1,c2,v2
 
 line(q+40,r+250,q+100,r+225);
 endShape();
 
 //beak
 strokeJoin(ROUND);
 strokeWeight(6);
 line(e+25,f-35,e+180,f-50);
 
 //leg
 noFill();
 beginShape();
 vertex(a,b);//first anchor pt
 bezierVertex(a-10,b+30,a+50,b-10,a+50,b+10);//c1,c2,v2
 endShape();
 
 //claw
beginShape();
 vertex(a+40,b+10);//first anchor pt
 bezierVertex(a+40,b,a+60,b,a+40,b+20);//c1,c2,v2
 endShape();
 
//eye
stroke(0);
 strokeWeight(11);
 point(e-35,f-35);
 
 //feathers on head
 stroke(6); 
noFill();
  stroke(200,2530,2900);
 beginShape();
 vertex(g+10,h-20);//first anchor pt
 bezierVertex(g-20,h-30,g-30,h-40,g-20,h-20);//c1,c2,v2
endShape();
 
 beginShape();
 stroke(1200);
 vertex(g+15,h-25);//first anchor pt
 bezierVertex(g-25,h-35,g-35,h-45,g-25,h-35);//c1,c2,v2
endShape();

beginShape();
stroke(500,3000,1000);
 vertex(g+20,h-30);//first anchor pt
 bezierVertex(g-35,h-45,g-45,h-55,g-35,h-45);//c1,c2,v2
 endShape();
 
 //BIRD FOUR Black
  stroke(0);
  strokeWeight(3);
 scale(.8);
 translate(-200,200);
 beginShape();
 vertex(a,b);//first anchor pt
 //stomach
 bezierVertex(a+150, b-20, a+125,b-75,a+120, b-180);//c1,c2,v2
 //neck
 vertex(c,d);//first anchor pt
 bezierVertex(c-5,d-30,c,d-40,c+20,d-50);//c1,c2,v2
 //head
 vertex(e,f);//first anchor pt
 bezierVertex(e+100,f-80,e-130,d-130,e-100,f-15);//c1,c2,v2
//back of neck
 vertex(g,h);//first anchor pt
 bezierVertex(g+10,h+20,g+10,h+40,g-20,h+80);//c1,c2,v2
//back
 vertex(i,j);//first anchor pt
 bezierVertex(i-50,j+50,i-100,j+50,i-100,j+230);//c1,c2,v2

 //lower body

 vertex(a,b);//first anchor pt
 bezierVertex(a-45,b+20,a-5,b-10,i-100,j+230);//c1,c2,v2
endShape(); 

  //7
//tail curve 1
beginShape();
 vertex(k,l);//first anchor pt
 bezierVertex(k+50,l-40,k+70,l+20,k+150,l+50);//c1,c2,v2
 //tail curve 2
 vertex(m,n);//first anchor pt
 bezierVertex(m-60,n+10,m-70,n-20,m-100,n+80);//c1,c2,v2
 //tail curve 3
  line(m-100,n+80,k,l);
 endShape();
 
//wing

 beginShape();
 /*vertex(i,j);//first anchor pt
 bezierVertex(i-50,j-30, i-80,j-40,i-130,j-200);//c1,c2,v2*/
 //wing 2
 vertex(i,j);//first anchor pt
 bezierVertex(i-50,j-30, i-80,j-40,i-130,j-200);//c1,c2,v2
 vertex(q,r);//first anchor pt
 bezierVertex(q-110,r+150,g-140,r+220,q+40,r+250);//c1,c2,v2
 
 line(q+40,r+250,q+100,r+225);
 endShape();
 
 //beak
 strokeJoin(ROUND);
 strokeWeight(6);
 line(e+25,f-35,e+180,f-50);
 
 //leg
 noFill();
 beginShape();
 vertex(a,b);//first anchor pt
 bezierVertex(a-10,b+30,a+50,b-10,a+50,b+10);//c1,c2,v2
 endShape();
 
 //claw
beginShape();
 vertex(a+40,b+10);//first anchor pt
 bezierVertex(a+40,b,a+60,b,a+40,b+20);//c1,c2,v2
 endShape();
 
//eye
 strokeWeight(11);
 point(e-35,f-35);
 
 //feathers on head
 stroke(6); 
noFill();
  stroke(1200); 
 beginShape();
 vertex(g+10,h-20);//first anchor pt
 bezierVertex(g-20,h-30,g-30,h-40,g-20,h-20);//c1,c2,v2
endShape();
 
 beginShape();
 stroke(500,3000,1000);
 vertex(g+15,h-25);//first anchor pt
 bezierVertex(g-25,h-35,g-35,h-45,g-25,h-35);//c1,c2,v2
endShape();

beginShape();
stroke(200,2530,2900);
 vertex(g+20,h-30);//first anchor pt
 bezierVertex(g-35,h-45,g-45,h-55,g-35,h-45);//c1,c2,v2
 endShape();
 
    
}

