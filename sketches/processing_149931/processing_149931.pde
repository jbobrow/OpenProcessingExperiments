
size(200,200); 
background(255); 
float w = width;
while (w>=0) {
    stroke (0);
    fill(w+10);
    ellipse (100,100,w,w);
    w-=10;
}
