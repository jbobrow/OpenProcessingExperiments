
//* code by Erika

//consistant elements
size (250,250);
background (109,27,27,10);
smooth ();
strokeWeight (2);
 
//variable
float x=12.5;

//white star
stroke (255,95);
 
for (x=12.5; x<125; x=x+20) {
  line (x,125,125,125-x);
  line (x+125,125,125,x);
  line (x,125,125,x+125);
  line (x+125,125,125,250-x);
}
 
translate (125,125);
 
//pink star
rotate (PI/4);
 
stroke (229,173,480,70);
 
for (x=12.5; x<125; x=x+20) {
  line (x-125,0,0,0-x);
  line (x,0,0,x-125);
  line (x-125,0,0,x);
  line (x,0,0,125-x);
}
  
//beige star
rotate (PI/6);
 
stroke (226,224,150,60);
 
for (x=12.5; x<125; x=x+20) {
  line (x-125,0,0,0-x);
  line (x,0,0,x-125);
  line (x-125,0,0,x);
  line (x,0,0,125-x);
}
 
//blue star
rotate (PI/6);
 
stroke (102,102,153,50);
 
for (x=12.5; x<125; x=x+20) {
  line (x-125,0,0,0-x);
  line (x,0,0,x-125);
  line (x-125,0,0,x);
  line (x,0,0,125-x);
}


