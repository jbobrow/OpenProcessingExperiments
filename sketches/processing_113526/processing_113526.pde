
int i;
int eSize;
eSize = 15;

size(800,800);
background(0);
colorMode(HSB, 360, 100, 100,100);
noStroke();

//==========車のランプ

for(i=0; i<100; i++){
    float diameter;
    fill(0,100,100,80);
    rect(random(800),random(800),eSize,eSize);
}

//==========建物

for(i=0; i<30; i++){
    float diameter; 
    fill(random(200,240),random(10,100),random(20,80));
    diameter = random(50,300);
    rect(random(800),random(800),diameter/2,diameter);
}

//==========灯り

for(i=0; i<50; i++){
    float diameter;
    fill(60,random(50,100),random(50,100), 30);
    diameter = random(20,400);
    ellipse(random(800),random(800),diameter,diameter);
}


