
/* Natalie Schabowicz PS1 - 6*/

void setup() {
 size (400, 400);
 smooth();
}

void draw() {
 
  /*loops/*
  
  /*for (init; test; update) { 
  statements
}*/

  for (int x=0; x<=400; x=x+50) {
   for (int y=0; y<=400; y=y+50)  
   {  
     
   /*conditional*/
   
     if((x+y)%20==0) {  
   fill(236,191,192); /*light pink*/    
} 
  else  {  
   fill(253,19,113); /*dark pink*/
   }  
   
   rect (x, y, 100, 100);
   }
  }
}
                                            
