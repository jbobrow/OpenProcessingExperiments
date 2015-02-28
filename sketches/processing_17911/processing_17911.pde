
size (250, 250);
smooth ();

background (240,220,234);




strokeWeight (2);


for(int i=20; i<220; i+=20){
{stroke(162,161,161);
  line (i-20, 0, i+42.5, 62.5);
}
}

for(int i=20; i<220; i+=20){
{stroke(162,161,161);
  line (i-20, 62.5, i+42.5, 0);
}
}

for(int i=20; i<220; i+=20){
  {stroke(162,161,161);
  line (i+42.5, 62.5, i-20, 125);
  }}
 
 for(int i=20; i<220; i+=20){
  {stroke(162,161,161);
  line (i+42.5, 125, i-20, 62.5);
  }}
  
  for(int i=20; i<220; i+=20){
{stroke(162,161,161);
  line (i-20, 125, i+42.5, 187.5);
}
}

  for(int i=20; i<220; i+=20){
{stroke(162,161,161);
  line (i-20, 187.5, i+42.5, 125);
  }}
  
for(int i=20; i<220; i+=20){
{stroke(162,161,161);
  line (i+42.5, 187.5, i-20, 250);
  }}
  
  for(int i=20; i<220; i+=20){
{stroke(162,161,161);
  line (i+42.5, 250, i-20, 187.5);
  }}
  
smooth ();
noStroke ();

ellipseMode (CORNER);
for(int y=2; y<=250; y+=42) {
  for(int x=0; x<=250; x+=40) {
    fill (255, 140);
    
    ellipse (x, y, 40, 40);
  }
}


