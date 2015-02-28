
float lbx,lby,tbx,tby,rbx,rby, cblx,cbly,cbrx,cbry;

void setup (){
  size(600,600);

lbx=random(300);
lby=random(117, 300);

tbx=random(600);
tby=random(143);

rbx=random(300,600);
rby=random(484,600);

cblx=random(397);
cbly=random(300);
cbrx=random(377);
cbry=random(300,600);


stroke(0);
strokeWeight(50);
noFill();
beginShape();
//left stroke
bezier(117,536, lbx,lby, tbx,tby, 300,143);
//right stroke
bezier(300,143, tbx,tby, rbx,rby, 484,536);
//cross bar
bezier(117, 397, cblx,cbly, cbrx,cbry,484, 397); 




/*vertex(117, 536);
vertex( 300, 143);
vertex(484, 536);*/
endShape();

};
void draw(){
 
}


