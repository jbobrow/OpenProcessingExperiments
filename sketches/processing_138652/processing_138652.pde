

int x = 0;
int y = 550;
int x1 = 50;
int y1= 550;
int c= 2;

void setup() {
  size(600,600);
  smooth();
  fill(200,200,255);
  strokeWeight(2);

}

void draw() {
 stroke(50,50,150);
  fill(random(1,255),random(1,255),random(1,255));
  ellipse(x,y,100,100);  
  fill(1,1,1);
  ellipse(x,y,50,50);  
  //
    fill(random(1,255),random(1,255),random(1,255));
  ellipse(x1,y1,100,100); 
   fill(1,1,1);
  ellipse(x1,y1,50,50);   
  //
    fill(random(1,255),random(1,255),random(1,255));
    ellipse(x-50,y-50,100,100); 
      fill(1,1,1);
  ellipse(x-50,y-50,50,50);  
  //
     fill(random(1,255),random(1,255),random(1,255)); 
  ellipse(x1+50,y1+50,100,100);  
    fill(1,1,1);
  ellipse(x1+50,y1+50,50,50);  
  //
  stroke(150,50,50);
    fill(random(1,255),random(1,255),random(1,255));
     ellipse(x-100,y-100,100,100);  
       fill(1,1,1);
  ellipse(x-100,y-100,50,50);  
  //
       fill(random(1,255),random(1,255),random(1,255));
  ellipse(x1+100,y1+100,100,100);  
    fill(1,1,1);
  ellipse(x1+100,y1+100,50,50);  
  //
    fill(random(1,255),random(1,255),random(1,255));
     ellipse(x-150,y-150,100,100); 
       fill(1,1,1);
  ellipse(x-150,y-150,50,50);  
  //
      fill(random(1,255),random(1,255),random(1,255)); 
  ellipse(x1+150,y1+150,100,100);  
    fill(1,1,1);
  ellipse(x1+150,y1+150,50,50);  




if(x>=width-50) { 
  x=x;
} else if (x<=width-50) { x=x+c;
}
if(x>=width-50) { 
  y=y-2;} else if (x<=width-50) { y=y;}
  

 
 //////////
 
 if(y1<=50) { 
  y1=50;
} else if (y1>=50) { y1=y1-c;
}
if(y1<=50) { 
  x1=x1+c;} else if (y1>=50) { x1=x1;}
  

 
 ////////
 

}

