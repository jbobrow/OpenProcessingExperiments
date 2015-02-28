
size(510, 510);
background(255);
stroke(110);
 int diameter,top,left,i;
 
colorMode(HSB,360,30,100,100);
background(0,0,0,100);
stroke(10);
fill(210,100,100,10);
 
diameter = 300;
top = 150;
left = 150;
 
for(i=0; i<16; i++){
    ellipse(top,left,diameter,diameter);
    diameter = diameter - 20;
    
    for(i=0; i<100; i++){
    fill(random(200,240),random(50,100),random(50,100), 50);
    ellipse(random(300),random(300),diameter,diameter);
    
    
noStroke();
ellipse(width/2, height/2, i, i);

}
}




