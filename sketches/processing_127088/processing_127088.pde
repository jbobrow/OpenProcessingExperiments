
size (180,180);
background(255);

translate(0,180);
scale(1,-1);

for (int a=0;a<=180;a++){
    for (int b=0;b<=180;b++){
      int c = 180 - a - b;
      stroke(c);
      if (a==b || a==c || b==c) {stroke(255,0,0);}
      if (c>0){
      point(a,b);}
     }
   }
