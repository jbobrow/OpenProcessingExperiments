
//SHIFT

//I will be creating a typeface out of squares and triangles.  
//These shapes will shift into a new letter corresponding to the letters on the keyboard
//The goal is to create an interactive typeface 
//The goal is to explore typography in a new medium; ie processing
//The goal is to create an experience that the user participates in.

//Technical issues include understanding classes
//Setting up a random code to allow letters to shift from one to another
// To add additional/build complex but assessable interactive elements 
//ie color changes and etc.



size(240,340);


strokeWeight(.2);
fill(#F2F4FA);
for(int x=0;x<=240;x+=20){
  for(int y=0;y<=340;y+=20)
  rect(x,y,20,20);
}

  //fill(#BCFAFF);
for(int x=60;x<=160;x+=40){
  for(int y=40;y<=160;y+=40)
    rect(x,y,40,40);
  }

  
fill(#081E86);
rect(100,40,40,40);
rect(60,80,40,40);
rect(60,120,40,40);
rect(100,120,40,40);
rect(140,80,40,40);
rect(140,120,40,40);

triangle(60,80,100,40,100,80);
triangle(140,40,140,80,180,80);
triangle(60,160,60,200,100,160);
triangle(140,160,180,200,180,160);

rect(40,252,160,20);
rect(40,280,160,20);
