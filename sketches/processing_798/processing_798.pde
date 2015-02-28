
   int a = 9;
   int n = 1;
   int n1 = 0;
   int b = 700;
   //int x = 0;
   //int y = 0;
   int x1 = 0;
   int y1 = 0;
   int xadvance = 0;
   int yadvance = 0;
   int xa = 0;
   int ya = 0;
   int n2 = 10;
   int counter1 = 0; 
   int halt = 0;
   int halt1 = 0;
   int h = 0;
   int xe = 0;
   int ye = 0;
   int [] x = new int [a];
   int [] y = new int [a];
   int [] xold = new int [a];
   int [] yold = new int [a];
   int [] xend = new int [a];
   int [] yend = new int [a];
   String[] xwords = {"a", "b", "c", "d", "e", "f", "g", "h", "i"};
   PFont w;
  //   w    =      createFont( " Georgia " , 24, true);    
     
     void setup()
      {
      size(800,800); 
        w    =      createFont( " Georgia" , 24, true); 
        
        textFont(w,25);              
       }
  
      void setstarts()
     {   
       for (n=0; n<a; n++)
       {
         xe = int(random (b));
         ye = int(random (b));
         x[n] = xe;
         y[n] = ye; 
         }
       setends();
       }
     
    void setends()
      {
       for (n=0; n<a; n++)
         {
           xe = int(random (b));
           ye = int(random (b));
           xend[n] = xe;
           yend[n] = ye;
           }
    
        }    
      void draw()
      { 
       background(255);  
       fill(0);      
       setstarts(); 
    while (halt1 < 5)
  {  
   
    halt =1;
     while (halt > 0)   
     {
      for (n=0; n<a; n++) 
       {
	xe = x[n];
	xold[n]= xe;
	ye = y[n];
	yold[n] = ye;
	xe = xend[n];
	ye = yend[n];
           if (x[n] < xe) {xa = 1;};
           if (x[n] > xe) {xa = -1;};
           if (y[n] < ye) {ya = 1;};
           if (y[n] > ye) {ya = -1;};
         x[n]=x[n]+xa;
         y[n]=y[n]+ya;
         xa = 0;
         ya = 0;
         }
      halt = 0;
      h = 0;
      for (n=0; n<a; n++) 
       {
	xe = x[n];
	ye = y[n];
	if (xend[n] != xe) {h = 1;};
	if (yend[n] != ye) {h = 1;};
	halt=halt+h;
        main();
       }
      }
       for (n=0; n<a; n++) 
       {
        fill(0);
         text (xwords[n],x[n],y[n]);
           xold[n] = x[n];
           yold[n] = y[n];
          
          }  
    halt1=halt1+1;
    setends();
  }
  halt1 = 0;
}
   void main()
      {  
        //background(255); 
        fill(255);
        text (xwords[n],xe,ye);
        fill(0);
        text (xwords[n],x[n],y[n]);
        fill(255);
        text (xwords[n],xe,ye);
       // draw();  
      }


