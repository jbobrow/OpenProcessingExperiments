
int eSize =6;
 
size(400,400);
colorMode(RGB,255);
background(80);
noStroke();
smooth();


for(int y = 0; y <=height; y += 6){
  for(int x = 0; x <=width; x += 6){

    if(x >150 && x <250 && y > 150 && y <250) { //4
  fill(400,x,18,230); }
    else if(x >100 && x <300 && y > 100 && y <300) { //3
  fill(180,x-100,x,100); } 
    else if(x >50 && x <350 && y > 50 && y <350) {//2
      fill(400,x,18,230);
  }else{
      fill(180,x-100,x,100);
    }
 rect(x, y, 10, eSize);

  } 
}


for(int x = 0; x <=400; x +=6) {
strokeWeight(2);
stroke(051,222,237,100);//221,138,252,70
line(x,0,0,199);//hidariue
stroke(221,138,252,100);//051,222,237,70
line(x,0,400,199);//migiue
stroke(181,252,139,100);//181,252,139,70
line(x,400,0,201);//hidarishita
stroke(255,138,176,100);//252,138,176,70
line(x,400,400,201);//migisita
}


noStroke(); 
fill(255,255,255,25);
quad(150,200,200,150,250,200,200,250);

noStroke(); 
fill(255,255,255,25);
quad(100,200,200,100,300,200,200,300);

noStroke(); 
fill(255,255,255,25);
quad(50,200,200,50,350,200,200,350);

noStroke(); 
fill(255,255,255,25);
quad(0,200,200,0,400,200,200,400);

noStroke(); 
fill(255,255,255,25);
quad(0-50,200,200,0-50,450,200,200,450);

noStroke(); 
fill(255,255,255,25);
quad(0-100,200,200,0-100,500,200,200,500);

noStroke(); 
fill(255,255,255,25);
quad(0-150,200,200,0-150,550,200,200,550);



