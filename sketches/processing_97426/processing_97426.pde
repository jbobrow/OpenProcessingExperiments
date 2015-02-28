
int s = 0;
int h = 0;
int m = 0;


void setup (){
   size(640, 500,P3D);
   background(255);
}

void draw (){
s =second();
h =hour(); 
m =minute();
background(255);

stroke(0);
//for (int i=10; i<s+10; i=i+3) {
//  line (i,30,i,40);}


//fill (h*(255/23),m*(255/59),s*(255/59)); //win: it will change the color
//rect (0,0,width,height);

//

pushMatrix();
translate(100, 200, 0); 
rotateX(PI/60+15);
rotateY(PI/60+15);
rotateZ(PI/60*2*s);
//noFill();
box(h*2,h*2,h*2);
popMatrix();

pushMatrix();
translate(300, 200, 0); 
rotateX(PI/60*2*s);
rotateY(PI/60+15);
rotateZ(PI/60+15);
//noFill();
box(m*2,m*2,m*2); 
popMatrix();

pushMatrix();
translate(500, 200, 0); 
rotateX(PI/60+15);
rotateY(PI/60*6*s);
rotateZ(PI/60+10);
//noFill();
box(s*2,s*2,s*2); 
popMatrix();
}
