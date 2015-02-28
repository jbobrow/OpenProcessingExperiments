
size(300,300);
noFill();
background(255);
for(int i = 10; i <= 1000; i += 10) {
    for(int j = 15; j <= 2000; j += 40) {
        if(i!=j){
            strokeWeight(2);
            stroke(100,149,237,150);
            ellipse(-25,0,i/2,i);
            strokeWeight(1);
            stroke(153,50,204,200);
            ellipse(0,-15,j,j/3);
            }
        if(i=j){
            strokeWeight(15);
            stroke(255,99,71,255-(i-50));
            point(i,j);
            }
    }
}
