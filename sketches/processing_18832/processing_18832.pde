
float a,x,y;void draw(){x+=random(-2,2);y+=random(-2,2);translate(width/2+x,height/2+y);a++;rotate(a*.1);stroke(a%255+30,20);line(-9,0,9,0);}

