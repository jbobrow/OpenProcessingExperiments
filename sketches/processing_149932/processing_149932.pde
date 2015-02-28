
//size(200,200);
//background(255);
//float w = width;
//while (w>=0) {
    //stroke (0);
    //fill(w+10);
    //ellipse (100,100,w,w);
    //w-=10;
//}


size (200,200);
background(255);

for (float w=width;w>=0;w-=10) {
    stroke(0);
    fill(w);
    ellipse (width/2,height/2,w,w);
}
