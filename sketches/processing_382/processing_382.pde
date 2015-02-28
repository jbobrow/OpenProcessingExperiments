
void setup()
{
  size(800,600);
  background(255);
  float colorgrad=0.175;
  /*for(int i=0;i<800;i++)
  {
    stroke(255);
    line(i,0,i,600);
  }*/
  smooth();
  
  //noStroke();
  //rect(200,250,30,32);
  
  stroke(220);
  for(int i=0;i<30;i++)
  {    line(300-i*0.5,280-i,550+i*0.5,280-i);    
  }
  
  stroke(220);
  fill(220);
  triangle(285,250,425,80,565,250);
  
  stroke(200);
  line(425,250,425,80);
  
  stroke(255);
  fill(240);
  triangle(200,100,300,300,220,100);
  fill(230);
  triangle(300,300,220,100,335,300);
  
  fill(240);
  triangle(100,150,200,100,220,130);
  
  rect(300,280,250,32);
  fill(200);
  triangle(300,280,260,450,550,280);
  

  fill(180);
  triangle(300,280,570,450,550,280);

  
  fill(240);
  triangle(550,280,550,340,670,100);
  
  triangle(300,280,425,210,550,280);
  
  stroke(250);
  for(int i=0;i<30;i++)
  {    line(300-i*0.5,280+i,550+i*0.5,280+i);    
  }
  stroke(240);
  line(285,309,565,309);    
  noStroke();
  fill(235);
  triangle(285,310,425,580,565,310);
  stroke(240);
  line(425,310,425,580);    
}



