
// taille
size(1400,800);
background(0);


// Toujours centrer
translate(width/2, height/2);

fill(#7EB9FF,0);

stroke(50,70,100,30);
for (int i=0;i<360;i+=20){
  rotate(radians(1));
  quad(0, 310, 530, 115, 170, 60, 20, 60);
}
for (int i=0;i<360;i+=10){
  rotate(radians(2));
  quad(0, 310, 530, 115, 170, 60, 20, 60);
   quad(0, 310, 1530, 115, 170, 60, 20, 60);
}

for (int i=0;i<360;i+=20){
  rotate(radians(1));
  quad(0, 310, 530, 115, 170, 60, 20, 60);
}



///////////
stroke(#657A93);

for (int i=0;i<360;i+=10){
  rotate(radians(2));
  quad(0, 310, 530, 115, 170, 60, 20, 60);
}



for (int i=0;i<360;i+=10){
  rotate(radians(5));
  quad(0, 10, 130, 15, 70, 60, 20, 60);
}
for (int i=0;i<360;i+=10){
  rotate(radians(3));
  quad(0, 30, 110, 15, 70, 60, 120, 60);
  quad(30, 0, 40, 135, 170, 60, 20, 60);
}

// pas remplir
stroke(#657A93,50);
noFill();

// option de tourné sur sois meme la forme
for (int i=0;i<360;i+=30){
  rotate(radians(2));
  quad(0, 110, 530, 115, 170, 60, 20, 60);
}
for (int i=0;i<360;i+=10){
  rotate(radians(8));
  quad(0, 0, 30, 115, 170, 60, 20, 60);
  quad(0, 0, 30, 115, 170, 60, 20, 60);
}

fill(#7EB9FF,30);
noStroke();
 
for (int i=0;i<360;i+=30){
  rotate(radians(5));
  quad(0, 30, 330, 15, 70, 360, 20, 360);
    rotate(radians(5));
  quad(0, 30, 330, 15, 70, 360, 20, 360);
 
}
 
for (int i=0;i<360;i+=50){
  rotate(radians(10));
  quad(1350, 350, 110, 05, 70, 160, 10, 80);
 
}
 
for (int i=0;i<360;i+=10){
  rotate(radians(15));
  quad(0, 35, 61, 05, 70, 60, 10, 180);
 
}
 
fill(0,40);
 
for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(350, 350, 60, 105, 70, 60, 10, 80);
 
}


stroke(50,70,100,60);
noFill();

for (int i=0;i<360;i+=20){
  rotate(radians(1));
  quad(0, 310, 530, 115, 170, 60, 20, 60);
}

stroke(50,70,100,160);
noFill();

for (int i=0;i<360;i+=5){
  rotate(radians(2));
  quad(110, 0, 1230, 115,70, 160, 20, 60);
  rotate(radians(2));
  quad(110, 0, 1230, 115,70, 160, 20, 60);
}
fill(#7EB9FF,80);
noStroke();
for (int i=0;i<360;i+=15){
  rotate(radians(5));
  quad(50, 0, 30, 15,70, 60, 20, 60);
    rotate(radians(5));
  quad(50, 0, 30, 15,70, 60, 20, 60);
}
for (int i=0;i<360;i+=50){
  rotate(radians(2));
  quad(1350, 350, 110, 05, 70, 160, 10, 80);
    rotate(radians(10));
  quad(0, 50, 10, 05, 70, 60, 10, 80);
 
}

noFill();
stroke(#D9D4FA);

// option de tourné sur sois meme la forme
for (int i=0;i<360;i+=10){
  rotate(radians(2));
  quad(0, 110, 530, 115, 170, 60, 20, 60);
}


noFill();
stroke(#D9D4FA, 90);

// option de tourné sur sois meme la forme
for (int i=0;i<360;i+=10){
  rotate(radians(2));
  quad(0, 110, 530, 115, 170, 60, 20, 60);
    rotate(radians(2));
  quad(0, 110, 530, 115, 170, 60, 20, 60);
      rotate(radians(2));
  quad(0, 110, 530, 115, 170, 60, 20, 60);
}
