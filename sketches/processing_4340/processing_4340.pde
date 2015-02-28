
int h,b,x,q=599;void setup(){colorMode(HSB,q,99,99,9);smooth();}void draw(){h%=q;h++;b%=99;b++;x%=q;x+=random(9);rotate(x);fill(h,b,b,3);rect(x,h-b,x,b);}

