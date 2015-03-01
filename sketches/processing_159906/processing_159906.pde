
void setup() {
  size(700,700);
  background(#DAF5ED);
  smooth();
  
}
void draw(){
  int w=width;
  int h=height;
  int middlex=width/2;
  int middley=height/2;
  int rectwidth = 10;
  int rectheight = 10;
  int middlerectx = middlex-(rectwidth/2);
  int middlerecty = middley-(rectheight/2);
 
  fill(#F2E4C9,10);
  stroke(255,255,255,20);
  for(int y=1; y<300; y+=5)
  {
    for(int x=1; x<100; x++)
    {  
      rect(w-(rectwidth*x)+y, h-(rectheight*x), rectwidth, rectheight);
    }
  }
 
 //squares
  fill(#D9FFC4,10);
  stroke(255,255,255,20);
 for(int y=1; y<50; y+=2)
  {
    
    for(int x=1; x<100; x+=2)
    {  
      rect(w-(rectwidth*x)-2*y, 0+(rectheight*x), rectwidth, rectheight);
     }
  }
  //squares
  for(int y=2; y<1; y+=3)
  {
    
    for(int x=2; x<4; x+=5)
    {  
      rect(w+(rectwidth*x*2)-2*y, y+(rectheight*x*4), rectwidth, rectheight);
     }
  }
  //
  fill(#C6451A,50);
  stroke(#FFD3C4,20);
  for(int y=1; y<300; y+=7)
  {
    
    for(int x=1; x<100; x+=2)
    {  
      rect(w-(rectwidth*x)-2*y, 0+(rectheight*x), rectwidth, rectheight);
     }
  }
  noStroke();
  fill(#C4BF5F,30);
  rect(394,506,30,30);
  fill(#B7B248,30);
  rect(396,504,30,30);
  fill(#AFAA39,30);
  rect(398,502,30,30);
  fill(#B7B13B,30);
  rect(400,500,30,30);
  fill(#D8D24C);
  rect(392,508,30,30);
  
  fill(#C4BF5F,30);
  rect(294,606,60,60);
  fill(#B7B248,30);
  rect(296,604,60,60);
  fill(#AFAA39,30);
  rect(298,602,60,60);
  fill(#B7B13B,30);
  rect(300,600,60,60);
  fill(#D8D24C);
  rect(292,608,60,60);

  fill(#C4BF5F);
  rect(90,500,100,100);
  fill(#B7B248);
  rect(88,502,100,100);
  fill(#AFAA39);
  rect(86,504,100,100);
  fill(#B7B13B);
  rect(84,506,100,100);
  fill(#D8D24C);
  rect(82,508,100,100);
}



