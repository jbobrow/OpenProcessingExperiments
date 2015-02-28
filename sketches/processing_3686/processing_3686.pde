
float z=0,i,w,h;float n(){return noise(++z);}void draw(){w=width;h=height;smooth();for(i=0;i<60;i++){noFill();stroke(255,n()*255);bezier(w*.1,h*.1,n()*w,n()*h,n()*w*2,n()*h*2,w*2,h*2);}filter(17);}

