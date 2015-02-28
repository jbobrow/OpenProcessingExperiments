
size(200,100);

for(int x = 5; x < width; x += 10){
    if(x >= 75 && x <= 125){
        fill(200,100,0);
    } else {
        fill(255);
    }
    ellipse(x, height/2, 10,10);
}
