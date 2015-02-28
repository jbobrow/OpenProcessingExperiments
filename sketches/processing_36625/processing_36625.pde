
size (400, 400);
//background (#353632);
background (255);
//background (#C8CBC1);
smooth ();
noStroke();

for (int arcx=0; arcx<width; arcx=arcx+1){
  for (int arcy=0; arcy<height; arcy=arcy+1){
    fill (#F0D798, 140);
    arc (arcx*135, arcy*135, 180, 220, 0, PI);
fill (255,0,255, 40);
arc (arcx*90, arcy*90, 60, 100, 0, PI);
fill (#A3D1ED, 120);
//rotate (PI);
arc (arcx*95+40, arcy*95+20, 90, 110, 0, PI);
//fill (#BFEA63, 100);
//arc (arcx*100+20, arcy*100, 40, 85, 0, PI);


  }
}
   
for (int x=0; x<=410; x+=1){
  for (int y= 0; y<410; y+=1){
     float wid=  random(5, 10);
    float heig = random (5, 15);

////conditional 1 (red stroke)
// if (x<4){ // equality test. Note the double-equals !!!!
//      stroke(255,0,0);
//    
//    } else {
//      stroke (0,0,0);
//    
//    }
     
    fill (0);
    arc (x*25, y*25, wid, heig, 0, PI);
   
  }
}

for (int xi=1; xi<=width; xi=xi+25){
  for (int yi=1; yi<=height; yi=yi+25){
    noStroke ();
//fill (#C8CBC1, 200);
fill (255);
//fill (255, 0, 0);

ellipse (xi+12,yi+5, 4,4);
  }
}
 
 
 



