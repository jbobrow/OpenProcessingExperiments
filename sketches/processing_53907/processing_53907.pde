
size(250,250);
background(255,145,0);
rectMode(CENTER);
translate(100,150);        //location of centre of first square
noStroke();
smooth();
rotate(-0.7);
 
int q=90;
int w=60;
 
/*Starting at 200, subtract 90 as long as x is greater than 0*/
  for(int x=150; x>0;x-=10){
    // colour changes where 90 is subtract from B, opacity at 100
    fill(0,78,255, 85); //blue
    rect(50, 50, x, x);
    rotate(-2.6);   
    scale(0.8);
    
    fill(45,162,26, 90);//green
    rect(w, w, x, x);   
    rotate(1.2);
    
    fill(255,246,0, 150);//yellow
    rect(w, w, x, x);   
    rotate(2);
  }

