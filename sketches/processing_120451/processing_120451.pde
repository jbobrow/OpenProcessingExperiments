

//Background
size(400,565);
background(255);
smooth();


//Circle Line
stroke(211,211,211);
strokeWeight(1);
int eSize = 20;
 for(int y =0; y <=height; y +=70){
    for(int x = 120; x <=width; x +=200){
      ellipse(x,y,eSize,eSize);
    }
 }

  for(int x = 0; x <= width; x += 40){
    if(x == 120 || x == 320){
     stroke(180,64,64);
     fill(180,64,64);
    }
  
    else{
     stroke(211,211,211);
     noFill();
    }
    ellipse(x, height/8, eSize, eSize);
    println("x=" + x);
 }


//Line
stroke(211,211,211);
line(0,355,400,210);

stroke(131,131,131);
line(0,125,400,500);

stroke(0);
line(120,0,0,500);


//Circle
stroke(211,211,211);
fill(211,211,211);
ellipse(400,565,500,500);

stroke(131,131,131);
fill(131,131,131);
ellipse(400,565,400,400);

stroke(180,98,98);
fill(180,98,98);
ellipse(400,565,200,200);

strokeWeight(3);
stroke(180,64,64);
noFill();
ellipse(400,565,250,250);


//triangle
stroke(180,98,98);
strokeWeight(1);
fill(180,98,98);
triangle(25,500,50,530,140,515);
triangle(90,355,110,390,175,420);
triangle(230,320,220,250,260,340);
triangle(365,295,380,205,385,303);


