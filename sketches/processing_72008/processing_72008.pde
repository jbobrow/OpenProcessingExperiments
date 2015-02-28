
PImage bunny = loadImage("MS_White_Bunny.png");
PImage elephant = loadImage("MS_Elephant.png");
background(255);
size(600, 550);
for(int i =0;i<=width;i++){
  float myHue = (255/2.5)+i*255.0/(2*width);
  stroke(myHue,205,180);
line(i,0,i,height);

}
colorMode(RGB);

noStroke();
fill(0);
float angle = 1.0;
for (int dy =0;dy<250;dy+=100) {
  for (float x=20;x<(width-40);x+=20)
  {
    if (x%10==0) {
      tint(255);
    }
          if (x%40==0) {
            tint(x-40,x-50,x);
        image(elephant, 2.1*x, x+dy,x,x);      
        println("x true");
        
      }
    else { 

      float y =dy+(width/2)*(sin(x));
      tint(255+x, y, 170);
      image(bunny, x, y);
      angle +=PI/40.0;

    }
  }
}



