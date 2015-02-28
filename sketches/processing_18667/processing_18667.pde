
size(250, 250);
  smooth();
  background(#171717);
  noFill();

//upper vertical - olive
for(int i=30; i<43; i+=4){
  stroke(#454F3F);
  line(i, 0, i, 100);
  //colour split - grey/green    
    for(int y=46; y<59; y+=4){
      stroke(#70A185);
      line(y, 0, y, 100);
}
}

//lower vertical - light blue
for(int x=30; x<43; x+=4){
  stroke(#99FFD3);
  line(x, 250, x, 150);
  //colour split - blue   
    for(int c=46; c<59; c+=4){
      stroke(#006969);
      line(c, 250, c, 150);
}
}

//upper harmony bezier - olive
for (int i=30; i<43; i+=4){
for(int j=20; j<51; j+=10){
  smooth();
  stroke(#454F3F);
bezier(i, 100, 35, 190, 220, j, 340, 165);
}
}
//lower colour split - blue
for (int o=46; o<59; o+=4){
for(int p=20; p<51; p+=10){
  smooth();
  stroke(#006969);
bezier(o, 150, 45, 50, 290, p, 270, 240);
}
}

//lower harmony bezier - light blue
for (int m=30; m<43; m+=4){
for(int n=20; n<51; n+=10){
  smooth();
  stroke(#99FFD3);
bezier(m, 150, 30, 95, 250, n, 350, 180);
}
}
//upper colour split - grey/green
for (int k=46; k<59; k+=4){
for(int l=20; l<51; l+=10){
  smooth();
  stroke(#70A185);
bezier(k, 100, 45, 220, 220, l, 300, 100);
}
}

