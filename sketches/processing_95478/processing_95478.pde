
background(242,255,254); size(600,600);
smooth(); noStroke();

fill(150,120,250);ellipse(300,300,500,500);
fill(20,250,150);ellipse(300,300,480,480);
fill(50,50,150);ellipse(300,300,460,460);
fill(20,55,105);ellipse(300,300,440,440);
fill(210,220,10);ellipse(300,300,420,420);
fill(0,108,255);ellipse(300,300,400,400);
fill(0,249,255);ellipse(300,300,380,380);
fill(20,55,105);ellipse(300,300,360,360);
fill(210,220,10);ellipse(300,300,340,340);
fill(220,250,150);ellipse(300,300,320,320);
fill(120,250,150);ellipse(300,300,300,300);
fill(100,220,50);ellipse(300,300,280,280);
fill(150,120,250);ellipse(300,300,260,260);
fill(20,250,150);ellipse(300,300,240,240);
fill(50,50,150);ellipse(300,300,220,220);
fill(20,55,105);ellipse(300,300,200,200);
fill(210,220,10);ellipse(300,300,180,180);
fill(20,250,150);ellipse(300,300,160,160);
fill(50,50,150);ellipse(300,300,140,140);
fill(20,55,105);ellipse(300,300,120,120);

fill(124,5,88);ellipse(300,300,300,300);
fill(124,5,5);ellipse(300,300,280,280);
fill(255,5,5);ellipse(300,300,260,260);
fill(255,146,146);ellipse(300,300,240,240);
fill(255,133,225);ellipse(300,300,220,220);
fill(124,5,88);ellipse(300,300,200,200);
fill(124,5,5);ellipse(300,300,180,180);
fill(255,5,5);ellipse(300,300,160,160);
fill(255,146,146);ellipse(300,300,140,140);
fill(255,133,225,250);ellipse(300,300,120,120);

fill(255,85,200);ellipse(300,300,100,100);
fill(255,128,150);ellipse(300,300,80,80);
fill(250,255,0);ellipse(300,300,60,60);
fill(255,124,0);ellipse(300,300,40,40);
fill(255,244,133);ellipse(300,300,20,20);





// Petal 1
fill(20,55,105);
noStroke();
ellipse(300,235,80,270);

pushMatrix();

translate(300,300);
for(int i=0; i<80; i++){
    
    rotate(PI/8);
    fill(210,220,10);
    noStroke();
    ellipse(0,65,80,270);
}
popMatrix();
 
// Petal 2

pushMatrix();

translate(300,300);
for(int i=0; i<80; i++){
    
    rotate(PI/4);
    fill(150,120,250);
    noStroke();
    ellipse(0,65,120,280);
}
popMatrix();

//Petal 3

pushMatrix();

translate(300,300);
for(int i=0; i<80; i++){
    
    rotate(PI/8);
    fill(255,244,133);
    noStroke();
    ellipse(0,65,80,200);
}
popMatrix();


// Petal 4
fill(255,133,225);
noStroke();
ellipse(300,235,40,180);

pushMatrix();

translate(300,300);
for(int i=0; i<60; i++){
    
    rotate(PI/8);
    fill(255,146,146);
    noStroke();
    ellipse(0,65,40,180);
}
popMatrix();
 
// Petal 5

pushMatrix();

translate(300,300);
for(int i=0; i<60; i++){
    
    rotate(PI/4);
    fill(255,5,5);
    noStroke();
    ellipse(0,65,60,140);
}
popMatrix();

//Petal 6

pushMatrix();

translate(300,300);
for(int i=0; i<60; i++){
    
    rotate(PI/8);
    fill(124,5,5);
    noStroke();
    ellipse(0,65,14,200);
}
popMatrix();

// Petal 7
fill(255,244,133);
noStroke();
ellipse(300,235,20,90);

pushMatrix();

translate(300,300);
for(int i=0; i<30; i++){
    
    rotate(PI/8);
    fill(255,124,0);
    noStroke();
    ellipse(0,65,20,90);
}
popMatrix();
 
// Petal 8

pushMatrix();

translate(300,300);
for(int i=0; i<30; i++){
    
    rotate(PI/4);
    fill(250,255,0);
    noStroke();
    ellipse(0,65,30,70);
}
popMatrix();

//Petal 

pushMatrix();

translate(300,300);
for(int i=0; i<30; i++){
    
    rotate(PI/8);
    fill(255,128,0);
    noStroke();
    ellipse(0,65,7,100);
}

popMatrix();

rect(297,297,5,5);







