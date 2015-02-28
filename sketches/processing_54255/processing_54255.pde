
/*Code by Sarah Tse
York Sheridan Joint Program of Design*/

size(250,250);
background(21, 73, 96);
rectMode(CENTER);
translate(170,100);        //location of centre of first square
noStroke();
smooth();
fill(56,163,206);
rotate(-0.7);

int q=20;
int w=60;

/*Starting at 200, subtract 20 as long as x is greater than 0*/
  for(int x=150; x>0;x-=10){
    // colour changes where 20 is subtract from B, opacity at 100
    fill(110,213,255-q, 80); //blue
    rect(50, 50, x, x);
    rotate(-1.2);    
    scale(0.8);
    fill(0, 0, 0, 70);   //black
    rect(w, w, x, x);    
    rotate(-0.7);
    fill(36,188,180-q, 150); //teal
    rect(w, w, x, x);    
    rotate(-0.7);
  }

