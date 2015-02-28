

PFont f;

void setup() {  

  size(400,600);  
  smooth();
  f=loadFont("CopperplateGothic-Light-48.vlw");
  textFont(f);  







  stroke(800);  
  
  textAlign(CENTER);  

  


}  

   

void draw() {  

  background(800,800,800);  

   




  int s = second();  

  int m = minute();  

  int h = hour();  

  String t = nf(h,2) + ":" + nf(m,2) ;  


     

 



  String tt = ":" + nf(s,2) ;  



     

    


 

  int d = day();  

  int mon = month();  

  int y = year();  

  String ttt =  nf(y,2) +"." + nf(mon,2) + "." + nf(d,2);  



  //date and time  

 

  float hh = map(hour(),0,24,0,300);  

  float mm = map(minute(),0,60,0,300);  

  float ss = map(second(),0,60,0,500);  

 
 stroke(5);  

  strokeWeight(350);  

  line(0,0,450,600);

 
 
 
  stroke(100);  

strokeWeight(70);  

  line(hh,0,hh,600);  

     

     

  PImage a = loadImage("c.png");  

  image(a,mm,1);  

  stroke(0,50,250);  

  strokeWeight(5);  

  line(mm,0,mm,600);  

     

   

  PImage ii = loadImage("2.png");  

  image(ii,ss,350);  

  stroke(242,2,27);  

  strokeWeight(5);  

  line(ss,0,ss,550);  

   

  //timeline1  

     

  float hhh = map(hour(),0,24,0,200);  

  float mmm = map(minute(),0,60,0,200);  

  float sss = map(second(),0,60,0,200);  

  

     

  

     

  PImage iii = loadImage("b.png");  

  image(iii,sss,150);  

  stroke(300,204,64);  

  strokeWeight(5);  

  line(sss,0,sss,350);    

  //timeline2  

     

  float hhhh = map(hour(),0,24,0,400);  

  float mmmm = map(minute(),0,60,0,400);  

  float ssss = map(second(),0,60,0,400);  

  stroke(255);  

  strokeWeight(5);  

  line(hhhh,0,hhhh,600);  

stroke(255);  

  strokeWeight(5);  

  line(0,0,0,600);  
   
   

  
  
  

     
stroke(700);  

  strokeWeight(200);  
  line(600,hhh,600,hhh); 
   
  text(t, 200, 300);
 

   
 
     

} 


