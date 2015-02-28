
int red,yellow,green,blue,purple,black,white;
int numberOfColor = 7;
color [] colors;
int level =0;
int [] choice = new int[4];
color selectedColor;
char selectedShape;

void setup(){
  size(600,600);
  red =#FF0000;
  yellow=#FFF700;
  green=#1BA52C;
  blue=#0035FF;
  purple=#A915D3;
  black=#000000;
  white=#FFFFFF;
  smooth();
  
  colors = new color[numberOfColor];
  colors[0] = red;
  colors[1] = yellow;
  colors[2] = green;
  colors[3] = blue;
  colors[4] = purple;
  colors[5] = black;
  colors[6] = white;
  
  selectedColor = #000000; //default color is black
}

void draw(){
  if(level == 0){
    mainPage();
  }else if(level == 1){
    colorPage();
  }else if(level == 2){
    shapePage();
  }else if(level == 3){
    linePage();
  }else if(level == 4){
    finalPage();
  }
}

void mainPage(){
  background(0,10,200);
  textSize(50);
  fill(#FF057A);
  textAlign(CENTER,CENTER);
  text("E",80,height/3);
  fill(255);
  text("motion", 180, height/3);
  fill(#FF057A);
  text("V",310,height/3);
  fill(255);
  text("isualitor", 425,height/3);
  textSize(20);
  fill(150);
  text("Press any key to start", width/2, height/3*2);
  
  if(keyPressed || mousePressed)
    level=1;
}

void colorPage(){
  background(255,255,240);
  textSize(20);
  fill(0);
  text("Step1 :: Choose one color which has caught your mind", width/2, 40);
  stroke(0);
  line(0,70,width,70);
  line(0,80,width,80);
  line(0,90,width,90);
  line(0,190,width,190);
 
 for(int i=0; i < numberOfColor ; i++){
    noStroke();
    fill(colors[i]);
    rect(width/7 *i, 200, width/7 * (i+1), height);
   
    //Color Selected  
  if(mouseX >= width/7 *i && mouseX < width/7*(i+1) && mouseY >= 200 && mouseY <600){
    if(i == 6){
      fill(0,50);
      ellipse((width/7*i + width/7*(i+1))/2, 140, 42,42);
      fill(0,50);
    }else
      fill(255,50);
    rect(width/7 *i, 200, width/7 * (i+1), height);
    
    fill(colors[i]);
    ellipse((width/7*i + width/7*(i+1))/2, 140, 40,40);
    
    if(mousePressed){
      selectedColor=colors[i];
      level =2;
    }
  }
  
 }
  

  
}

void shapePage(){
  noStroke();
  background(255,255,250);
  textSize(20);
  fill(0);
  text("Step2 :: Choose one shape which has caught your mind", width/2, 40);
  
  stroke(0);
  strokeWeight(1);
  line(0,70,width,70);
  line(0,80,width,80);
  line(0,90,width,90);
  line(0,190,width,190);
  
  noStroke();
  fill(0);
  ellipse(width/5-25,140,50,50);
  triangle(width/5*2-8,140-25, width/5*2 -38, 140+25, width/5*2+28, 140+25);
  rect(width/5*3-8,140-25, 50,50);
  stroke(0);
  strokeWeight(8);
  line(width/5*4, 140-25, width/5*4+50, 140+25);
  line(width/5*4+50, 140-25, width/5*4, 140+25);
  
  if(mouseX >= width/5-25-25 && mouseX <= width/5-25+25 && mouseY >= 140-25 && mouseY <= 140+25){
    stroke(selectedColor);
    noFill();
    ellipse(width/2,height/3*2,290,290);
    if(mousePressed){
      selectedShape = 'c';
      level =3;
    }  
  }else if(mouseX >= width/5*2-38 && mouseX <= width/5*2+28 && mouseY >= 140-25 && mouseY <= 140+25){
    stroke(selectedColor);
    noFill();
    triangle(width/5*2-8,140-25, width/5*2 -38, 140+25, width/5*2+28, 140+25);
    if(mousePressed){
      selectedShape = 't';
      level =3;
    }  
  }else if(mouseX >= width/5-25-25 && mouseX <= width/5-25+25 && mouseY >= 140-25 && mouseY <= 140+25){
    stroke(selectedColor);
    noFill();
    ellipse(width/2,height/3*2,290,290);
    if(mousePressed){
      selectedShape = 'r';
      level =3;
    }  
  }else if(mouseX >= width/5-25-25 && mouseX <= width/5-25+25 && mouseY >= 140-25 && mouseY <= 140+25){
    stroke(selectedColor);
    noFill();
    ellipse(width/2,height/3*2,290,290);
    if(mousePressed){
      selectedShape = 'x';
      level =3;
    }  
  }
  
 
 
  
}


void linePage(){
  background(255,255,250);
  textSize(20);
  fill(0);
  text("Step3 :: draw one continuous line ", width/2, height/3*2);
  text("and then, press key N to go to see final !", width/2, height/3*2+40);
  
  if(keyPressed&& key=='n' || key=='N'){
    level=4;
  }
}


void finalPage(){
  background(0);
  textSize(20);
  fill(255);
  text("Your Emotion Statue !", width/2, 40);
  noStroke();
  fill(0);
  rect(5,100,600-10,500-5);
  noLoop();
  for(int i=0; i< int(random(10,100)); i++){
    float x,y,r1,r2;
    x=random(5,595);
    y=random(100,600);
    r1=random(5,200);
    r2=random(5,200);
    fill(selectedColor,random(10,100));
    ellipse(x,y,r1,r2);
  }
  
}


