
float a,r,t,i=0;void setup(){size(500,500);colorMode(HSB,300,1,1);}void draw(){tint(0,1);image(get(),0,0);stroke(i%300,1,1);for(a=0;a<2000;a++){point(noise(i*.002,a)*500,noise(i*.002+3,a)*500);}i++;}

