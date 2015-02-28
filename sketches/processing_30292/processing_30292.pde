
smooth();
colorMode(HSB,100);
for(int a=80; a>30; a-=5){
 fill(map(a, 80, 30,10,100),100,100,10);
 ellipse(0,100,10+a*3,10+a*3);
}
                                
