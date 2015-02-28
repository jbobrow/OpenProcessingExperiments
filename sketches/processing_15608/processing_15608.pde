
PFont f;  



   

void setup()  

{  

  size(450,700);  

  smooth();  

  f=loadFont("YDIMatrix01-72.vlw");  

 

}  

   

void draw()  

{  

   

  int l = millis();  

  int s=second();  

  int m=minute();  

  int h=hour();  

  int y=year();  

  int mo=month();  

  int d=day();  


  background(0);  

   


  //ellipse//  

  fill(0,0);  

  strokeWeight(100);  

  strokeCap(MITER);  

  colorMode(HSB,255);  




  stroke((4.5*s),200,200);  

  ellipse(450,365,400,250);  


  stroke((0.01*l),(l*0.06),(l*0.02));  

  ellipse(450,365,210,80);  

   
   
  stroke(200,200,(4*m)+20);  

  ellipse(450,365,600,450);  

    
  stroke(200,(21*h),200);  

  ellipse(450,365,800,630);  

    





  colorMode(RGB);   
 
 
 
 fill(0);  
strokeWeight(10);  
rect(-10,330,465,70);

  fill(100);  


  textAlign(CENTER);  

   

  textFont(f);  
  
  text(l,400,400);  

  text(s,250,400);  

  text(" :",100, 400);  

  text(m,150,400);  

  text(" :",200,400);  

  text(h,50,400);  
 
  text("  :",300,400);
   

  text(d,100,710);  

  text("/",55,710);  

  text(mo,20,710);  

  text(y,150,50);  

   

  textFont (f);  

 

  text("Year:",50,50);  

  text("M /",33,670);  

  text("D:",100,670);  
  
  }

