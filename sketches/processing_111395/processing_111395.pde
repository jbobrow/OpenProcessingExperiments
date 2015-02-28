
//Code-Objects: For loops: Lines
//VIIRJ.COM, 2013



size (600, 600);
background(0);
stroke(255);
strokeWeight(0.3);

float v;
float y;
v= width/2; //center
y= height/2; //center

 
for (float i=0; i<=width; i=i+8) { //changes the density of the lines (the lower the number the more dense)
  for (int j=0; j<=height;j=j+23) { //changes the density of the lines
   
    line(i, 50, v, j); //changes the line coordinates (where they start & end)
  }

}



