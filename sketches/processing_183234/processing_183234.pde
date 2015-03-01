
/*--------------------------------------------------
Casey Hamilton, Robot Sketch 1/22/2015
---------------------------------------------------*/


size(500, 600); //size of canvas
background(150); //greyscale

int a = 200;
int b = 50;
int c = 300;

//Head Portion
fill(#73F7C5); //mint color
rect(a, b+10, a-100, b+20); //head
fill(240); //white
rect(a+10, b, 80, 10); //head top attachment 
rect(a+10, a-70, b+30, b/5); //head bottom attachment 
rect(a-10, b+20, b/5, b); //head left attachment
rect(a+100, b+20, b/5, b); //head right attachment
fill(#73F7C5); //mint color
rect(245, 30, 5, 20); //head anttenae
fill(#FF1F53);
ellipse(a+47, b/2, b/5, b/5); //anttenae

//Face 
fill(#B2FCFF);
ellipse(a+20, b+35, b/5+5, b/5+5); //eye1
ellipse(a+80, b+35, b/5+5, b/5+5); //eye2
rect(a+12, 105, 75, 15); //mouth
line(a+20, a/2+5, a+20, b*2+20); //mouth1
line(a+28, a/2+5, a+28, b*2+20); //mouth2
line(a+36, 105, a+36, b*2+20); //mouth3
line(a+44, 105, a+44, b*2+20); //mouth4
line(a+52, 105, a+52, b*2+20); //mouth5
line(a+61, 105, a+61, b*2+20); //mouth6
line(a+69, 105, a+69, b*2+20); //mouth7
line(a+78, 105, a+78, b*2+20); //mouth8

//body
fill(100); //grey
rect(a+35, b*2+40, b-20, b-30); //neck
fill(#73F7C5); //mint
rect(a-15, a-30, a-70, b+40); //body
fill(240); //white 
rect(a, b*3+5, b*2, b/5+5); //body top attachment 
rect(a, a+60, b*2, b/5+5); //body bottom attachment 
rect(c+15, a-5, b/5+5, b-10); //body right attachment
rect(a-30, a-5, b/5+5, b-10); //body left attachment
fill(#B2FCFF);
ellipse(a+80, a, b-30, b-30); //button1
ellipse(a+80, a+30, b-30, b-30); //button2
fill(#ED5648);
rect(a+10, a-10, b/5+5, b); //bar1
fill(#48ED59);
rect(a+40, 190, b/5+5, b); //bar2
line(a+10, a, a+25, a); //barline1
line(a+10, a+10, a+25, a+10); //barline2
line(a+10, a+20, a+25, a+20); //barline3
line(a+10, a+30, a+25, a+30); //barline4
line(a+40, a, a+55, a); //barline1
line(a+40, a+10, a+55, a+10); //barline2
line(a+40, a+20, a+55, a+20); //barline3
line(a+40, a+30, a+55, a+30); //barline4


//left arm
fill(100);
rect(a-80, a+3, b, b/2); //left bicep
rect(b+45, b*3, b/2+1, b+20); //left forearm
fill(#73F7C5);
ellipse(111, 216, 33, 33); //left elbow
fill(240);
rect(85, 135, 45, 15); //hand base
fill(#73F7C5);
rect(85, b*2+5, 16, b-20, b+30, 0, 0 ,0); //hand left
rect(114, b*2+5, 16, b-20, 0, b+30, 0 ,0); //hand right
line(b*2+37, a+3, b*2+37, a+28); //left bicep1
line(b*3+7, a+3, b*3+7, a+28); //left bicep2
line(b+45, b*3+10, a-80, b*3+10); //left forearm1
line(b+45, a-25, a-80, a-25); //left forearm2
line(b+45, a-10, a-80, a-10); //left forearm3

//right arm
fill(100); //grey
rect(c+30, a+3, b, b/2); //right bicep
rect(c+75, b*3, b/2+1, b+20); //right forearm
fill(#73F7C5); //mint
ellipse(c+88, a+16, 33, 33); //right elbow
fill(240);
rect(c+66, a-65, b-5, b/5+5); //hand base
fill(#73F7C5);
rect(c+66, b*2+5, b/5+6, 30, 80, 0, 0 ,0); //hand left
rect(c+95, b*2+5, b/5+6, 30, 0, 80, 0 ,0); //hand right
line(c+43, a+3, c+43, a+28); //right bicep1
line(c+63, a+3, c+63, a+28); //right bicep2
line(c+75, a-40, a*2, a-40); //right forearm1
line(c+75, 175, a*2, a-25); //right forearm2
line(c+75, a-10, a*2, a-10); //right forearm3

//pelvis and legs
fill(100); 
rect(a+30, a+75, b-10, b-20); //spine
rect(a-30, c+40, b-20, a+20); //left leg
fill(#73F7C5);
ellipse(a-15, a*2+60, b-20, b-20); //knee
fill(100);
rect(c, c+40, b-20, a+20); //right leg
fill(#73F7C5);
ellipse(c+15, a*2+60, b-20, b-20); //knee
fill(240);
ellipse(a-1, c+50, b+10, b+10); //hip
ellipse(c+1, c+50, b+10, b+10); //hip
fill(#73F7C5);
rect(a, c+20, b*2, b+10); //pelvis
fill(240);
rect(a+15, c+5, b+20, b/5+5); //pelv top attachment 
line(a-30, c+80, a, c+80); //leg1
line(a-30, a*2, a, a*2); //leg2
line(a-30, c+120, a, c+120); //leg3
line(a-30, c+140, a, c+140); //leg4
line(a-30, c+180, a, c+180); //leg5
line(a-30, c+a, a, c+a); //leg6
line(a-30, c+a+20, a, c+a+20); //leg7
line(a-30, c+a+36, a, c+a+36); //leg8
line(c, c+80, c+30, c+80); //leg9
line(c, a*2, c+30, a*2); //leg10
line(c, a*2+20, c+30, a*2+20); //leg11
line(c, a*2+40, c+30, a*2+40); //leg12
line(c, a*2+80, c+30, a*2+80); //leg13
line(c, c+a, c+30, c+a); //leg14
line(c, a*2+120, c+30, a*2+120); //leg15
line(c, a*2+136, c+30, a*2+136); //leg16

//feet
fill(#73F7C5);
arc(185, 580, 80, 80, PI, TWO_PI, PIE); //left foot
arc(315, 580, 80, 80, PI, TWO_PI, PIE); //right foot


