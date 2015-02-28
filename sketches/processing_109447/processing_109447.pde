
size(500,700);
stroke(0);
noFill();
 
float a=0;  //random bounds
float rand; //degrees to rotate randomly
 
for(int i=1;i<=20;i++){//rows
  a += i*.7;              //randomness increases as rows increase
  for(int j=1;j<=13;j++){  //columns
    pushMatrix();
    rand = random(-a,a);
    translate(35+(j*30),35+(i*30));
    rotate(radians(rand));
    rect(0,0,30,30);
    popMatrix();
  }
}


