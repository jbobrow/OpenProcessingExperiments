
void setup(){smooth();strokeWeight(3);}float a,n,c,h,w,f;void draw(){h=height;w=h/2;a+=.3;f=(c+128)%255;n=noise(a)*h;fill(f,16);triangle(w+n,h,w-n,h,w,n);line(w,h,w,n);stroke((c+=1)%255);filter(11);}

