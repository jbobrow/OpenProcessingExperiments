
int eSize = 10;

size(400,565);
background(255,43,0);
smooth();
//migi ue sikaku siro
rect(300,200,50,50);
//hidari sita sikaku siro
rect(30,440,100,100);

//hidari sita sikaku kuro
fill(0);
noStroke();
rect(30,440,50,50);

stroke(0);
strokeWeight(1);
//migi ue sikaku siro migi sita kado sen
line(300,200,300,565);
//migi ue sikaku siro migi ue kado sen
line(0,200,300,200);
//migi ue sikaku siro hidari ue kado sen
line(350,0,350,200);
//migi ue sikaku siro hidari sita kado sen
line(350,250,400,250);

fill(255);
noStroke();
//hidari ue en siro
ellipse(52,52,69,69);
//migi sita en siro
ellipse(350,400,69,69);
//hana kuro
fill(0,0,0);
ellipse(90,360,40,40);
ellipse(70,340,40,40);
ellipse(110,340,40,40);
ellipse(70,380,40,40);
ellipse(110,380,40,40);
//migi ue hamon moyou
noFill();
stroke(1);
ellipse(52,52,80,80);
ellipse(52,52,90,90);
ellipse(52,52,100,100);
ellipse(52,52,110,110);
ellipse(52,52,120,120);
ellipse(52,52,130,130);
ellipse(52,52,140,140);
ellipse(52,52,150,150);
ellipse(52,52,160,160);
ellipse(52,52,170,170);
ellipse(52,52,180,180);
ellipse(52,52,190,190);
ellipse(52,52,200,200);
ellipse(52,52,210,210);
//hidari sita hamon moyou
ellipse(350,400,80,80);
ellipse(350,400,90,90);
ellipse(350,400,100,100);
ellipse(350,400,110,110);
ellipse(350,400,120,120);
ellipse(350,400,130,130);
ellipse(350,400,140,140);
ellipse(350,400,150,150);
ellipse(350,400,160,160);
ellipse(350,400,170,170);
ellipse(350,400,180,180);
ellipse(350,400,190,190);
ellipse(350,400,200,200);
ellipse(350,400,210,210);


//doxtuto moyou
for(int x = 0; x <= width; x += 20){
 
  if(x == width/2){
    fill(255);
  }
  else{
    fill(0);
  }
  ellipse(x, height/2, eSize, eSize);
  println("x=" + x);
  
}



