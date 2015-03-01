
int eSize =10;
size(400, 400);
colorMode(RGB, 400);
background(400);
noStroke();                                                      

for (int y = 0; y <=400; y += 20) {
  for (int x = 0; x <= 400; x += 20) {

    fill(200-y, 160-x, 30-y, 250);
    ellipse(x, y, 30, 30);

 
    ellipse(x, y, 15, 30);

 
    ellipse(x, y, 15, 3);
  }
}


for (int c = 0; c <400; c += 40) {
  for (int d = 0; d <200; d +=40) {


    fill(240-c, 40-c, 30-c, 100);
    ellipse(c, d, 30, 30);

    fill(240-c, 40-c, 30-c, 100);
    ellipse(d, c, 15, 30);

    fill(240-c, 40-c, 30-c, 100);
    ellipse(d, c, 15, 3);
  }
}
for (int y = 0; y <=400; y += 80) {
  for (int x = 0; x <= 400; x += 100) {

    fill(80-y, 10-x, 200-y, 250);
    ellipse(x, y, 30, 30);

    fill(80-y, 10-x, 200-y, 250);
    ellipse(x, y, 15, 30);

    fill(80+y, 10+x, 200+y, 250);
    ellipse(x, y, 15, 3);
  }
}

for (int y = 0; y <=400; y += 70) {
  for (int x = 0; x <= 400; x += 140) {

    fill(30-y, 125-x, 240-y, 250);
    ellipse(x, y, 30, 30);

    fill(30-y, 125-x, 240-y, 250);
    ellipse(x, y, 15, 30);

   fill(30-y, 125-x, 240-y, 250);
    ellipse(x, y, 15, 3);
  }
}

 
 for(int k = 0; k <=width; k += 400){
   
   if(k == 100 || k ==360 ){
   fill(255);
   }else{
   fill(0);
   }
 ellipse(k, height/2, eSize,eSize);
println(k);}





for (int y=0; y<=height; y+=20) {
  for (int x=0; x<=width; x+=20) {
    
    if(x >100 && x < 300 && y>100 && y <300|| x < 50){
      stroke(0);
      fill(60,200,150,30);
    } else if( x >350){
      noStroke();
      fill(255);
    }else{
      stroke(0);
      fill(0);
      }



    ellipse(x, y, eSize, eSize);
    println(x);
  }
}


