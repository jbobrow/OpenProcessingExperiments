
float a;
int red=10;
float green =120;
int blue=250;


  

void setup ()  {
  size (600,600);
}
 
void draw () {
  background (red,green,blue);
  if (blue>35) blue= blue-1;
  if(green>10) green= green-0.4;
  
  
  
  fill (255,255,0);
  ellipse (50,a,40,40);
  
  stroke(0);
 fill(100); 
 rect (0,450,width,150); 
  fill(0);
  quad(265,160,275,160,290,350,250,350);
  rect(245,350,50,10);
  quad(247,360,293,360,310,430,230,430);
  fill(red,green,blue);
  rect(260,380,20,60,20);
  fill(0);
  rect(225,430,90,10);
  quad(227,440,313,440,360,550,180,550);
  rect(263,145,14,15);
  rect(268,137,3,8);
  stroke(100);
  fill(100);
  rect(250,470,40,100,50);
  
     for ( int i = 170; i < 270; i += 5) {
if ( i < 220) { stroke (96,33,2);
  line(264,i,276,i);

}else  {
  line(260,i,280,i);
}
}
 for ( int i = 270; i < 350; i += 5) {
if ( i < 310) { stroke (96,33,2);
  line(255,i,285,i);

}else  {
  line(254,i,286,i);
}
} 


  
   a = a + 2;
  if ( a < 0) {
    a = height;
    
 
    
  }
}
