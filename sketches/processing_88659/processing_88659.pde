
color fishColor;
color tuna, egg, salmon, unagi, halibut;
boolean fishEgg, stripes, nori;

void setup() {

size(500, 500);
background(220);
noStroke();

tuna = color(255, 120, 100);
egg = color(255, 250, 50);
salmon = color(255, 180, 50);
unagi = color(144, 82, 0);
halibut = color(255, 251, 180);

  
  for(int i=0; i<10; i++){
    for(int j=0; j<10; j++){
      
      pushMatrix();
      translate(i*50, j*50);
      
      switch((int)random(0,5)){
        case 0:
          sushi(tuna, (int)random(2), (int)random(2), (int)random(2));
          break;
        case 1:
          sushi(salmon, (int)random(2), (int)random(2), (int)random(2));
          break;
        case 2:
          sushi(egg, (int)random(2), (int)random(2), (int)random(2));
          break;
        case 3:
          sushi(unagi, (int)random(2), (int)random(2), (int)random(2));
          break;
        case 4:
          sushi(halibut, (int)random(2), (int)random(2), (int)random(2));
          break;
      }
      
      popMatrix();
    }
  }

}


void sushi(color fishColor, int a, int b, int c){
 
  if(a == 0){stripes = true;}
  else{stripes = false;}
  
  if(b == 0){nori = true;}
  else{nori = false;}
  
  if(c == 0){fishEgg = true;}
  else{fishEgg = false;}
  
//rice
fill(255);
ellipse(25, 26, 29, 15);

//fish part
fill(red(fishColor), green(fishColor), blue(fishColor));
beginShape();
vertex(30, 15);
vertex(40, 20);
vertex(20, 25);
vertex(10, 20);
endShape();
fill(red(fishColor)-20, green(fishColor)-20, blue(fishColor)-20);
beginShape();
vertex(10, 20);
vertex(20, 25);
vertex(20, 28);
vertex(10, 23);
endShape();
fill(red(fishColor)-40, green(fishColor)-40, blue(fishColor)-40);
beginShape();
vertex(20, 25);
vertex(40, 20);
vertex(40, 23);
vertex(20, 28);
endShape();

if(stripes){
//white stripes
stroke(255, 255, 255, 120);
line(14, 18, 23, 23);
line(19, 17, 28, 22);
line(24, 16, 33, 21);
noStroke();
}

if(nori){
//nori
fill(0);
beginShape();
vertex(18, 18);
vertex(21, 17);
vertex(34, 24);
vertex(33, 35);
vertex(30, 36);
vertex(30, 26);
vertex(18, 18);
endShape();

}

if(fishEgg){
//fish egg
fill(255, 250, 50);
ellipse(26, 20, 3, 3);
ellipse(22, 20, 3, 3);
ellipse(24, 17, 3, 3);
ellipse(24, 19, 3, 3);
}

}


