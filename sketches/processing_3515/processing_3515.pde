
String s="";int d=255;void setup(){size(d,d);textFont(createFont(s,9));}void draw(){int r=(int)random(9)+1;background(r);fill(d-r);s+=(char)(r+34);if(s.length()>d)s=s.substring(1,d);text(s,0,r,d,d);}

