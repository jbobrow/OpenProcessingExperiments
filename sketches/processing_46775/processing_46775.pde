
float p,c,d,e,f,g,h,i,j,k;
 
void setup(){
  size(400,400);
 smooth();
 strokeWeight(2);
c=60;
d=0;
e=0;
f=0;
g=0;
h=0;
i=0;
j=0;
k=0;
}
void draw(){
  stroke(random(50),random(255),random(100));

  background(random(50),random(200),random(200));
   fill(random(50),random(255),random(100));
  ellipseMode(RIGHT);
  ellipse(200,200,c+20,c+20);   
  ellipse(200,200,d+40,d+40);

  ellipseMode(LEFT);
  ellipse(200,200,c+60,c+60);   
  
  
  ellipseMode(LEFT);
  ellipse(200,200,e+60,e+60);
 
  ellipse(200,200,f+80,f+80);
 
  ellipseMode(CENTER);
  ellipse(200,200,g+100,g+100);
 
  ellipseMode(CENTER);
  ellipse(200,200,h+120,h+120);
  
  ellipseMode(CENTER);
  ellipse(200,200,i+140,i+140);
 
  ellipseMode(CENTER);
  ellipse(200,200,j+160,j+160);
  
  ellipseMode(CENTER);
  ellipse(200,200,k+180,k+180);

  
   fill(random(200),random(100),random(50));
  ellipseMode(CENTER);
  ellipse(200,200,c,c);
    fill(random(50),random(200),random(100));
  ellipseMode(CENTER);
  ellipse(200,200,d,d);

  ellipseMode(CENTER);
  ellipse(200,200,e,e);
  
  ellipseMode(CENTER);
  ellipse(200,200,f,f);
 
  ellipseMode(LEFT);
  ellipse(200,200,g+200,g+200);
  
  ellipseMode(CENTER);
  ellipse(200,200,h,h);
  
 fill(random(200),random(20),random(50));
  ellipseMode(CENTER);
  ellipse(200,200,i,i);
  

  ellipseMode(RIGHT);
  ellipse(200,200,j-100,j-100);
  
  ellipseMode(CENTER);
  ellipse(200,200,k,k);
 
  c++;
 
 
}

