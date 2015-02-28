
String s=" All work and no play makes Jack a dull boy";int w,x,y,a;void setup(){w=500;size(w,w);}void draw(){textFont(createFont("",9));a++;if(x%w<1){y=y+12;}fill(0);text(s.charAt(a%43),x%w,y);x=x+5;}

