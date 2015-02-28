
float w = -160,h = 800;

void setup() {
size(300,500);
background(0);

}

void draw(){ 
for(float i=-50;i<150;i=i+10){

float r = 300*(sin(millis()/(400+i)));
float x = w/10+(w/2)*sin(millis()/(300+i));
//ear
noStroke();
if(mousePressed) fill(random(179,217),random(179,215),255); 
else fill(255,201,230);

beginShape();//三點組成三角形
vertex(245+x-10,130+r-10);
vertex(310+x-10,100+r-10);
vertex(292+x-10,165+r-10);
endShape(CLOSE);
//ear

beginShape();
vertex(90+x-10,100+r-10);
vertex(150+x-10,130+r-10);
vertex(110+x-10,165+r-10);
endShape(CLOSE);
//face

ellipse(200+x-10,200+r-10,200,160);//橢圓形(200,160=大小)
//ear


  fill(255);
noStroke();


beginShape();//三點組成三角形
vertex(245+x,130+r);
vertex(310+x,100+r);
vertex(292+x,165+r);
endShape(CLOSE);
//ear

beginShape();
vertex(90+x,100+r);
vertex(150+x,130+r);
vertex(110+x,165+r);
endShape(CLOSE);
//face

ellipse(200+x,200+r,200,160);//橢圓形(200,160=大小)









//eyes
fill(0);
ellipse(150+x,215+r,20,25);
ellipse(250+x,215+r,20,25);

//nose
fill(222,255,0);
ellipse(200+x,230+r,20,15);

//butterfly circle
fill(255,0,0);
beginShape();
vertex(340+x,160+r);
vertex(295+x,215+r);
vertex(270+x,150+r);
endShape(CLOSE);

fill(255,0,0);
beginShape();
vertex(230+x,100+r);
vertex(200+x,150+r);
vertex(270+x,150+r);
endShape(CLOSE);
fill(255,0,0);
ellipse(270+x,150+r,30,30);
}
}


