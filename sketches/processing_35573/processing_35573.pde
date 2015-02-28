
void setup(){
size(300,300);
}
float r1=0;
float r2=50;
float r3=100;
void draw(){
background(mouseY);
fill(0,r1,height-r1);
quad(0,mouseY,30,mouseY,30,height,0,height);//1
fill(r1,0,height+r1);
quad(30,320-mouseY,60,320-mouseY,60,height,30,height);//2
fill(r2,0,height+r2);
quad(60,mouseY+30,90,mouseY+30,90,height,60,height);//3
fill(r3,height+r3,0);
quad(90,350-mouseY,120,350-mouseY,120,height,90,height);//4
fill(0,height+r2,r1/2);
quad(120,mouseY+70,150,mouseY+70,150,height,120,height);//5
fill(r3,height+r3/2,r1);
quad(150,400-mouseY,180,400-mouseY,180,height,150,height);//6
fill(r3,height+r2,r1/2);
quad(180,mouseY+20,210,mouseY+20,210,height,180,height);//7
fill(r1*2,r1-100,0);
quad(210,250-mouseY,240,250-mouseY,240,height,210,height);//8
fill(0,height+r2,r1/2);
quad(240,mouseY-20,270,mouseY-20,270,height,240,height);//9
fill(r3/2,0,r1);
quad(270,350-mouseY,300,350-mouseY,300,height,270,height);//8
}
void mouseDragged(){
r3 =  mouseY+30;
r2 = mouseY-40;
r1 = mouseY+60;
}

