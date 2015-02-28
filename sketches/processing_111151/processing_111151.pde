
void setup() {
  
size(700,600);
}

void draw() {
  background(3,57,126);
  fill(100);
  rect(-1,500,width*2,100); //piso
  noFill();
  //céu
  stroke(255);
    point(random(0,800),random(0,220));
        
  
  //base predio
  rect(305+mouseX*(-0.3),450,100,100);
  rect(195+mouseX*(0.3),500,100,50);
  rect(505+mouseX*(-0.3),450,100,100);
  
  //meio predio
  rect(125+mouseX*(0.5),370,100,80);
  rect(-45+mouseX*(0.7),290,100,80);
  rect(645+mouseX*(-0.7),290,100,80);
  rect(615+mouseX*(-0.9),210,100,80);
  
  rect(620+mouseX*(-1.2),130,100,80);
  rect(49+mouseX+(1.2),130,100,80);
  
  //topo
  fill(114,117,79);
  rect(200,70,300,60);
  fill(0);
  stroke(0);
  rect(201,80,298,5);
  rect(300,110,100,10);
  
  //pilastras 
  fill(150);
  if(mouseY < 210) {  
    rect(320,130,10,80);
  rect(370,130,10,80);
  
  }
  
  if(mouseY < 290) {
  rect(220,210,10,80);
  rect(270,210,10,80);
  
  rect(420,210,10,80);
  rect(470,210,10,80);
  }
  
  if(mouseY<370) {
  rect(320,290,10,80);
  rect(370,290,10,80);
  }
  
  if(mouseY<450){
  rect(220,370,10,80);
  rect(270,370,10,80);
  
  rect(420,370,10,80);
  rect(470,370,10,80);
  }
  
  if(mouseY<500) {
  rect(320,450,10,50);
  rect(370,450,10,50);
  }
  
 //preenchimento 
 
  for( int a=200; a<300; a+=20){
    for( int b=130; b<210; b+=20) {
      fill(random(100,200));
    rect(-150+a+mouseX,b,20,20);
    rect(420+a+mouseX*(-1.2),b,20,20);
    rect(415+a+mouseX*(-0.9),b+80,20,20);
    rect(-245+a+mouseX*(0.7),b+160,20,20);
    rect(445+a+mouseX*(-0.7),b+160,20,20);
    rect(-75+a+mouseX*(0.5),b+240,20,20);
    }
  }
  
    for( int c=200; c<300; c+=20){
    for( int d=450; d<550; d+=20) {
      fill(random(100,200));
      rect(105+c+mouseX*(-0.3),d,20,20);
      rect(305+c+mouseX*(-0.3),d,20,20);
    }
    }
    
    for( int e=300; e<400; e+=20) {
      for( int f=500; f<550; f+=25) {
        fill(random(100,200));
        rect(-105+e+mouseX*(0.3),f,20,25);
      }
    }
//arvores
noStroke();
fill(150,233,27,150);
ellipse(100,560,60,60);
ellipse(150,540,60,70);
ellipse(195,550,50,50);
ellipse(240,570,70,70);
ellipse(300,545,60,60);
ellipse(350,550,70,60);
ellipse(400,560,60,50);
ellipse(450,555,70,70);
ellipse(500,540,60,60);
ellipse(540,570,50,50);

fill(34,94,20,235);
ellipse(125,580,70,70);
ellipse(300,545,60,60);
ellipse(500,540,60,60);
ellipse(250,585,70,70);
ellipse(400,580,75,65);
ellipse(445,570,75,65);
}
