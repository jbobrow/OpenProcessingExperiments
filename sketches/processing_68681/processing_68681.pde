
void setup() {
  size(500,269);
  background(255);
  strokeWeight(20);
  //rect(0,0,width,height);
}
 
void draw() {
  smooth();
  int i=0,k=0,j=0,n,x,y;  
  //Degradado cielo en linea
  for(i=0;i<150;i++)
  {
    stroke(2*i,99+i,255);
    line(0,i,500,i);
  } 
  //Degradado montana
  for(i=185;i<230;i++)
  {
    for(k=0;k<500;k++)
    {
      if(k<300)
      {
        if(i<210)
          stroke(k/5,99+(k/5),255);        
        else
          stroke(i+20,i+10,255);
        j=k;
      }
      else
      {
        if(i<210)
          stroke(k/5,99+(j/5),255);
        j--;
      }
      point(k,i);
    }   
  } 

  strokeWeight(0);
  
  fill(225,235,255);
  beginShape();  
    vertex(0,210);
    vertex(200,220);
    vertex(0,259);
  endShape();
  
  fill(#162E1A);
  beginShape();  
    vertex(500,210);
    vertex(0,250);
    vertex(0,269);
    vertex(500,269);    
  endShape();
  
  fill(0,100,255);
  beginShape();  
    vertex(0,165);
    vertex(300,175);
    vertex(0,180);
  endShape();
  
  beginShape();  
    vertex(400,135);
    vertex(300,175);
    vertex(500,190);
  endShape();
  
  bezier(0,165,57,120,111,145,300,175);
  bezier(300,175,350,175,350,175,400,135);
  bezier(400,135,450,190,450,180,500,190);
  fill(#2E4032);
  bezier(0,250,50,240,400,160,500,210);
  fill(0);
  bezier(200,225,290,220,400,190,500,214); 
  
  beginShape(); 
    vertex(45,269);
    vertex(50,262);
    vertex(70,269); 
    vertex(100,269);
    vertex(150,250);
    vertex(210,255);
    vertex(290,249);
    vertex(329,258);
    vertex(430,269);
  endShape();
  
  beginShape(); 
    vertex(200,212);
    vertex(218,200);
    vertex(236,200); 
    vertex(254,212);
  endShape();
  
  fill(0);
  stroke(0);
  n= (int)random(10,30);
  for(i=0;i<=n;i++)
  {
    x= (int)random(0,500);
    y= (int)random(130,185);
    line(x,y,x+1,y+1);
  }  
  /*
  bezier(300,125,350,125,350,125,400,85);
  bezier(400,85,450,85,450,85,500,140);
    bezier(250,250,50,240,400,160,500,214);
  */
}


