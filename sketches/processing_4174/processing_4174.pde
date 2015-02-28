
int q,w,x,y;void setup(){size(350,250);}void draw(){ellipse(q,w,10,10);q=(q+x+350)%350;w=(w+y+250)%250;}void mouseClicked(){x=floor(random(-3,3));y=floor(random(-3,3));q=mouseX;w=mouseY;}

