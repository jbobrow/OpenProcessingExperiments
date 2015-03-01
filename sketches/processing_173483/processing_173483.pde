

size (600,600);
//background(150);

for(int x=-10; x<700; x=x+100){

 for(int y=-10; y<700; y=y+100){
  smooth (10);
   fill(100,30,150,20);
   
   strokeWeight (2.5);
   stroke (0,38,0);
   ellipse(x,y,200,200);
   
   strokeWeight (3);
   stroke (0,0,250);
   ellipse(x,y,100,100);
   
    strokeWeight (12);
   stroke (0,200,0);
   ellipse(x,y,50,50);
   
    strokeWeight (3);
   stroke (100,0,390);
   ellipse(x,y,25,25);
   
    strokeWeight (7);
   stroke (200,10,10);
   ellipse(x,y,25/6,25/6);
   
 strokeWeight (6);
   stroke (100,100,150);
   ellipse(x,y,150,150);

 }
}
 filter(BLUR, 3);
filter(POSTERIZE, 20);

