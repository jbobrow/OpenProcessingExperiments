
color purp = color(223,215,255);
color lPurp = color(220,220,255);
color dPurp = color(150,100,255);
//dimensions s = size(30,30);
size(600,600);
background(252,171,176);
stroke(148,131,209);
stroke(0);
//line(0,300,600,300);


/*for(int i = 0; i<800; i+=25){
  stroke(125);
  noFill();
  ellipse(300,300, i+50,i);
}
noStroke();*/



color [] purples = new color[12];
purples[0] = color(255);
purples[1] = color(245,242,255);
purples[2] = color(233,227,255);
purples[3] = color(223,214,255);
purples[4] = color(215,203,255);
purples[5] = color(209,196,255);
purples[6] = color(199,183,255);
purples[7] = color(193,175,255);
purples[8] = color(179,157,255);
purples[9] = color(168,142,255);
purples[10] = color(154,124,255);
purples[11] = color(150,118,255);



/*noStroke();
int i = 0;
int l = 250;
int m = 10;
for(int j = 600; j>0; j-=50){

  for(int k = 0; k<=1200; k+=50){
    fill(purples[i]);
    ellipse(k,300, l, j);
  }
  i++;
  m+=10;
  l+=m;
}*/

int l = 250;
stroke(0);
for(int j = 600; j>0; j-=50){

  for(int k = 0; k<600; k+=50){
    
      noFill();
      ellipse(k,300, l, j);
      
    }
    l+=10;
  
}
  
filter(OPAQUE); 










