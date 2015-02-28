
float object1w;
float object1h;
float object2w;
float object2h;
float object3w;
float object3h;
float stroke1;
float stroke2;
float stroke3;
float object1x;
float object1y;
float object2x;
float object2y;
float object3x;
float object3y;



object1w = random(50,200);
object1h = random(50,600);
object2w = random(50,200);
object2h = random(50,600);
object3w = random(50,200);
object3h = random(50,600);
stroke1 = random(1,10);
stroke2 = random(1,30);
stroke3 = random(1,50);




size(600,800);
background(255,255,255);


strokeWeight(stroke1); 
fill(227,158,158);
rect(100,100,object1w,object1h,20);

strokeWeight(stroke2+stroke1);
fill(216,184,211);
rect(100+object1w,100,object2w,object2h,20);


strokeWeight(stroke3+stroke1+stroke2);
fill(158,227,226);
rect(100+object1w+object2w,100,object3w,object3h,20); 


