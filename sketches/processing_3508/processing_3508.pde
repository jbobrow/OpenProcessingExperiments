
float t=0,x,s=256;void setup(){textFont(createFont("",9));}void draw(){x=noise(t/s)*s;fill(t/2%s);try{pixels[0]++;}catch(Exception e){rotate(noise(x)-.5);text(split(""+e,'.')[(int)(t/s%3)],x,t++%s);}}
