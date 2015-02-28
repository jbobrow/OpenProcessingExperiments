
size(500,500);

background(133,195,227);

fill(245,238,20);
noStroke();
smooth();
ellipse(420,80,70,70);


//terreo
fill(129,149,245);
rect(45,360,81,70);
rect(180,360,243,70);
fill(226,229,201);
stroke(156,159,131);
for (int i=41; i<445; i=i+27) {
  rect(i,360,7,70);
}

//chao
fill(255);
noStroke();
rect(0,430,500,80);
fill(0);
for (int x=0; x<500; x=x+20){
  rect(x,430,10,80);
}

//edificio
fill(203,203,175);
stroke(75,75,75);
strokeWeight(1);
for (int j=41; j<207; j=j+5) {
  rect(j,150,5,210);
}
for (int k=296; k<423; k=k+5) {
  rect(k,150,5,210);
}
fill(237,184,120);
rect(211,150,86,210);

fill(188,177,166);
stroke(150,140,130);
for (int l=150; l<365; l=l+35) {
  rect(41,l,385,3);
}

//janelas
fill(255);
stroke(75,75,75);
for (int m=153; m<363; m=m+35){
  rect(211,m,86,5);
}
for (int n=211; n<297; n=n+5){
  for (int m=153; m<363; m=m+35){
  line(n,m,n,m+5);
  }
}

for (int o=49; o<122; o=o+27){
  rect(o,364,18,10);
}
for(int p=211; p<423; p=p+27){
  rect(p,364,18,10);
}

//arvores
noStroke();
fill(120,80,0);
rect(25,370,7,60);
rect(440,370,7,60);
for (int q=0; q<7; q++){
  fill(0,random(150,230),0,90);
  ellipse(random(20,35),random(360,380),40,40);
  ellipse(random(430,445),random(360,380),40,40);
}
