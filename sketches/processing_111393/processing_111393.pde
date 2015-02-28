
//Code-Objects: For loops: Lines2 
//VIIRJ.COM, 2013



size (600, 600);
background(0);
stroke(255);
strokeWeight(0.75);

float v;
float y;
v= width/2; //center
y= height/2; //center

 
for (float i=0; i<=width; i=i+50) { //changes the density of the lines (the lower the number the more dense)
  for (int j=0; j<=height;j=j+50) { //changes the density of the lines
    
    float fillVal = map(v, 0, 50, 0, 20);  
    fill( fillVal, i,255 , fillVal);
    line(i, y, v, j); //changes the line coordinates (where they start & end)
  }

}



