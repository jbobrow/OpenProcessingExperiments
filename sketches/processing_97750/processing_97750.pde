
void setup(){
  size(300,300);
  background(255);
  frameRate(5);
}
 int p=180; 
 int s=30;     
 int ceu=5;
  
void draw(){
  background(255);
  int y=150;
  noStroke();
  fill(237-ceu,255-ceu,253);
  rect(0,0,300,50);
  fill(245-ceu,255-ceu,254);
  rect(0,50,300,40);
  ceu+=5;
   
  for(int x=15; x<130; x=x+13){
    stroke(#F56116);
     strokeWeight(4);                      //telhado
    line (x,y,x-10,y+10);
      
    y=y-8;
    }
    for(int x=100; x<280; x=x+13){
    stroke(#F56116);
     
    line (x,y,x+10,y+10);                //telhado
    y=y+8;
    }
     for(int x=14; x<130; x+=13){
       stroke(#F58372);
       strokeWeight(1);                  //casa
       line(x,y-35,x,240);
       y-=8;
     }
      for(int x=130; x<280; x+=13){
        line(x,y-20,x,240);
        y+=8;
       
}
      noStroke();
      fill(#B7E8E4);
      rect(30,170,30,30);
      rect(170,170,30,30);
      fill(#62371D);                 //janelas e porta
      rect(100,180,30,60);
      fill(#13B957);
      rect(0,240,300,300);
       
      fill(#FFEC0F);
      ellipse(s*5,s,50,50);
      s++;
       pessoa();
       
  }
   void pessoa(){
       
      
     fill(0);
       rect(p,210,10,20);
      ellipse(p+5,205,8,8);
      p++;
       
      
  }
   


