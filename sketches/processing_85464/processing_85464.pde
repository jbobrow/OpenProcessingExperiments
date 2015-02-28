
void setup ()

{
  size (500,500);
  background (#FFFFFF);}
  
  
  
  void draw () {
  noStroke ();
  smooth ();
 
  
  for (int posx = 5; posx <=475; posx = posx + 50)
  
  for (int posy = 5; posy <=475; posy = posy + 50)
   
   {  
    
     
     fill (#8FCCE8);
     rect  (posx, posy, 40, 40);
    
     fill (#44B0E0);
     rect (posx, posy, 35, 35);
     
     fill (#3360B9);
     rect (posx, posy, 30, 30);
         
     fill (#2E7798);
     rect (posx, posy, 30, 30);
     
     fill (#175B79);
     rect (posx, posy, 25, 25);
     
     fill (0);
     rect (posx, posy, 20, 20);
  
     
  
}

}


