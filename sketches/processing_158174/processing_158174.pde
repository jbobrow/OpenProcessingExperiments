
int px=0;
c=50;
void setup(){
size(500,500);
}
void draw(){
px=px+2;
c=px;
line(c,0,width/2,height/2);
line(width/3,c,height/2,0);
line(c,0,width/5,50)
line(c,50,20,29);
px=px+2;
ellipse (px,height/2,30,30)
ellipse (px,height/3,50,50)
ellipse (px,height/5,10,10)
ellipse (px,height/8,10,10)
ellipse (px,height/10,10,10)

 
ellipse (width/2,px,30,30)
ellipse (width/5,px,30,30)
ellipse (width/3,px,30,30)
ellipse (width,px,30,30)
ellipse (width/8,px,30,30)
ellipse (width/10,px,30,30)
 
 
 
 
ellipse (mouseX,mouseY,20,20)<= ellipse (mouseY,50,mouseX,30)
ellipse (pmouseY,pmouseX,5,5)
 
 
 
px++;
if(px<width/2){
fill (255,0,0);
 
 
 
}else{
fill (0,255,0);
;

 
}
}

