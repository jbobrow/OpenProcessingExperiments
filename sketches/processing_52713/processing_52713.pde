
// size of screen and background 
size (250,250);
background (255);
//smooth lines 
smooth ();
//float variable x is set to desired number
float x=12.5;
// stroke of 0 
stroke (0);
 
//loop variable equals to 12.5; variable x is less than 125;variable x equals to its variable by 20   
for (x=12.5; x<125; x=x+20) {
//indicating the number of lines  
  line (x,125,125,125-x);
  line (x+125,125,125,x);
  line (x,125,125,x+125);
  line (x+125,125,125,250-x);
}

//perameter of the size
translate (125,125);

//number of times to rotate  
rotate (PI/4);

//indication of the stroke  
stroke (0,0,51,70);
 
//repetition of the lines that will create a transparent effect  
for (x=12.5; x<125; x=x+20) {
  line (x-125,0,0,0-x);
  line (x,0,0,x-125);
  line (x-125,0,0,x);
  line (x,0,0,125-x);
}
  
rotate (PI/6);
 
stroke (51,51,102,60);
 
for (x=12.5; x<125; x=x+20) {
  line (x-125,0,0,0-x);
  line (x,0,0,x-125);
  line (x-125,0,0,x);
  line (x,0,0,125-x);
}
 
rotate (PI/6);
 
stroke (102,102,153,50);
 
for (x=12.5; x<125; x=x+20) {
  line (x-125,0,0,0-x);
  line (x,0,0,x-125);
  line (x-125,0,0,x);
  line (x,0,0,125-x);
}
                
