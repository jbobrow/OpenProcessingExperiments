
size(400, 565);
background(150);
noStroke();

//arc black
fill(0);
arc(150, 150, 300, 300, -PI/3, PI/3);

//ellipse gray
fill(90);
ellipse(150, 150, 270, 270);

//line gray
strokeWeight(7);
stroke(200);
line(400, 100, 125, 100);
line(0, 200, 175, 200);

strokeWeight(1);

//quad red for
for(int x = 400; x >= 100; x --) {
  fill(255, 100, 0);
  stroke(255, 30, 30);
  quad(39+x, 40+x, 47+x, 37+x, 45+x, 44+x, 37+x, 47+x); 
}
//quad orange for
for(int y = 40; y <= 300; y ++) {
    fill(255, 0, 0);
    stroke(255, 100, 0);
    quad(10+y, -90+y, 22+y, -90+y, 15+y, -83+y, 3+y, -83+y);
}
//ellipse and quad white
noStroke();
fill(255);
ellipse(70, 140, 10, 10);
quad(89, 90, 97, 87, 95, 94, 87, 97);
//line red gradation
for(int x=140; x<=280; x += 3){
  stroke(255, 30, 30);
  line(80, 160, x, 380);
}


int eSize = 15; 

strokeWeight(2);
stroke(127);
//ellipse and rect lower right
for(int x = 390; x >=340; x -= 25){
  for(int y = 490; y <=540; y += 25){
 
    if(x == 390 || y == 490){     
      fill(255);
    }
    else if(x == 365 || y == 515){      
      fill(255, 0, 0);
    }
    else{
      fill(0);
    }
    ellipse(x, 890-x, eSize, eSize);
    rect(200, y, 650-y, 15);
  }
}


