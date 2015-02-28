
float angle = 0;
float sizeA = 18;
float sizeB = 74;
float sizeC = 37;
float multiA = 1;
float multiB = -1;
float multiC = 1;


void setup(){
size(490, 490);
rectMode(CENTER);
}

void draw(){
background(255);
stroke(139, 149, 141);
noFill();
rect(245, 245, 390, 390);


pushMatrix();
translate(245, 245);
angle = angle + 0.01;

if (sizeA > 74){
    multiA = -1;
}
if (sizeA < 18){
    multiA = 1;
} 
sizeA = sizeA+(1*multiA);

if (sizeB > 74){
    multiB = -1;
}
if (sizeB < 37){
    multiB = 1;
} 
sizeB = sizeB+(1*multiB);

if (sizeC > 74){
    multiC = -1;
}
if (sizeC < 37){
    multiC = 1;
} 
sizeC = sizeC+(1*multiC);


rotate(angle);
line(90-245, 245-245, 400-245, 245-245);
ellipse(150-245, 245-245, sizeA, sizeA);
ellipse(300-245, 245-245, sizeB, sizeB);    
ellipse(300-245, 245-245, sizeC, sizeC);    
ellipse(337-245, 245-245, sizeC, sizeC);

popMatrix();

}

