
color[] colors = {color(145,195,106),color(22,154,71),color(104,182,130),
                  color(26,34,106),color(1,106,172),color(107,29,105),
                  color(152,20,104),color(206,27,33),color(216,77,46),
                  color(230,131,46),color(238,165,34),color(254,241,15)};
color c1 = colors[11];
color c2 = colors[3];
color c3 = colors[7];
color b1 = color(255);
color b2 = color(220);
color b3 = color(255);
PFont uni;
int button = 2;
int pick = 11;

void setup(){
  uni = loadFont("Uni.vlw");
  textFont(uni,11);
  background(255);
  size(500, 400);
  noStroke();
  fill(0);
  smooth();
}

void draw(){
  background(255);
  stroke(220);
  strokeWeight(1);
  fill(b1);
  rect(95,373,78,16);
  fill(b2);
  rect(199,373,45,16);
  fill(b3);
  rect(269,373,135,16);
  noStroke();
  fill(0);
  text("   Analogous                Triad                    Split Complement",100,385);
  fill(c3);
  quad(-1,-1,-1,401,50,401,450,-1);
  fill(c1);
  quad(50,80,50,280,200,350,200,50);
  fill(c2);
  quad(200,50,200,350,550,250,550,100);
  stroke(255);
  strokeWeight(5);
  line(65,100,65,240);
  line(65,250,65,260);
  line(65,100,160,85);
  noStroke();
  if (button == 1){
    c1 = colors[pick];
    if (pick == 0){
      c2 = colors[11];
    } else { 
      c2 = colors[(pick-1)];
    }
    if (pick == 11){
      c3 = colors[0];
    } else {
      c3 = colors[(pick+1)];
    }
  }
  if (button == 2){
    c1 = colors[pick];
    if (pick > 7){
      c2 = colors[pick-8];
    } else {
      c2 = colors[pick+4];
    }
    if (pick < 4){
      c3 = colors[pick+8];
    } else {
      c3 = colors[pick-4];
    } 
  }
  if (button == 3){
    c1 = colors[pick];
    if (pick > 6){
      c2 = colors[pick-7];
    } else {
      c2 = colors[pick+5];
    }
    if (pick < 5){
      c3 = colors[pick+7];
    } else {
      c3 = colors[pick-5];
    } 
  }
  translate(450,350);
  for(int i=0; i < 12; i++){
    rotate(.524);
    if(colors[i] == c1 || colors[i] == c2 || colors[i] == c3){
      fill(0); 
      ellipse(0,-30,17,17);
    }
    fill(colors[i]);
    ellipse(0,-30,15,15);
  }
}

void mousePressed(){
  if(mouseX > 95 && mouseX < 173 && mouseY > 373 && mouseY < 389){
    button = 1;
    b1 = color(220);
    b2 = color(255);
    b3 = color(255);
  }
    if(mouseX > 199 && mouseX < 244 && mouseY > 373 && mouseY < 389){
    button = 2;
    b1 = color(255);
    b2 = color(220);
    b3 = color(255);
  }
   if(mouseX > 269 && mouseX < 404 && mouseY > 373 && mouseY < 389){
    button = 3;
    b1 = color(255);
    b2 = color(255);
    b3 = color(220);
  }
  
  
  if (mouseX > 410 && mouseY > 310){
    for(int i=0; i<12; i++){
      if (colors[i] == get(mouseX,mouseY)){
        pick = i;
      }
    }
  }  
}


